# ABOUT #

This is a portable, performant implementation of [BLAKE2b](https://blake2.net/) using optimized block compression functions. The compression functions are tree/parallel mode compatible, although only serial mode (singled threaded, the common use-case) is currently implemented.

BLAKE2b is a 512 bit hash, i.e. the hashes produced are 64 bytes long.

All assembler is PIC safe.

# INITIALIZING #

The library can be initialized, i.e. the most optimized implementation that passes internal tests will be automatically selected, in two ways, **neither of which are thread safe**:

1. `int blake2b_startup(void);` explicitly initializes the library, and returns a non-zero value if no suitable implementation is found that passes internal tests

2. Do nothing and use the library like normal. It will auto-initialize itself when needed, and hard exit if no suitable implementation is found.

# CALLING #

Common assumptions:

* When using the incremental functions, the `blake2b_state` struct is assumed to be word aligned, if necessary, for the system in use.

## ONE SHOT ##

`in` is assumed to be word aligned. Incremental support has no alignment requirements, but will obviously slow down if non word-aligned pointers are passed.

`void blake2b(unsigned char *hash, const unsigned char *in, const size_t inlen);`

Hashes `inlen` bytes from `in` and stores the result in `hash`.

`void blake2b_keyed(unsigned char *hash, const unsigned char *in, const size_t inlen, const unsigned char *key, size_t keylen);`

Hashes `inlen` bytes from `in` in keyed mode using `key`, and and stores the result in `hash`. `keylen` must be <= 64.

## INCREMENTAL ##

Incremental `in` buffers are *not* required to be word aligned. Unaligned buffers will require copying to aligned buffers however, which will obviously incur a speed penalty.

`void blake2b_init(blake2b_state *S)`

Initializes `S` to the default state.

`void blake2b_keyed_init(blake2b_state *S, const unsigned char *key, size_t keylen)`

Initializes `S` in keyed mode with `key`. `keylen` must be <= 64.

`void blake2b_update(blake2b_state *S, const unsigned char *in, size_t inlen)`

Updates the state `S` with `inlen` bytes from `in` in.

`void blake2b_final(blake2b_state *S, unsigned char *hash)`

Performs the final pass on state `S` and stores the result in to `hash`.

# Examples #

## HASHING DATA WITH ONE CALL ##

    size_t bytes = ...;
    unsigned char data[...] = {...};
    unsigned char hash[64];

    blake2b(hash, data, bytes);

## HASHING INCREMENTALLY ##

Hashing incrementally, i.e. with multiple calls to update the hash state. 

    size_t bytes = ...;
    unsigned char data[...] = {...};
    unsigned char hash[64];
    blake2b_state state;
    size_t i;

    blake2b_init(&state);
    /* add one byte at a time, extremely inefficient */
    for (i = 0; i < bytes; i++) {
        blake2b_update(&state, data + i, 1);
    }
    blake2b_final(&state, hash);

# VERSIONS #

## Reference ##

There are 5! reference versions, specialized for increasingly capable systems from 8 bit only operations (with the world's most inefficient portable carries, you really don't want to use this unless nothing else runs) to unrolled 64 bit.

* Generic 8-bit: [blake2b\_ref](app/extensions/blake2b/blake2b_ref-8.inc)
* Generic 16-bit: [blake2b\_ref](app/extensions/blake2b/blake2b_ref-16.inc)
* Generic 32-bit: [blake2b\_ref](app/extensions/blake2b/blake2b_ref-32.inc)
* Generic 32-bit with 64-bit compiler support: [blake2b\_ref](app/extensions/blake2b/blake2b_ref-3264.inc)
* Generic 64-bit: [blake2b\_ref](app/extensions/blake2b/blake2b_ref-64.inc)

## x86 (32 bit) ##

* 386 compatible: [blake2b\_x86](app/extensions/blake2b/blake2b_x86-32.inc)
* SSE2: [blake2b\_sse2](app/extensions/blake2b/blake2b_sse2-32.inc)
* SSSE3: [blake2b\_ssse3](app/extensions/blake2b/blake2b_ssse3-32.inc)
* AVX: [blake2b\_avx](app/extensions/blake2b/blake2b_avx-32.inc)
* XOP: [blake2b\_xop](app/extensions/blake2b/blake2b_xop-32.inc)
* AVX2: [blake2b\_avx2](app/extensions/blake2b/blake2b_avx2-32.inc)

The 386 compatible version is more size optimized than speed optimized. Fully unrolled, it is some 9000 instructions which is just ludicrous, and around 19cpb instead of 22cpb. 22cpb is fast enough for optimized Keccak[c=1024], so even the most performance sensitive users running on a Pentium 2 should be fine with it.

## x86-64 ##

* x86-64 compatible: [blake2b\_x86](app/extensions/blake2b/blake2b_x86-64.inc)
* AVX: [blake2b\_avx](app/extensions/blake2b/blake2b_avx-64.inc)
* XOP: [blake2b\_xop](app/extensions/blake2b/blake2b_xop-64.inc)
* AVX2: [blake2b\_avx2](app/extensions/blake2b/blake2b_avx2-64.inc)

From what I've seen, the x86-64 compatible version is only slower than SIMD on AVX+ systems, so there is no need to include SSE2/SSSE3/SSE4.1.

## ARM ##

* ARMv6: [blake2b\_armv6](app/extensions/blake2b/blake2b_armv6-32.inc)
* NEON: [blake2b\_avx](app/extensions/blake2b/blake2b_neon-32.inc)

The ARMv6 version is only intended to be small and not too horrible. It could be a little faster with a good compiler (not gcc apparently), but I can't see it increasing too much. 

# BUILDING #

See [asm-opt#configuring](https://github.com/floodyberry/asm-opt#configuring) for full configure options.

If you would like to use Yasm with a gcc-compatible compiler, pass `--yasm` to configure.

The Visual Studio projects are generated assuming Yasm is available. You will need to have [Yasm.exe](http://yasm.tortall.net/Download.html) somewhere in your path to build them.

## STATIC LIBRARY ##

    ./configure
    make lib

and `make install-lib` OR copy `bin/blake2b.lib` and `app/include/blake2b.h` to your desired location.

## SHARED LIBRARY ##

    ./configure --pic
    make shared
    make install-shared

## UTILITIES / TESTING ##

    ./configure
    make util
    bin/chacha-util [bench|fuzz]

### BENCHMARK / TESTING ###

Benchmarking will implicitly test every available version. If any fail, it will exit with an error indicating which versions did not pass. Features tested include:

* One-shot hashing
* Incremental hashing
* Counter handling when the 32-bit low half overflows to the upper half

### FUZZING ###

Fuzzing tests every available implementation for the current CPU against the reference implementation. Features tested are:

* Arbitrary starting state
* Arbitrary starting counter

# BENCHMARKS #

## [E5200](http://ark.intel.com/products/37212/) ##

Only the top 3 benchmarks per mode will be shown. Anything past 3 or so is pretty irrelevant to the current architecture.

<table>
<thead><tr><th>Implemenation</th><th>1 byte</th><th>576 bytes</th><th>8192 bytes</th></tr></thead>
<tbody>
<tr> <td>x86-64    </td> <td> 633</td> <td>  5.01</td> <td>  4.26</td> </tr>
<tr> <td>SSSE3-32  </td> <td> 850</td> <td>  6.51</td> <td>  5.25</td> </tr>
<tr> <td>SSE2-32   </td> <td>1090</td> <td>  8.48</td> <td>  7.20</td> </tr>
<tr> <td>x86-32    </td> <td>3070</td> <td> 25.62</td> <td> 22.75</td> </tr>
</tbody>
</table>

## [i7-4770K](http://ark.intel.com/products/75123) ##

Timings are with Turbo Boost and Hyperthreading, so their accuracy is not concrete. 
For reference, OpenSSL and Crypto++ give ~0.8cpb for AES-128-CTR and ~1.1cpb for AES-256-CTR, ~7.4cpb for SHA-512, and ~4.5cpb for MD5.

<table>
<thead><tr><th>Implemenation</th><th>1 byte</th><th>576 bytes</th><th>8192 bytes</th></tr></thead>
<tbody>
<tr> <td>AVX2-64   </td> <td> 406</td> <td>  3.16</td> <td>  2.76</td> </tr>
<tr> <td>AVX2-32   </td> <td> 450</td> <td>  3.37</td> <td>  2.87</td> </tr>
<tr> <td>AVX-64    </td> <td> 460</td> <td>  3.58</td> <td>  3.11</td> </tr>
<tr> <td>x86-64    </td> <td> 499</td> <td>  4.04</td> <td>  3.54</td> </tr>
<tr> <td>AVX-32    </td> <td> 550</td> <td>  4.24</td> <td>  3.43</td> </tr>
</tbody>
</table>

## AMD FX-8120 ##

Timings are with Turbo on, so accuracy is not concrete. I'm not sure how to adjust for it either, 
and depending on clock speed (3.1ghz vs 4.0ghz), OpenSSL gives between 0.73cpb - 0.94cpb for AES-128-CTR, 
1.03cpb - 1.33cpb for AES-256-CTR, 10.96cpb - 14.1cpb for SHA-512, and 4.7cpb - 5.16cpb for MD5.

<table>
<thead><tr><th>Implemenation</th><th>1 byte</th><th>576 bytes</th><th>8192 bytes</th></tr></thead>
<tbody>
<tr> <td>XOP-64   </td> <td> 604</td> <td>  4.66</td> <td>  3.97</td> </tr>
<tr> <td>XOP-32   </td> <td> 723</td> <td>  5.28</td> <td>  4.38</td> </tr>
<tr> <td>AVX-64   </td> <td> 690</td> <td>  5.42</td> <td>  4.62</td> </tr>
<tr> <td>AVX-32   </td> <td> 748</td> <td>  5.76</td> <td>  4.84</td> </tr>
<tr> <td>x86-64   </td> <td> 735</td> <td>  5.93</td> <td>  5.16</td> </tr>
<tr> <td>SSSE3-32 </td> <td> 787</td> <td>  6.04</td> <td>  5.17</td> </tr>
</tbody>
</table>


## ZedBoard (Cortex-A9) ##

I don't have access to the cycle counter yet, so cycles are computed by taking the microseconds times the clock speed (666mhz) divided by 1 million. For comparison, on long messages, OpenSSL 1.0.0e gives 52.3 cpb for aes-128-cbc (woof), ~123cpb for SHA-512 (really woof), and ~9.6cpb for MD5.

<table>
<thead><tr><th>Implemenation</th><th>1 byte</th><th>576 bytes</th><th>8192 bytes</th></tr></thead>
<tbody>
<tr> <td>NEON-32          </td> <td> 1750</td> <td> 12.66</td> <td> 10.60</td> </tr>
<tr> <td>ARMv6-32         </td> <td> 4910</td> <td> 41.26</td> <td> 36.87</td> </tr>
<tr> <td>Generic3264-32   </td> <td> 8833</td> <td> 70.53</td> <td> 60.00</td> </tr>
</tbody>
</table>

# LICENSE #

Public Domain, or MIT
