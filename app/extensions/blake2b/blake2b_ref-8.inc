#if defined(HAVE_INT8)
	typedef uint8_t blake2b_uint8;
	#define MASK8(x) (x)
#else
	typedef unsigned char blake2b_uint8;
	#define MASK8(x) ((x) & 0xff)
#endif

typedef struct blake2b_uint64 {
	blake2b_uint8 w[8];
} blake2b_uint64;

static void
U8TO64(const unsigned char *p, blake2b_uint64 *v) {
	size_t i;
	for (i = 0; i < 8; i++)
		v->w[i] = p[i];
}

static void
U64TO8(unsigned char *p, const blake2b_uint64 *v) {
	size_t i;
	for (i = 0; i < 8; i++)
		p[i] = (unsigned char)v->w[i];
}

static void
XOR64(blake2b_uint64 *x, const blake2b_uint64 *y) {
	size_t i;
	for (i = 0; i < 8; i++)
		x->w[i] ^= y->w[i];
}

static void
ADD64(blake2b_uint64 *x, const blake2b_uint64 *y) {
	size_t i;
	blake2b_uint8 cp = 0;
	for (i = 0; i < 8; i++) {
		blake2b_uint8 u = MASK8(x->w[i] + y->w[i]);
		blake2b_uint8 c = (u < x->w[i]);
		x->w[i] = MASK8(u + cp);
		cp = (x->w[i] < u) | c;
	}
}

static void
ADD64_BYTE(blake2b_uint64 *x, blake2b_uint8 y) {
	size_t i;
	blake2b_uint8 u = x->w[0];
	x->w[0] = MASK8(x->w[0] + y);
	for (i = 1; i < 8; i++) {
		blake2b_uint8 ui = x->w[i];
		x->w[i] = MASK8(x->w[i] + (x->w[i - 1] < u));
		u = ui;
	}
}

static void
ROTR64_32(blake2b_uint64 *x) {
	size_t i;
	for (i = 0; i < 4; i++) {
		blake2b_uint8 u = x->w[i];
		x->w[i] = x->w[i + 4];
		x->w[i + 4] = u;
	}
}

static void
ROTR64_24(blake2b_uint64 *x) {
	blake2b_uint8 u = x->w[0];
	x->w[0] = x->w[3];
	x->w[3] = x->w[6];
	x->w[6] = x->w[1];
	x->w[1] = x->w[4];
	x->w[4] = x->w[7];
	x->w[7] = x->w[2];
	x->w[2] = x->w[5];
	x->w[5] = u;
}

static void
ROTR64_16(blake2b_uint64 *x) {
	blake2b_uint8 u0 = x->w[0];
	blake2b_uint8 u1 = x->w[1];
	x->w[0] = x->w[2];
	x->w[1] = x->w[3];
	x->w[2] = x->w[4];
	x->w[3] = x->w[5];
	x->w[4] = x->w[6];
	x->w[5] = x->w[7];
	x->w[6] = u0;
	x->w[7] = u1;
}

static void
ROTR64_63(blake2b_uint64 *x) {
	size_t i;
	blake2b_uint8 u0 = x->w[7] >> 7;
	for (i = 0; i < 8; i++) {
		blake2b_uint8 u1 = x->w[i] >> 7;
		x->w[i] = MASK8((x->w[i] << 1) | u0);
		u0 = u1;
	}
}

static int
IS_ZERO64(const blake2b_uint64 *x) {
	size_t i;
	for (i = 0; i < 8; i++) {
		if (x->w[i])
			return 0;
	}
	return 1;
}

static int
IS_LT64_BYTE(const blake2b_uint64 *x, blake2b_uint8 y) {
	size_t i;
	for (i = 1; i < 8; i++) {
		if (x->w[i])
			return 0;
	}
	return (x->w[0] < y);
}

static void
blake2b_blocks_ref(blake2b_state_internal *S, const unsigned char *in, size_t bytes, size_t stride) {
	static const blake2b_uint64 w[8] = {
		{{0x08, 0xc9, 0xbc, 0xf3, 0x67, 0xe6, 0x09, 0x6a}},
		{{0x3b, 0xa7, 0xca, 0x84, 0x85, 0xae, 0x67, 0xbb}},
		{{0x2b, 0xf8, 0x94, 0xfe, 0x72, 0xf3, 0x6e, 0x3c}},
		{{0xf1, 0x36, 0x1d, 0x5f, 0x3a, 0xf5, 0x4f, 0xa5}},
		{{0xd1, 0x82, 0xe6, 0xad, 0x7f, 0x52, 0x0e, 0x51}},
		{{0x1f, 0x6c, 0x3e, 0x2b, 0x8c, 0x68, 0x05, 0x9b}},
		{{0x6b, 0xbd, 0x41, 0xfb, 0xab, 0xd9, 0x83, 0x1f}},
		{{0x79, 0x21, 0x7e, 0x13, 0x19, 0xcd, 0xe0, 0x5b}}
	};
	static const blake2b_uint8 indices[32] = {
		0,4,8,12,1,5,9,13,2,6,10,14,3,7,11,15,
		0,5,10,15,1,6,11,12,2,7,8,13,3,4,9,14
	};
	static const blake2b_uint8 sigma[12][16] = {
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
	const blake2b_uint8 inc = (bytes >= 128) ? 128 : (blake2b_uint8)bytes;
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
				blake2b_uint8 a = indices[basei + 0];
				blake2b_uint8 b = indices[basei + 1];
				blake2b_uint8 c = indices[basei + 2];
				blake2b_uint8 d = indices[basei + 3];
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
