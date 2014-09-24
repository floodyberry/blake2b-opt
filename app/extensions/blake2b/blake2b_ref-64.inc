#if defined(HAVE_INT64)
	typedef uint64_t blake2b_uint64;
	#define MASK64(x) (x)
#else
	typedef unsigned long long blake2b_uint64;
	#define MASK64(x) (x & 0xffffffffffffffffull)
#endif

static blake2b_uint64
ROTR64(blake2b_uint64 x, int k) {
	return MASK64((x >> k) | (x << (64 - k)));
}

static blake2b_uint64
U8TO64(const unsigned char *p) {
	return
		((blake2b_uint64)p[0]      ) |
		((blake2b_uint64)p[1] <<  8) |
		((blake2b_uint64)p[2] << 16) |
		((blake2b_uint64)p[3] << 24) |
		((blake2b_uint64)p[4] << 32) |
		((blake2b_uint64)p[5] << 40) |
		((blake2b_uint64)p[6] << 48) |
		((blake2b_uint64)p[7] << 56);
}

static void
U64TO8(unsigned char *p, blake2b_uint64 v) {
	p[0] = (v      ) & 0xff;
	p[1] = (v >>  8) & 0xff;
	p[2] = (v >> 16) & 0xff;
	p[3] = (v >> 24) & 0xff;
	p[4] = (v >> 32) & 0xff;
	p[5] = (v >> 40) & 0xff;
	p[6] = (v >> 48) & 0xff;
	p[7] = (v >> 56) & 0xff;
}

static void
blake2b_blocks_ref(blake2b_state_internal *S, const unsigned char *in, size_t bytes, size_t stride) {
	const blake2b_uint64 f0 = U8TO64(&S->f[0]);
	const blake2b_uint64 f1 = U8TO64(&S->f[8]);

	const blake2b_uint64 w8 = 0x6a09e667f3bcc908ull;
	const blake2b_uint64 w9 = 0xbb67ae8584caa73bull;
	const blake2b_uint64 w10 = 0x3c6ef372fe94f82bull;
	const blake2b_uint64 w11 = 0xa54ff53a5f1d36f1ull;
	const blake2b_uint64 w12 = 0x510e527fade682d1ull;
	const blake2b_uint64 w13 = 0x9b05688c2b3e6c1full;
	const blake2b_uint64 w14 = 0x1f83d9abfb41bd6bull ^ f0;
	const blake2b_uint64 w15 = 0x5be0cd19137e2179ull ^ f1;

	const size_t inc = (bytes >= 128) ? 128 : bytes;

	blake2b_uint64 t0 = U8TO64(&S->t[0]);
	blake2b_uint64 t1 = U8TO64(&S->t[8]);

	blake2b_uint64 h0 = U8TO64(&S->h[0]);
	blake2b_uint64 h1 = U8TO64(&S->h[8]);
	blake2b_uint64 h2 = U8TO64(&S->h[16]);
	blake2b_uint64 h3 = U8TO64(&S->h[24]);
	blake2b_uint64 h4 = U8TO64(&S->h[32]);
	blake2b_uint64 h5 = U8TO64(&S->h[40]);
	blake2b_uint64 h6 = U8TO64(&S->h[48]);
	blake2b_uint64 h7 = U8TO64(&S->h[56]);

	blake2b_uint64 v0,v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11,v12,v13,v14,v15;
	unsigned char buffer[128];

	if (f0) {
		memset(buffer, 0, sizeof(buffer));
		memcpy(buffer, in, bytes);
		in = buffer;
	}

	while (1) {
		const blake2b_uint64 m0 = U8TO64(in + 0);
		const blake2b_uint64 m1 = U8TO64(in + 8);
		const blake2b_uint64 m2 = U8TO64(in + 16);
		const blake2b_uint64 m3 = U8TO64(in + 24);
		const blake2b_uint64 m4 = U8TO64(in + 32);
		const blake2b_uint64 m5 = U8TO64(in + 40);
		const blake2b_uint64 m6 = U8TO64(in + 48);
		const blake2b_uint64 m7 = U8TO64(in + 56);
		const blake2b_uint64 m8 = U8TO64(in + 64);
		const blake2b_uint64 m9 = U8TO64(in + 72);
		const blake2b_uint64 m10 = U8TO64(in + 80);
		const blake2b_uint64 m11 = U8TO64(in + 88);
		const blake2b_uint64 m12 = U8TO64(in + 96);
		const blake2b_uint64 m13 = U8TO64(in + 104);
		const blake2b_uint64 m14 = U8TO64(in + 112);
		const blake2b_uint64 m15 = U8TO64(in + 120);

		t0 += inc;
		if (t0 < inc)
			t1 += 1;

		v0 = h0;
		v1 = h1;
		v2 = h2;
		v3 = h3;
		v4 = h4;
		v5 = h5;
		v6 = h6;
		v7 = h7;
		v8 = w8;
		v9 = w9;
		v10 = w10;
		v11 = w11;
		v12 = w12 ^ t0;
		v13 = w13 ^ t1;
		v14 = w14;
		v15 = w15;

		#define Gs(v0,v1,v2,v3,m,r1,r2) \
			v0 += m + v1; \
			v3 ^= v0; \
			v3 = ROTR64(v3,r1); \
			v2 += v3; \
			v1 ^= v2; \
			v1 = ROTR64(v1,r2);

		#define ROUND(m0,m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12,m13,m14,m15) \
			Gs(v0,v4, v8,v12, m0, 32,24) \
			Gs(v0,v4, v8,v12, m1, 16,63) \
			Gs(v1,v5, v9,v13, m2, 32,24) \
			Gs(v1,v5, v9,v13, m3, 16,63) \
			Gs(v2,v6,v10,v14, m4, 32,24) \
			Gs(v2,v6,v10,v14, m5, 16,63) \
			Gs(v3,v7,v11,v15, m6, 32,24) \
			Gs(v3,v7,v11,v15, m7, 16,63) \
			Gs(v0,v5,v10,v15, m8, 32,24) \
			Gs(v0,v5,v10,v15, m9, 16,63) \
			Gs(v1,v6,v11,v12,m10, 32,24) \
			Gs(v1,v6,v11,v12,m11, 16,63) \
			Gs(v2,v7, v8,v13,m12, 32,24) \
			Gs(v2,v7, v8,v13,m13, 16,63) \
			Gs(v3,v4, v9,v14,m14, 32,24) \
			Gs(v3,v4, v9,v14,m15, 16,63)

		ROUND( m0, m1, m2, m3, m4, m5, m6, m7, m8, m9,m10,m11,m12,m13,m14,m15)
		ROUND(m14,m10, m4, m8, m9,m15,m13, m6, m1,m12, m0, m2,m11, m7, m5, m3)
		ROUND(m11, m8,m12, m0, m5, m2,m15,m13,m10,m14, m3, m6, m7, m1, m9, m4)
		ROUND( m7, m9, m3, m1,m13,m12,m11,m14, m2, m6, m5,m10, m4, m0,m15, m8)
		ROUND( m9, m0, m5, m7, m2, m4,m10,m15,m14, m1,m11,m12, m6, m8, m3,m13)
		ROUND( m2,m12, m6,m10, m0,m11, m8, m3, m4,m13, m7, m5,m15,m14, m1, m9)
		ROUND(m12, m5, m1,m15,m14,m13, m4,m10, m0, m7, m6, m3, m9, m2, m8,m11)
		ROUND(m13,m11, m7,m14,m12, m1, m3, m9, m5, m0,m15, m4, m8, m6, m2,m10)
		ROUND( m6,m15,m14, m9,m11, m3, m0, m8,m12, m2,m13, m7, m1, m4,m10, m5)
		ROUND(m10, m2, m8, m4, m7, m6, m1, m5,m15,m11, m9,m14, m3,m12,m13, m0)
		ROUND( m0, m1, m2, m3, m4, m5, m6, m7, m8, m9,m10,m11,m12,m13,m14,m15)
		ROUND(m14,m10, m4, m8, m9,m15,m13, m6, m1,m12, m0, m2,m11, m7, m5, m3)

		h0 ^= v0 ^ v8;
		h1 ^= v1 ^ v9;
		h2 ^= v2 ^ v10;
		h3 ^= v3 ^ v11;
		h4 ^= v4 ^ v12;
		h5 ^= v5 ^ v13;
		h6 ^= v6 ^ v14;
		h7 ^= v7 ^ v15;

		if (bytes <= 128)
			break;
		in += stride;
		bytes -= 128;
	}

	U64TO8(&S->h[0], h0);
	U64TO8(&S->h[8], h1);
	U64TO8(&S->h[16], h2);
	U64TO8(&S->h[24], h3);
	U64TO8(&S->h[32], h4);
	U64TO8(&S->h[40], h5);
	U64TO8(&S->h[48], h6);
	U64TO8(&S->h[56], h7);
	U64TO8(&S->t[0], t0);
	U64TO8(&S->t[8], t1);
}
