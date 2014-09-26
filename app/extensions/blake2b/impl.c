#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include "cpuid.h"
#include "blake2b.h"

enum blake2b_constants {
	BLAKE2B_BLOCKBYTES = 128,
	BLAKE2B_STRIDE = BLAKE2B_BLOCKBYTES,
	BLAKE2B_STRIDE_NONE = 0,
	BLAKE2B_HASHBYTES  = 64,
	BLAKE2B_KEYBYTES = 32,
};

typedef struct blake2b_state_internal_t {
	unsigned char h[64];
	unsigned char t[16];
	unsigned char f[16];
	size_t leftover;
	unsigned char buffer[BLAKE2B_BLOCKBYTES];
} blake2b_state_internal;

typedef struct blake2b_impl_t {
	unsigned long cpu_flags;
	const char *desc;

	void (*blake2b_blocks)(blake2b_state_internal *state, const unsigned char *in, size_t bytes, size_t stride);
} blake2b_impl_t;

#define BLAKE2B_DECLARE(ext) \
	void blake2b_blocks_##ext(blake2b_state_internal *state, const unsigned char *in, size_t bytes, size_t stride);

#define BLAKE2B_IMPL(cpuflags, desc, ext) \
	{(cpuflags), desc, blake2b_blocks_##ext}

#if defined(ARCH_X86)
	/* 32 bit only implementations */
	#if defined(CPU_32BITS)
		#if defined(HAVE_SSE2)
			BLAKE2B_DECLARE(sse2)
			#define BLAKE2B_SSE2 BLAKE2B_IMPL(CPUID_X86, "sse2", sse2)
		#endif

		#if defined(HAVE_SSSE3)
			BLAKE2B_DECLARE(ssse3)
			#define BLAKE2B_SSSE3 BLAKE2B_IMPL(CPUID_X86, "ssse3", ssse3)
		#endif
	#endif

	/* 64 bit only implementations */
	#if defined(CPU_64BITS)
	#endif

	/* both 32 and 64 bits */
	BLAKE2B_DECLARE(x86)
	#define BLAKE2B_X86 BLAKE2B_IMPL(CPUID_X86, "x86", x86)

	#if defined(HAVE_AVX)
		BLAKE2B_DECLARE(avx)
		#define BLAKE2B_AVX BLAKE2B_IMPL(CPUID_AVX, "avx", avx)
	#endif

	#if defined(HAVE_XOP)
		BLAKE2B_DECLARE(xop)
		#define BLAKE2B_XOP BLAKE2B_IMPL(CPUID_XOP, "xop", xop)
	#endif

	#if defined(HAVE_AVX2)
		BLAKE2B_DECLARE(avx2)
		#define BLAKE2B_AVX2 BLAKE2B_IMPL(CPUID_AVX2, "avx2", avx2)
	#endif
#endif

#if defined(ARCH_ARM)
	#if defined(HAVE_ARMv6)
		BLAKE2B_DECLARE(armv6)
		#define BLAKE2B_ARMv6 BLAKE2B_IMPL(CPUID_ARMv6, "armv6", armv6)
	#endif

	#if defined(HAVE_NEON)
		BLAKE2B_DECLARE(neon)
		#define BLAKE2B_NEON BLAKE2B_IMPL(CPUID_NEON, "neon", neon)
	#endif
#endif

/* the "always runs" version */
#if defined(CPU_64BITS)
	#define BLAKE2B_GENERIC BLAKE2B_IMPL(CPUID_GENERIC, "generic/64", ref)
	#include "blake2b/blake2b_ref-64.inc"
#elif defined(CPU_32BITS)
	#if defined(HAVE_INT64)
		#define BLAKE2B_GENERIC BLAKE2B_IMPL(CPUID_GENERIC, "generic/3264", ref)
		#include "blake2b/blake2b_ref-3264.inc"
	#else
		#define BLAKE2B_GENERIC BLAKE2B_IMPL(CPUID_GENERIC, "generic/32", ref)
		#include "blake2b/blake2b_ref-32.inc"
	#endif
#elif defined(CPU_16BITS)
	#define BLAKE2B_GENERIC BLAKE2B_IMPL(CPUID_GENERIC, "generic/16", ref)
	#include "blake2b/blake2b_ref-16.inc"
#else
	#define BLAKE2B_GENERIC BLAKE2B_IMPL(CPUID_GENERIC, "generic/8", ref)
	#include "blake2b/blake2b_ref-8.inc"
#endif


/* list implemenations from most optimized to least, with generic as the last entry */
static const blake2b_impl_t blake2b_list[] = {
	/* x86 */
	#if defined(BLAKE2B_AVX2)
		BLAKE2B_AVX2,
	#endif
	#if defined(BLAKE2B_XOP)
		BLAKE2B_XOP,
	#endif
	#if defined(BLAKE2B_AVX)
		BLAKE2B_AVX,
	#endif
	#if defined(BLAKE2B_SSSE3)
		BLAKE2B_SSSE3,
	#endif
	#if defined(BLAKE2B_SSE2)
		BLAKE2B_SSE2,
	#endif
	#if defined(BLAKE2B_X86)
		BLAKE2B_X86,
	#endif

	/* arm */
	#if defined(BLAKE2B_NEON)
		BLAKE2B_NEON,
	#endif
	#if defined(BLAKE2B_ARMv6)
		BLAKE2B_ARMv6,
	#endif

	BLAKE2B_GENERIC
};

BLAKE2B_DECLARE(bootup)

static const blake2b_impl_t blake2b_bootup_impl = {
	CPUID_GENERIC,
	NULL,
	blake2b_blocks_bootup
};

static const blake2b_impl_t *blake2b_opt = &blake2b_bootup_impl;


/* is the pointer not aligned on a word boundary? */
static int
blake2b_not_aligned(const void *p) {
#if !defined(CPU_8BITS)
	return ((size_t)p & (sizeof(size_t) - 1)) != 0;
#else
	return 0;
#endif
}

static const union endian_test_t {
	unsigned char b[2];
	unsigned short s;
} blake2b_endian_test = {{1, 0}};

/* copy the hash from the internal state */
static void
blake2b_store_hash(blake2b_state_internal *state, unsigned char *hash) {
	if (blake2b_endian_test.s == 0x0001) {
		memcpy(hash, state->h, 64);
	} else {
		size_t i, j;
		for (i = 0; i < 8; i++, hash += 8) {
			for (j = 0; j < 8; j++)
				hash[7 - j] = state->h[(i * 8) + j];
		}
	}
}

/*
	Blake2b initialization constants for serial mode:

	0x6a09e667f3bcc908 ^ 0x0000000001010040;
	0xbb67ae8584caa73b
	0x3c6ef372fe94f82b
	0xa54ff53a5f1d36f1
	0x510e527fade682d1
	0x9b05688c2b3e6c1f
	0x1f83d9abfb41bd6b
	0x5be0cd19137e2179
*/

static const unsigned char blake2b_init_le[64] = {
	0x08^0x40,0xc9^0x00,0xbc^0x01,0xf3^0x01,0x67^0x00,0xe6^0x00,0x09^0x00,0x6a^0x00,
	0x3b,0xa7,0xca,0x84,0x85,0xae,0x67,0xbb,
	0x2b,0xf8,0x94,0xfe,0x72,0xf3,0x6e,0x3c,
	0xf1,0x36,0x1d,0x5f,0x3a,0xf5,0x4f,0xa5,
	0xd1,0x82,0xe6,0xad,0x7f,0x52,0x0e,0x51,
	0x1f,0x6c,0x3e,0x2b,0x8c,0x68,0x05,0x9b,
	0x6b,0xbd,0x41,0xfb,0xab,0xd9,0x83,0x1f,
	0x79,0x21,0x7e,0x13,0x19,0xcd,0xe0,0x5b,
};

/*
static const unsigned char blake2b_init_be[64] = {
	0x6a^0x00,0x09^0x00,0xe6^0x00,0x67^0x00,0xf3^0x01,0xbc^0x01,0xc9^0x00,0x08^0x40,
	0xbb,0x67,0xae,0x85,0x84,0xca,0xa7,0x3b,
	0x3c,0x6e,0xf3,0x72,0xfe,0x94,0xf8,0x2b,
	0xa5,0x4f,0xf5,0x3a,0x5f,0x1d,0x36,0xf1,
	0x51,0x0e,0x52,0x7f,0xad,0xe6,0x82,0xd1,
	0x9b,0x05,0x68,0x8c,0x2b,0x3e,0x6c,0x1f,
	0x1f,0x83,0xd9,0xab,0xfb,0x41,0xbd,0x6b,
	0x5b,0xe0,0xcd,0x19,0x13,0x7e,0x21,0x79,
};
*/

/* initialize the state in serial mode */
LIB_PUBLIC void
blake2b_init(blake2b_state *S) {
	blake2b_state_internal *state = (blake2b_state_internal *)S;
	/* assume state is fully little endian for now */
	memcpy(state, blake2b_init_le, 64);
	/*memcpy(state, (blake2b_endian_test.s == 1) ? blake2b_init_le : blake2b_init_be, 64);*/
	memset(state->t, 0, sizeof(state->t) + sizeof(state->f) + sizeof(state->leftover));
}

/* initialized the state in serial-key'd mode */
LIB_PUBLIC void
blake2b_keyed_init(blake2b_state *S, const unsigned char *key, size_t keylen) {
	unsigned char k[BLAKE2B_BLOCKBYTES] = {0};
	if (keylen > BLAKE2B_KEYBYTES) {
		fprintf(stderr, "key size larger than %u passed to blake2b_keyed_init", BLAKE2B_KEYBYTES);
		exit(-1);
	} else {
		memcpy(k, key, keylen);
	}
	blake2b_init(S);
	blake2b_update(S, k, BLAKE2B_BLOCKBYTES);
}

/* hash inlen bytes from in, which may or may not be word aligned, returns the number of bytes used */
static size_t
blake2b_consume_blocks(blake2b_state_internal *state, const unsigned char *in, size_t inlen) {
	/* always need to leave at least BLAKE2B_BLOCKBYTES in case this is the final block */
	if (inlen <= BLAKE2B_BLOCKBYTES)
		return 0;

	inlen = ((inlen - 1) & ~(BLAKE2B_BLOCKBYTES - 1));
	if (blake2b_not_aligned(in)) {
		/* copy the unaligned data to an aligned buffer and process in chunks */
		unsigned char buffer[16 * BLAKE2B_BLOCKBYTES];
		size_t left = inlen;
		while (left) {
			const size_t bytes = (left > sizeof(buffer)) ? sizeof(buffer) : left;
			memcpy(buffer, in, bytes);
			blake2b_opt->blake2b_blocks(state, buffer, bytes, BLAKE2B_STRIDE);
			in += bytes;
			left -= bytes;
		}
	} else {
		/* word aligned, handle directly */
		blake2b_opt->blake2b_blocks(state, in, inlen, BLAKE2B_STRIDE);
	}

	return inlen;
}

/* update the hash state with inlen bytes from in */
LIB_PUBLIC void
blake2b_update(blake2b_state *S, const unsigned char *in, size_t inlen) {
	blake2b_state_internal *state = (blake2b_state_internal *)S;
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
			blake2b_opt->blake2b_blocks(state, state->buffer, BLAKE2B_BLOCKBYTES, BLAKE2B_STRIDE_NONE);
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
LIB_PUBLIC void
blake2b_final(blake2b_state *S, unsigned char *hash) {
	blake2b_state_internal *state = (blake2b_state_internal *)S;
	memset(&state->f[0], 0xff, 8);
	blake2b_opt->blake2b_blocks(state, state->buffer, state->leftover, BLAKE2B_STRIDE_NONE);
	blake2b_store_hash(state, hash);
}

/* one-shot hash inlen bytes from in */
LIB_PUBLIC void
blake2b(unsigned char *hash, const unsigned char *in, size_t inlen) {
	blake2b_state S;
	blake2b_state_internal *state = (blake2b_state_internal *)&S;
	size_t bytes;

	blake2b_init(&S);

	/* hash until <= 128 bytes left */
	bytes = blake2b_consume_blocks(state, in, inlen);
	in += bytes;
	inlen -= bytes;

	/* final block */
	memset(&state->f[0], 0xff, 8);
	blake2b_opt->blake2b_blocks(state, in, inlen, BLAKE2B_STRIDE_NONE);
	blake2b_store_hash(state, hash);
}

LIB_PUBLIC void
blake2b_keyed(unsigned char *hash, const unsigned char *in, size_t inlen, const unsigned char *key, size_t keylen) {
	blake2b_state S;
	blake2b_keyed_init(&S, key, keylen);
	blake2b_update(&S, in, inlen);
	blake2b_final(&S, hash);
}



/* initialize the state in serial mode, setting the counter to 0xffffffffffffffff */
static void
blake2b_init_test(blake2b_state *S) {
	blake2b_state_internal *state = (blake2b_state_internal *)S;
	/*memcpy(state, (blake2b_endian_test.s == 1) ? blake2b_init_le : blake2b_init_be, 64);*/
	memcpy(state, blake2b_init_le, 64);
	memset(state->t, 0xff, sizeof(state->t));
	memset(state->f, 0x00, sizeof(state->f));
	state->leftover = 0;
}

/* hashes with the counter starting at 0xffffffffffffffff */
static void
blake2b_test(unsigned char *hash, const unsigned char *in, size_t inlen) {
	blake2b_state S;
	blake2b_state_internal *state = (blake2b_state_internal *)&S;
	size_t bytes;

	blake2b_init_test(&S);

	/* hash until <= 128 bytes left */
	bytes = blake2b_consume_blocks(state, in, inlen);
	in += bytes;
	inlen -= bytes;

	/* final block */
	memset(&state->f[0], 0xff, 8);
	blake2b_opt->blake2b_blocks(state, in, inlen, BLAKE2B_STRIDE_NONE);
	blake2b_store_hash(state, hash);
}

/* hash the hashes of [],[0],[0,1],[0,1,2]..[0,1,..511] with the counter starting at 0xffffffffffffffff */
static int
blake2b_test_impl(const void *impl) {
	static const unsigned char expected[BLAKE2B_HASHBYTES] = {
		0xf8,0xc6,0x6d,0x48,0xd1,0xbf,0x16,0xe5,0x9d,0x4d,0x7a,0x02,0xe1,0x86,0x42,0x1e,
		0x41,0xb5,0x44,0xc6,0xb5,0xf2,0xc2,0x3f,0x18,0x97,0xaa,0x47,0x20,0x00,0x06,0xfa,
		0xc9,0x65,0xad,0xb4,0xde,0x90,0x52,0x9d,0x79,0x56,0xe9,0xb4,0xf8,0x46,0x66,0x19,
		0x5e,0xaa,0xeb,0xad,0xfb,0xdc,0x8e,0xcc,0x9b,0x62,0xa2,0xb0,0xc2,0xa6,0xd4,0xaa,
	};
	static size_t len = 512;
	blake2b_state st;
	unsigned char buf[512], hash[BLAKE2B_HASHBYTES];
	size_t i;

	blake2b_opt = (blake2b_impl_t *)impl;

	for(i = 0; i < len; i++)
		buf[i] = (unsigned char)i;

	blake2b_init_test(&st);
	for(i = 0; i <= len; i++) {
		blake2b_test(hash, buf, i);
		blake2b_update(&st, hash, BLAKE2B_HASHBYTES);
	}
	blake2b_final(&st, hash);
	return memcmp(expected, hash, BLAKE2B_HASHBYTES);
}

LIB_PUBLIC int
blake2b_startup(void) {
	const void *opt = LOCAL_PREFIX(cpu_select)(blake2b_list, sizeof(blake2b_impl_t), blake2b_test_impl);
	if (opt) {
		blake2b_opt = (const blake2b_impl_t *)opt;
		return 0;
	} else {
		return 1;
	}
}

void
blake2b_blocks_bootup(blake2b_state_internal *state, const unsigned char *in, size_t bytes, size_t stride) {
	if (blake2b_startup() == 0) {
		blake2b_opt->blake2b_blocks(state, in, bytes, stride);
	} else {
		fprintf(stderr, "blake2b failed to startup\n");
		exit(1);
	}
}


#if defined(UTILITIES)

#include <stdio.h>
#include <string.h>
#include "fuzz.h"
#include "bench.h"

static const fuzz_variable_t fuzz_inputs[] = {
	{"state", FUZZ_ARRAY, 64},
	{"counter", FUZZ_ARRAY, 16},
	{"input", FUZZ_RANDOM_LENGTH_ARRAY0, 2048},
	{0, FUZZ_DONE, 0}
};

static const fuzz_variable_t fuzz_outputs[] = {
	{"hash", FUZZ_ARRAY, BLAKE2B_HASHBYTES},
	{0, FUZZ_DONE, 0}
};


/* process the input with the given implementation and write it to the output */
static void
blake2b_fuzz_impl(const void *impl, const unsigned char *in, const size_t *random_sizes, unsigned char *out) {
	const unsigned char *state = in;
	const unsigned char *counter = in + 64;
	const unsigned char *input = in + 80;
	blake2b_state st;

	/* set the current implementation to impl */
	blake2b_opt = (const blake2b_impl_t *)impl;

	/* use random data for the state and counter */
	memset(&st, 0, sizeof(st));
	memcpy(((blake2b_state_internal *)&st)->h, state, 64);
	memcpy(((blake2b_state_internal *)&st)->t, counter, 16);

	blake2b_update(&st, input, random_sizes[0]);
	blake2b_final(&st, out);
}

/* run the fuzzer on blake2b */
void
blake2b_fuzz(void) {
	fuzz_init();
	fuzz(blake2b_list, sizeof(blake2b_impl_t), fuzz_inputs, fuzz_outputs, blake2b_fuzz_impl);
}



static unsigned char *bench_arr = NULL;
static unsigned char bench_hash[BLAKE2B_HASHBYTES];
static size_t bench_len = 0;

static void
blake2b_bench_impl(const void *impl) {
	blake2b_opt = (const blake2b_impl_t *)impl;
	blake2b(bench_hash, bench_arr, bench_len);
}

void
blake2b_bench(void) {
	static const size_t lengths[] = {1, 128, 576, 8192, 0};
	size_t i;
	bench_arr = bench_get_buffer();

	for (i = 0; lengths[i]; i++) {
		bench_len = lengths[i];
		bench(blake2b_list, sizeof(blake2b_impl_t), blake2b_test_impl, blake2b_bench_impl, bench_len, "byte");
	}

}

#endif /* defined(UTILITIES) */
