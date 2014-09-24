#ifndef BLAKE2B_H
#define BLAKE2B_H

#include <stddef.h>

#if !defined(LIB_PUBLIC)
#define LIB_PUBLIC
#endif

typedef struct blake2b_state_t {
	unsigned char opaque[256];
} blake2b_state;

/* initializes to default blake2b */
void blake2b_init(blake2b_state *S);

/* hadh inlen bytes from in */
void blake2b_update(blake2b_state *S, const unsigned char *in, size_t inlen);

/* produce the final hash */
void blake2b_final(blake2b_state *S, unsigned char *hash);

/* in-place version */
void blake2b(unsigned char *hash, const unsigned char *in, const size_t inlen);

int blake2b_startup(void);

#if defined(UTILITIES)
void blake2b_fuzz(void);
void blake2b_bench(void);
#endif

#endif /* BLAKE2B_H */

