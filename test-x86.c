#include <stdio.h>
#include <string.h>
#include "blake2b.h"

static uint64_t
get_ticks(void) {
	uint32_t lo, hi;
	__asm__ __volatile__("rdtsc" : "=a" (lo), "=d" (hi));
	return ((uint64_t)lo | ((uint64_t)hi << 32));
}

#define trials 4096

static uint8_t buffer[16384];
static uint64_t allticks[trials+1];
static uint64_t minticks[32];

int main() {
	static const size_t lengths[] = {1, 128, 256, 2048, 4096, 16384, 0};
	size_t i, pass;

	if (!blake2b_check_validity()) {
		printf("self check FAILED\n");
		return -1;
	} else {
		printf("self check passed\n\n");
	}

	memset(buffer, 0x5c, sizeof(buffer));

	for (i = 0; i < trials; i++)
		blake2b(buffer, buffer, 16384);

	for (i = 0; lengths[i] != 0; i++) {
		for (pass = 0; pass < trials; pass++) {
			allticks[pass] = get_ticks();
			blake2b(buffer, buffer, lengths[i]);
		}
		allticks[pass] = get_ticks();
		for (pass = 0; pass < trials; pass++)
			allticks[pass] = allticks[pass + 1] - allticks[pass];

		for (pass = 0, minticks[i] = ~0ull; pass < trials; pass++) {
			if (allticks[pass] < minticks[i])
				minticks[i] = allticks[pass];
		}
	}

	for (i = 0; lengths[i] != 0; i++) {
		printf("%u bytes, %.0f cycles, %.2f cycles/byte\n", (uint32_t)lengths[i], (double)minticks[i], (double)minticks[i] / lengths[i]);
	}

	printf("\n\n");
	return 0;
}
