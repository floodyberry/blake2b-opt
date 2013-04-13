#include <string.h>
#include "blake2b.h"

enum blake2b_constants {
	BLAKE2B_BLOCKBYTES = 128,
	BLAKE2B_STRIDE = BLAKE2B_BLOCKBYTES,
	BLAKE2B_STRIDE_NONE = 0,
	BLAKE2B_HASHBYTES  = 64,
};

typedef struct blake2b_state_internal_t {
	uint64_t h[8];
	uint64_t t[2];
	uint64_t f[2];
	size_t   leftover;
	uint8_t  buffer[BLAKE2B_BLOCKBYTES];
} blake2b_state_internal;


extern void blake2b_blocks(blake2b_state_internal *state, const uint8_t *in, size_t bytes, size_t stride);

/* align the pointer to 64 bytes */
static blake2b_state_internal *
blake2b_align_state(const void *ptr) {
	uint8_t *aligned = (uint8_t*)ptr + 63;
	aligned -= (size_t)aligned & 63;
	return (blake2b_state_internal *)aligned;
}

/* is the pointer not aligned on a word boundary? */
static int
blake2b_not_aligned(const void *p) {
	return ((size_t)p & (sizeof(size_t) - 1)) != 0;
}

/* copy the hash from the internal state */
static void
blake2b_store_hash(blake2b_state_internal *state, uint8_t *hash) {
	static union endian_test_t { uint8_t b[2]; uint16_t s; } endian_test = {{1, 0}};
	if (endian_test.s == 0x0001) {
		uint64_t *p = (uint64_t *)hash;
		p[0] = state->h[0];
		p[1] = state->h[1];
		p[2] = state->h[2];
		p[3] = state->h[3];
		p[4] = state->h[4];
		p[5] = state->h[5];
		p[6] = state->h[6];
		p[7] = state->h[7];
	} else {
		size_t i;
		for (i = 0; i < 8; i++, hash += 8) {
			uint64_t v = state->h[i];
			hash[0] = (v      ) & 0xff;
			hash[1] = (v >>  8) & 0xff;
			hash[2] = (v >> 16) & 0xff;
			hash[3] = (v >> 24) & 0xff;
			hash[4] = (v >> 32) & 0xff;
			hash[5] = (v >> 40) & 0xff;
			hash[6] = (v >> 48) & 0xff;
			hash[7] = (v >> 56) & 0xff;
		}
	}
}

/* initialize the state in serial mode */
void
blake2b_init(blake2b_state *S) {
	blake2b_state_internal *state = blake2b_align_state(S);
	state->h[0] = 0x6a09e667f3bcc908ULL ^ 0x0000000001010040ULL;
	state->h[1] = 0xbb67ae8584caa73bULL;
	state->h[2] = 0x3c6ef372fe94f82bULL;
	state->h[3] = 0xa54ff53a5f1d36f1ULL;
	state->h[4] = 0x510e527fade682d1ULL;
	state->h[5] = 0x9b05688c2b3e6c1fULL;
	state->h[6] = 0x1f83d9abfb41bd6bULL;
	state->h[7] = 0x5be0cd19137e2179ULL;
	state->t[0] = 0;
	state->t[1] = 0;
	state->f[0] = 0;
	state->f[1] = 0;
	state->leftover = 0;
}

/* make a copy of the hash state */
void
blake2b_duplicate(blake2b_state *dst, const blake2b_state *src) {
	blake2b_state_internal *src_aligned = blake2b_align_state(src);
	memcpy(blake2b_align_state(dst), src_aligned, (12 * sizeof(uint64_t)) + (sizeof(size_t)) + src_aligned->leftover);
}

/* hash inlen bytes from in, which may or may not be word aligned, returns the number of bytes used */
static size_t
blake2b_consume_blocks(blake2b_state_internal *state, const uint8_t *in, size_t inlen) {
	/* always need to leave at least BLAKE2B_BLOCKBYTES in case this is the final block */
	if (inlen <= BLAKE2B_BLOCKBYTES)
		return 0;

	inlen = ((inlen - 1) & ~(BLAKE2B_BLOCKBYTES - 1));
	if (blake2b_not_aligned(in)) {
		/* copy the unaligned data to an aligned buffer and process in chunks */
		uint8_t buffer[16 * BLAKE2B_BLOCKBYTES];
		size_t left = inlen;
		while (left) {
			const size_t bytes = (left > sizeof(buffer)) ? sizeof(buffer) : left;
			memcpy(buffer, in, bytes);
			blake2b_blocks(state, buffer, bytes, BLAKE2B_STRIDE);
			in += bytes;
			left -= bytes;
		}
	} else {
		/* word aligned, handle directly */
		blake2b_blocks(state, in, inlen, BLAKE2B_STRIDE);
	}

	return inlen;
}

/* update the hash state with inlen bytes from in */
void
blake2b_update(blake2b_state *S, const uint8_t *in, size_t inlen) {
	blake2b_state_internal *state = blake2b_align_state(S);
	size_t bytes;

	/* blake2b processes the final <=BLOCKBYTES bytes raw, so we can only update if there are at least BLOCKBYTES+1 bytes available */
	if ((state->leftover + inlen) > BLAKE2B_BLOCKBYTES) {
		/* handle the previous data, we know there is enough for at least one block */
		if (state->leftover) {
			bytes = (BLAKE2B_BLOCKBYTES - state->leftover);
			memcpy(state->buffer + state->leftover, in, bytes);
			in += bytes;
			inlen -= bytes;
			state->leftover = 0;
			blake2b_blocks(state, state->buffer, BLAKE2B_BLOCKBYTES, BLAKE2B_STRIDE_NONE);
		}

		/* handle the direct data (if any) */
		bytes = blake2b_consume_blocks(state, in, inlen);
		inlen -= bytes;
		in += bytes;
	}

	/* handle leftover data */
	memcpy(state->buffer + state->leftover, in, inlen);
	state->leftover += inlen;
}

/* finalize the hash */
void
blake2b_final(blake2b_state *S, uint8_t *hash) {
	blake2b_state_internal *state = blake2b_align_state(S);
	state->f[0] = ~0ULL;
	blake2b_blocks(state, state->buffer, state->leftover, BLAKE2B_STRIDE_NONE);
	blake2b_store_hash(state, hash);
}

/* one-shot hash inlen bytes from in */
void
blake2b(uint8_t *hash, const uint8_t *in, size_t inlen) {
	blake2b_state S;
	blake2b_state_internal *state = blake2b_align_state(&S);
	size_t bytes;

	blake2b_init(&S);

	/* hash until <= 128 bytes left */
	bytes = blake2b_consume_blocks(state, in, inlen);
	in += bytes;
	inlen -= bytes;

	/* final block */
	state->f[0] = ~0ULL;
	blake2b_blocks(state, in, inlen, BLAKE2B_STRIDE_NONE);
	blake2b_store_hash(state, hash);
}

/* hash the hashes of [],[0],[0,1],[0,1,2]..[0,1,..255], returns 1 if valid, 0 if not */
int
blake2b_check_validity() {
	static const uint8_t expected[BLAKE2B_HASHBYTES] = {
		0x8a,0x7a,0x84,0x87,0x9a,0x57,0x0c,0x1f,0xb5,0xf5,0x85,0x22,0xe8,0xc9,0x95,0xe4,
		0x28,0xcd,0x31,0xdb,0xc0,0xe3,0xeb,0x5e,0x6f,0x5c,0x24,0xc0,0x29,0x10,0x47,0x9b,
		0x35,0x9a,0x09,0x8f,0x7e,0x88,0xbf,0xd2,0xcf,0x86,0x7f,0x4b,0x3f,0x9f,0x7a,0xaf,
		0xe2,0x84,0x51,0x53,0x2b,0xc1,0x4f,0x42,0xb0,0x98,0xdb,0x1c,0x6a,0xe6,0xa0,0x6c
	};
	static size_t len = 256;
	blake2b_state st;
	uint8_t buf[256], hash[BLAKE2B_HASHBYTES];
	size_t i;

	for(i = 0; i < len; i++)
		buf[i] = (uint8_t)i;

	blake2b_init(&st);
	for(i = 0; i <= len; i++) {
		blake2b(hash, buf, i);
		blake2b_update(&st, hash, BLAKE2B_HASHBYTES);
	}
	blake2b_final(&st, hash);
	return (memcmp(expected, hash, BLAKE2B_HASHBYTES) == 0) ? 1 : 0;
}

