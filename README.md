# ABOUT #

These are specially optimized block compression functions for [BLAKE2b](https://blake2.net/), the 64bit optimized version of BLAKE2, in both serial _and_ tree/parallel modes.

Instead of compressing a single block and returning, they compress an arbitrary number of blocks in one call, allowing the compiler to efficiently work with the state on the stack and/or registers instead of copying back and forth.

All assembler is PIC safe.

# CALLING #

Each version is in the form of

`void blake2b_blocks_version(blake2b_state_internal *S, const uint8_t *in, size_t bytes, size_t stride);`

**S** is a 16 byte aligned pointer to a struct in the form of

    blake2b_state_internal {
        uint64_t H[8];
        uint64_t T[2];
        uint64_t F[2];
    }
    
**in** is a pointer to the data to hash. It should _probably_ be word aligned, but is not required on x86. 

**bytes** is the number of bytes to process. It must either be a multiple of **128** (if **S->F[0]** is **0**), or in the range of **0-128** bytes (if **S->F[0]** is **0xffffffffffffffff**, indicating the final block). It is _not_ required to zero pad blocks under *128* bytes, the functions handle that so they can take advantage of architecture specific implementations.

**stride** is the number of bytes to add to **in** to reach the next block. For sequential BLAKE2, it is *128*, the size of a single block.

# VERSIONS #

`blake2b-example.c` is a BLAKE2 implementation which handles all the high level functions (incremental state, input alignment, validity testing) and calls out to `blake2b_blocks`. It does not do parallel modes or CPU detection currently. Compiling with `-Dblake2b_blocks=blake2b_blocks_version` allows testing of specific block functions.

## x86 (32 bit) [All versions](blake2b_blocksopt_x86-32.s) ##

* 386 compatible: [blake2b\_blocks\_x86](blake2b_blocks_x86-32.s)
* SSE2: [blake2b\_blocks\_sse2](blake2b_blocks_sse2-32.s)
* SSSE3: [blake2b\_blocks\_ssse3](blake2b_blocks_ssse3-32.s)
* AVX: [blake2b\_blocks\_avx](blake2b_blocks_avx-32.s)
* XOP: [blake2b\_blocks\_xop](blake2b_blocks_xop-32.s)

The 386 compatible version is more size optimized than speed optimized. Fully unrolled, it is some 9000 instructions which is just ludicrous, and around 19cpb instead of 22cpb. 22cpb is fast enough for optimized Keccak[c=1024], so even the most performance sensitive users should be fine with it.

## x86-64 [All versions](blake2b_blocksopt-x86_64.s) ##

* x86-64 compatible: [blake2b\_blocks\_x86](blake2b_blocks_x86-64.s)
* AVX: [blake2b\_blocks\_avx](blake2b_blocks_avx-64.s)
* XOP: [blake2b\_blocks\_xop](blake2b_blocks_xop-64.s)

From what I've seen, the x86-64 compatible version is only slower than SIMD on AVX+ systems, so there is no need to include SSE2/SSSE3/SSE4.1.

The AVX versions (both 32-bit and 64-bit) are odd. AVX is _very_ touchy about instruction aligment and innerloop due to what I think is the uop cache? It is possibly to get slightly faster than the versions I created, but actually getting a compiler to output the "fast" version is quite difficult, so I made smaller versions with more predictable performance.

# BENCHMARKS #

Run `./check-x86.sh [x86,sse2,ssse3,xop,avx] [32,64]` to check that the specified version is producing the correct output and to benchmark it.

I don't have access to any XOP machines to bench so the XOP versions are more theoretical fast than actual fast.

## [E5200](http://ark.intel.com/products/37212/) ##

<table>
<thead><tr><th>Implemenation</th><th>1 byte</th><th>256 bytes</th><th>16384 bytes</th></tr></thead>
<tbody>
<tr> <td>x86-64    </td> <td> 725</td> <td>  5.32</td> <td>  4.50</td> </tr>
<tr> <td>SSSE3-32  </td> <td> 825</td> <td>  6.05</td> <td>  5.23</td> </tr>
<tr> <td>SSE2-32   </td> <td>1075</td> <td>  7.91</td> <td>  7.11</td> </tr>
<tr> <td>x86-32    </td> <td>3075</td> <td> 23.48</td> <td> 22.75</td> </tr>
</tbody>
</table>

## [E3-1270](http://ark.intel.com/products/52276/) ##

<table>
<thead><tr><th>Implemenation</th><th>1 byte</th><th>256 bytes</th><th>16384 bytes</th></tr></thead>
<tbody>
<tr> <td>AVX-64    </td> <td> 520</td> <td>  3.92</td> <td>  3.37</td> </tr>
<tr> <td>AVX-32    </td> <td> 644</td> <td>  4.59</td> <td>  3.96</td> </tr>
<tr> <td>SSSE3-32  </td> <td> 684</td> <td>  4.95</td> <td>  4.51</td> </tr>
<tr> <td>x86-64    </td> <td> 768</td> <td>  5.73</td> <td>  5.37</td> </tr>
<tr> <td>SSE2-32   </td> <td> 844</td> <td>  6.33</td> <td>  5.89</td> </tr>
<tr> <td>x86-32    </td> <td>2840</td> <td> 22.00</td> <td> 21.24</td> </tr>
</tbody>
</table>


# LICENSE #

Public Domain, or MIT