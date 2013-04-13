#ifndef BLAKE2B_H
#define BLAKE2B_H

#include <stddef.h>
#include <stdint.h>

typedef struct blake2b_state_t {
	uint8_t opaque[320];
} blake2b_state;

/* initializes to default blake2b */
void blake2b_init(blake2b_state *S);

/* blake2b_state_internal is 64 byte aligned inside blake2b_state, so a simple memcpy is not enough to duplicate it */
void blake2b_duplicate(blake2b_state *dst, const blake2b_state *src);

/* hadh inlen bytes from in */
void blake2b_update(blake2b_state *S, const uint8_t *in, size_t inlen);

/* produce the final hash */
void blake2b_final(blake2b_state *S, uint8_t *hash);

/* in-place version */
void blake2b(uint8_t *hash, const uint8_t *in, const size_t inlen);

/* returns 1 if the underlying blake2b_blocks function is valid, 0 if not */
int blake2b_check_validity();

#endif /* BLAKE2B_H */

