typedef struct blake2b_uint64 {
	uint16_t w[4];
} blake2b_uint64;

static void
U8TO64(const unsigned char *p, blake2b_uint64 *v) {
	v->w[0] = 
		((uint16_t)p[0]      ) |
		((uint16_t)p[1] <<  8);
	v->w[1] = 
		((uint16_t)p[2]      ) |
		((uint16_t)p[3] <<  8);
	v->w[2] = 
		((uint16_t)p[4]      ) |
		((uint16_t)p[5] <<  8);
	v->w[3] = 
		((uint16_t)p[6]      ) |
		((uint16_t)p[7] <<  8);
}

static void
U64TO8(unsigned char *p, const blake2b_uint64 *v) {
	p[0] = (v->w[0]      ) & 0xff;
	p[1] = (v->w[0] >>  8) & 0xff;
	p[2] = (v->w[1]      ) & 0xff;
	p[3] = (v->w[1] >>  8) & 0xff;
	p[4] = (v->w[2]      ) & 0xff;
	p[5] = (v->w[2] >>  8) & 0xff;
	p[6] = (v->w[3]      ) & 0xff;
	p[7] = (v->w[3] >>  8) & 0xff;
}

static void
XOR64(blake2b_uint64 *x, const blake2b_uint64 *y) {
	x->w[0] ^= y->w[0];
	x->w[1] ^= y->w[1];
	x->w[2] ^= y->w[2];
	x->w[3] ^= y->w[3];
}

static void
ADD64(blake2b_uint64 *x, const blake2b_uint64 *y) {
	uint16_t u0, u1, u2;
	uint16_t c, cp;
	u0 = x->w[0] + y->w[0]; c = (u0 < x->w[0]); x->w[0] = u0;      cp =                  c;
	u1 = x->w[1] + y->w[1]; c = (u1 < x->w[1]); x->w[1] = u1 + cp; cp = (x->w[1] < u1) | c;
	u2 = x->w[2] + y->w[2]; c = (u2 < x->w[2]); x->w[2] = u2 + cp; cp = (x->w[2] < u2) | c;
	x->w[3] += y->w[3] + cp;
}

static void
ADD64_BYTE(blake2b_uint64 *x, unsigned char y) {
	uint16_t u0 = x->w[0];
	uint16_t u1 = x->w[1];
	uint16_t u2 = x->w[2];
	x->w[0] += y;
	x->w[1] += (x->w[0] < u0);
	x->w[2] += (x->w[1] < u1);
	x->w[3] += (x->w[2] < u2);
}

static void
ROTR64_32(blake2b_uint64 *x) {
	uint16_t u0 = x->w[0];
	uint16_t u1 = x->w[1];
	x->w[0] = x->w[2];
	x->w[1] = x->w[3];
	x->w[2] = u0;
	x->w[3] = u1;
}

static void
ROTR64_24(blake2b_uint64 *x) {
	uint16_t u0 = x->w[0];
	uint16_t u1 = x->w[1];
	uint16_t u2 = x->w[2];
	uint16_t u3 = x->w[3];
	x->w[0] = (u2 << 8) | (u1 >> 8);
	x->w[1] = (u3 << 8) | (u2 >> 8);
	x->w[2] = (u0 << 8) | (u3 >> 8);
	x->w[3] = (u1 << 8) | (u0 >> 8);
}

static void
ROTR64_16(blake2b_uint64 *x) {
	uint16_t u0 = x->w[0];
	x->w[0] = x->w[1];
	x->w[1] = x->w[2];
	x->w[2] = x->w[3];
	x->w[3] = u0;
}

static void
ROTR64_63(blake2b_uint64 *x) {
	uint16_t u0 = x->w[0] >> 15;
	uint16_t u1 = x->w[1] >> 15;
	uint16_t u2 = x->w[2] >> 15;
	uint16_t u3 = x->w[3] >> 15;
	x->w[0] = (x->w[0] << 1) | u3;
	x->w[1] = (x->w[1] << 1) | u0;
	x->w[2] = (x->w[2] << 1) | u1;
	x->w[3] = (x->w[3] << 1) | u2;
}

static int
IS_ZERO64(const blake2b_uint64 *x) {
	return (!x->w[0] && !x->w[1] && !x->w[2] && !x->w[3]);
}

static int
IS_LT64_BYTE(const blake2b_uint64 *x, unsigned char y) {
	return (!x->w[3] && !x->w[2] && !x->w[1] && (x->w[0] < y));
}

static void
blake2b_blocks_ref(blake2b_state_internal *S, const unsigned char *in, size_t bytes, size_t stride) {
	static const blake2b_uint64 w[8] = {
		{{0xc908, 0xf3bc, 0xe667, 0x6a09}},
		{{0xa73b, 0x84ca, 0xae85, 0xbb67}},
		{{0xf82b, 0xfe94, 0xf372, 0x3c6e}},
		{{0x36f1, 0x5f1d, 0xf53a, 0xa54f}},
		{{0x82d1, 0xade6, 0x527f, 0x510e}},
		{{0x6c1f, 0x2b3e, 0x688c, 0x9b05}},
		{{0xbd6b, 0xfb41, 0xd9ab, 0x1f83}},
		{{0x2179, 0x137e, 0xcd19, 0x5be0}}
	};
	static const unsigned char indices[32] = {
		0,4,8,12,1,5,9,13,2,6,10,14,3,7,11,15,
		0,5,10,15,1,6,11,12,2,7,8,13,3,4,9,14
	};
	static const unsigned char sigma[12][16] = {
		{0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15},
		{14, 10, 4, 8, 9, 15, 13, 6, 1, 12, 0, 2, 11, 7, 5, 3},
		{11, 8, 12, 0, 5, 2, 15, 13, 10, 14, 3, 6, 7, 1, 9, 4},
		{7, 9, 3, 1, 13, 12, 11, 14, 2, 6, 5, 10, 4, 0, 15, 8},
		{9, 0, 5, 7, 2, 4, 10, 15, 14, 1, 11, 12, 6, 8, 3, 13},
		{2, 12, 6, 10, 0, 11, 8, 3, 4, 13, 7, 5, 15, 14, 1, 9},
		{12, 5, 1, 15, 14, 13, 4, 10, 0, 7, 6, 3, 9, 2, 8, 11},
		{13, 11, 7, 14, 12, 1, 3, 9, 5, 0, 15, 4, 8, 6, 2, 10},
		{6, 15, 14, 9, 11, 3, 0, 8, 12, 2, 13, 7, 1, 4, 10, 5},
		{10, 2, 8, 4, 7, 6, 1, 5, 15, 11, 9, 14, 3, 12, 13, 0},
		{0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15},
		{14, 10, 4, 8, 9, 15, 13, 6, 1, 12, 0, 2, 11, 7, 5, 3}
	};
	const unsigned char inc = (bytes >= 128) ? 128 : (unsigned char)bytes;
	blake2b_uint64 tf[4];
	blake2b_uint64 h[8];
	unsigned char buffer[128];
	size_t i, j;

	for (i = 0; i < 2; i++) U8TO64(S->t + (i * 8), tf + i + 0);
	for (i = 0; i < 2; i++) U8TO64(S->f + (i * 8), tf + i + 2);

	/* if (f0) */
	if (!IS_ZERO64(tf + 2)) {
		memset(buffer, 0, sizeof(buffer));
		memcpy(buffer, in, bytes);
		in = buffer;
	}

	for (i = 0; i < 8; i++) U8TO64(S->h + (i * 8), h + i);

	while (1) {
		blake2b_uint64 m[16];
		blake2b_uint64 v[16];

		/*
			t0 += inc
			if (t0 < inc)
				t1 += 1
		 */	
		ADD64_BYTE(tf + 0, inc);
		if (IS_LT64_BYTE(tf + 0, inc))
			ADD64_BYTE(tf + 1, 1);

		for (i = 0; i < 16; i++) U8TO64(in + (i * 8), m + i);
		for (i = 0; i < 8; i++) v[i] = h[i];
		for (i = 0; i < 8; i++)	v[i + 8] = w[i];
		for (i = 0; i < 4; i++)	XOR64(v + i + 12, tf + i);

		for (i = 0; i < 12; i++) {
			for (j = 0; j < 8; j++) {
				size_t basei = (j * 4);
				unsigned char a = indices[basei + 0];
				unsigned char b = indices[basei + 1];
				unsigned char c = indices[basei + 2];
				unsigned char d = indices[basei + 3];
				size_t bases = (j * 2);

				ADD64(v + a, m + sigma[i][bases + 0]);
				ADD64(v + a, v + b);
				XOR64(v + d, v + a);
				ROTR64_32(v + d);
				ADD64(v + c, v + d);
				XOR64(v + b, v + c);
				ROTR64_24(v + b);
				ADD64(v + a, m + sigma[i][bases + 1]);
				ADD64(v + a, v + b);
				XOR64(v + d, v + a);
				ROTR64_16(v + d);
				ADD64(v + c, v + d);
				XOR64(v + b, v + c);
				ROTR64_63(v + b);
			}
		}

		for (i = 0; i < 8; i++) {
			XOR64(v + i, v + i + 8);
			XOR64(h + i, v + i);
		}

		if (bytes <= 128)
			break;
		in += stride;
		bytes -= 128;
	}

	for (i = 0; i < 8; i++) U64TO8(S->h + (i * 8), h + i);
	for (i = 0; i < 2; i++) U64TO8(S->t + (i * 8), tf + i);
}
