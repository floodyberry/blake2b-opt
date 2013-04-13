.text


.align 16,0x90
.globl blake2b_blocks_avx
.globl _blake2b_blocks_avx
blake2b_blocks_avx:
_blake2b_blocks_avx:
pushq %rbp
movq %rsp, %rbp
andq $-64, %rsp
pushq %r12
pushq %r13
pushq %r14
pushq %r15
pushq %rbx
subq $344, %rsp
lea 48+blake2b_constants(%rip), %r9
lea ssse3_rotr16_64(%rip), %rax
lea ssse3_rotr24_64(%rip), %r8
vmovdqu 80(%rdi), %xmm0
cmpq $128, %rdx
vpxor (%r9), %xmm0, %xmm0
movl $128, %r9d
vmovdqu (%rax), %xmm12
cmovbe %rdx, %r9
vmovdqu (%r8), %xmm1
movq 64(%rdi), %r8
movq 72(%rdi), %rax
cmpq $0, 80(%rdi)
je blake2b_blocks_avx_L21
blake2b_blocks_avx_L2:
cmpq $128, %rdx
je blake2b_blocks_avx_L21
blake2b_blocks_avx_L3:
lea (%rsp), %r10
testq $64, %rdx
je blake2b_blocks_avx_L5
blake2b_blocks_avx_L4:
vmovdqu (%rsi), %xmm2
vmovdqu %xmm2, (%rsp)
lea 64(%rsp), %r10
vmovdqu 16(%rsi), %xmm3
vmovdqu %xmm3, 16(%rsp)
vpxor %xmm2, %xmm2, %xmm2
vmovdqu 32(%rsi), %xmm4
vmovdqu %xmm4, 32(%rsp)
vmovdqu 48(%rsi), %xmm5
vmovdqu %xmm5, 48(%rsp)
addq $64, %rsi
jmp blake2b_blocks_avx_L6
blake2b_blocks_avx_L5:
vpxor %xmm2, %xmm2, %xmm2
vmovdqu %xmm2, 64(%rsp)
vmovdqu %xmm2, 80(%rsp)
vmovdqu %xmm2, 96(%rsp)
vmovdqu %xmm2, 112(%rsp)
blake2b_blocks_avx_L6:
vmovdqu %xmm2, (%r10)
vmovdqu %xmm2, 16(%r10)
vmovdqu %xmm2, 32(%r10)
vmovdqu %xmm2, 48(%r10)
testq $32, %rdx
je blake2b_blocks_avx_L8
blake2b_blocks_avx_L7:
vmovdqu (%rsi), %xmm2
vmovdqu %xmm2, (%r10)
vmovdqu 16(%rsi), %xmm3
vmovdqu %xmm3, 16(%r10)
addq $32, %rsi
addq $32, %r10
blake2b_blocks_avx_L8:
testq $16, %rdx
je blake2b_blocks_avx_L10
blake2b_blocks_avx_L9:
vmovdqu (%rsi), %xmm2
vmovdqu %xmm2, (%r10)
addq $16, %rsi
addq $16, %r10
blake2b_blocks_avx_L10:
testq $8, %rdx
je blake2b_blocks_avx_L12
blake2b_blocks_avx_L11:
movq (%rsi), %r11
addq $8, %rsi
movq %r11, (%r10)
addq $8, %r10
blake2b_blocks_avx_L12:
testq $4, %rdx
je blake2b_blocks_avx_L14
blake2b_blocks_avx_L13:
movl (%rsi), %r11d
addq $4, %rsi
movl %r11d, (%r10)
addq $4, %r10
blake2b_blocks_avx_L14:
testq $2, %rdx
je blake2b_blocks_avx_L16
blake2b_blocks_avx_L15:
movzwl (%rsi), %r11d
addq $2, %rsi
movw %r11w, (%r10)
addq $2, %r10
blake2b_blocks_avx_L16:
testq $1, %rdx
je blake2b_blocks_avx_L18
blake2b_blocks_avx_L17:
movb (%rsi), %sil
movb %sil, (%r10)
blake2b_blocks_avx_L18:
lea (%rsp), %rsi
blake2b_blocks_avx_L21:
lea 32+blake2b_constants(%rip), %r10
lea blake2b_constants(%rip), %r11
vmovdqu (%rdi), %xmm5
vmovdqu 16(%rdi), %xmm6
vmovdqu 32(%rdi), %xmm7
vmovdqu (%r10), %xmm4
lea 16+blake2b_constants(%rip), %r10
vmovdqu 48(%rdi), %xmm8
vmovdqu (%r11), %xmm3
vmovdqu %xmm3, 176(%rsp)
vmovdqu (%r10), %xmm2
vmovdqu %xmm2, 160(%rsp)
vmovdqu %xmm4, 144(%rsp)
vmovdqu %xmm8, 240(%rsp)
vmovdqu %xmm7, 256(%rsp)
vmovdqu %xmm6, 224(%rsp)
vmovdqu %xmm5, 208(%rsp)
vmovdqu %xmm0, 192(%rsp)
movq %r9, 272(%rsp)
movq %rdi, 128(%rsp)
movq %rcx, 136(%rsp)
jmp blake2b_blocks_avx_L22
# align to 31 mod 64
.align 64
nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;
blake2b_blocks_avx_L25:
addq 136(%rsp), %rsi
addq $-128, %rdx
blake2b_blocks_avx_L22:
movq 272(%rsp), %rcx
addq %rcx, %r8
cmpq %rcx, %r8
lea 1(%rax), %rbx
vmovdqu (%rsi), %xmm15
vmovdqu 16(%rsi), %xmm5
vmovdqu 32(%rsi), %xmm3
vmovdqu 48(%rsi), %xmm6
cmovb %rbx, %rax
vmovd %r8, %xmm7
vpunpcklqdq %xmm5, %xmm15, %xmm2
lea 32+blake2b_sigma(%rip), %rcx
vpunpcklqdq %xmm6, %xmm3, %xmm8
lea 160+blake2b_sigma(%rip), %rbx
vpaddq 208(%rsp), %xmm2, %xmm0
vpaddq 224(%rsp), %xmm8, %xmm10
vmovd %rax, %xmm14
vmovdqu 256(%rsp), %xmm4
vmovdqu 240(%rsp), %xmm11
vpunpcklqdq %xmm14, %xmm7, %xmm9
vpaddq %xmm4, %xmm0, %xmm13
vpaddq %xmm11, %xmm10, %xmm2
vpxor 144(%rsp), %xmm9, %xmm0
vpxor 192(%rsp), %xmm2, %xmm10
vpxor %xmm13, %xmm0, %xmm8
vpshufd $177, %xmm8, %xmm8
vpshufd $177, %xmm10, %xmm7
vpaddq 176(%rsp), %xmm8, %xmm14
vpaddq 160(%rsp), %xmm7, %xmm9
vpxor %xmm14, %xmm4, %xmm4
vpxor %xmm9, %xmm11, %xmm11
vpshufb %xmm1, %xmm4, %xmm4
vpshufb %xmm1, %xmm11, %xmm0
vpunpckhqdq %xmm5, %xmm15, %xmm15
vpunpckhqdq %xmm6, %xmm3, %xmm6
vpaddq %xmm15, %xmm13, %xmm13
vpaddq %xmm6, %xmm2, %xmm6
vpaddq %xmm4, %xmm13, %xmm10
vpaddq %xmm0, %xmm6, %xmm15
vpxor %xmm10, %xmm8, %xmm2
vpxor %xmm15, %xmm7, %xmm8
vpshufb %xmm12, %xmm2, %xmm5
vpshufb %xmm12, %xmm8, %xmm2
vpaddq %xmm5, %xmm14, %xmm6
vpaddq %xmm2, %xmm9, %xmm7
vpxor %xmm6, %xmm4, %xmm4
vpxor %xmm7, %xmm0, %xmm9
vpaddq %xmm4, %xmm4, %xmm14
vpaddq %xmm9, %xmm9, %xmm13
vpsrlq $63, %xmm4, %xmm0
vpsrlq $63, %xmm9, %xmm11
vpor %xmm14, %xmm0, %xmm8
vpor %xmm13, %xmm11, %xmm4
vpalignr $8, %xmm8, %xmm4, %xmm0
vpalignr $8, %xmm4, %xmm8, %xmm14
vmovdqu 64(%rsi), %xmm9
vmovdqu 80(%rsi), %xmm8
vmovdqu 96(%rsi), %xmm4
vpunpcklqdq %xmm8, %xmm9, %xmm11
vpaddq %xmm11, %xmm10, %xmm10
vmovdqu 112(%rsi), %xmm11
vpaddq %xmm0, %xmm10, %xmm13
vpunpcklqdq %xmm11, %xmm4, %xmm10
vpaddq %xmm10, %xmm15, %xmm15
vpaddq %xmm14, %xmm15, %xmm15
vpalignr $8, %xmm2, %xmm5, %xmm10
vpalignr $8, %xmm5, %xmm2, %xmm5
vpxor %xmm13, %xmm10, %xmm10
vpxor %xmm15, %xmm5, %xmm2
vpshufd $177, %xmm10, %xmm10
vpshufd $177, %xmm2, %xmm2
vpaddq %xmm10, %xmm7, %xmm7
vpaddq %xmm2, %xmm6, %xmm5
vpxor %xmm7, %xmm0, %xmm6
vpxor %xmm5, %xmm14, %xmm14
vpshufb %xmm1, %xmm6, %xmm0
vpshufb %xmm1, %xmm14, %xmm6
vpunpckhqdq %xmm8, %xmm9, %xmm14
vpaddq %xmm14, %xmm13, %xmm13
vpaddq %xmm0, %xmm13, %xmm14
vpunpckhqdq %xmm11, %xmm4, %xmm13
vpxor %xmm14, %xmm10, %xmm10
vpaddq %xmm13, %xmm15, %xmm15
vpshufb %xmm12, %xmm10, %xmm13
vpaddq %xmm6, %xmm15, %xmm15
vpaddq %xmm13, %xmm7, %xmm10
vpxor %xmm15, %xmm2, %xmm2
vpxor %xmm10, %xmm0, %xmm0
vpshufb %xmm12, %xmm2, %xmm2
vpaddq %xmm2, %xmm5, %xmm5
vpxor %xmm5, %xmm6, %xmm7
vpsrlq $63, %xmm0, %xmm6
vpaddq %xmm0, %xmm0, %xmm0
vpor %xmm0, %xmm6, %xmm6
vpsrlq $63, %xmm7, %xmm0
vpaddq %xmm7, %xmm7, %xmm7
vpor %xmm7, %xmm0, %xmm0
vpalignr $8, %xmm0, %xmm6, %xmm7
vpalignr $8, %xmm6, %xmm0, %xmm6
vpunpcklqdq %xmm3, %xmm11, %xmm0
vpaddq %xmm0, %xmm14, %xmm14
vpaddq %xmm7, %xmm14, %xmm0
vpunpckhqdq %xmm4, %xmm9, %xmm14
vpaddq %xmm14, %xmm15, %xmm15
vpaddq %xmm6, %xmm15, %xmm14
vpalignr $8, %xmm13, %xmm2, %xmm15
vpxor %xmm0, %xmm15, %xmm15
vpshufd $177, %xmm15, %xmm15
vpalignr $8, %xmm2, %xmm13, %xmm2
vpxor %xmm14, %xmm2, %xmm13
vpaddq %xmm15, %xmm5, %xmm2
vpshufd $177, %xmm13, %xmm13
vpxor %xmm2, %xmm7, %xmm5
vpunpcklqdq %xmm9, %xmm8, %xmm7
vpaddq %xmm13, %xmm10, %xmm10
vpaddq %xmm7, %xmm0, %xmm9
vmovdqu 48(%rsi), %xmm0
vpshufb %xmm1, %xmm5, %xmm5
vpxor %xmm10, %xmm6, %xmm6
vpshufb %xmm1, %xmm6, %xmm6
vpaddq %xmm5, %xmm9, %xmm9
vpalignr $8, %xmm11, %xmm0, %xmm11
vpxor %xmm9, %xmm15, %xmm15
vpaddq %xmm11, %xmm14, %xmm7
vpshufb %xmm12, %xmm15, %xmm11
vpaddq %xmm6, %xmm7, %xmm14
vpaddq %xmm11, %xmm2, %xmm2
vpxor %xmm14, %xmm13, %xmm13
vpxor %xmm2, %xmm5, %xmm5
vpshufb %xmm12, %xmm13, %xmm13
vpaddq %xmm13, %xmm10, %xmm10
vpxor %xmm10, %xmm6, %xmm15
vpsrlq $63, %xmm5, %xmm6
vpaddq %xmm5, %xmm5, %xmm5
vpsrlq $63, %xmm15, %xmm7
vpor %xmm5, %xmm6, %xmm6
vpaddq %xmm15, %xmm15, %xmm15
vpor %xmm15, %xmm7, %xmm5
vpalignr $8, %xmm6, %xmm5, %xmm15
vpalignr $8, %xmm5, %xmm6, %xmm5
vpshufd $78, (%rsi), %xmm6
vpaddq %xmm6, %xmm9, %xmm9
vpunpckhqdq %xmm3, %xmm8, %xmm3
vpaddq %xmm3, %xmm14, %xmm6
vpaddq %xmm15, %xmm9, %xmm9
vpaddq %xmm5, %xmm6, %xmm8
vpalignr $8, %xmm13, %xmm11, %xmm3
vpalignr $8, %xmm11, %xmm13, %xmm11
vpxor %xmm9, %xmm3, %xmm7
vpshufd $177, %xmm7, %xmm14
vpxor %xmm8, %xmm11, %xmm13
vpshufd $177, %xmm13, %xmm3
vpaddq %xmm14, %xmm10, %xmm6
vpaddq %xmm3, %xmm2, %xmm10
vpxor %xmm6, %xmm15, %xmm2
vmovdqu 16(%rsi), %xmm15
vpshufb %xmm1, %xmm2, %xmm7
vpxor %xmm10, %xmm5, %xmm2
vpshufb %xmm1, %xmm2, %xmm5
vpunpcklqdq %xmm15, %xmm4, %xmm4
vpunpckhqdq %xmm15, %xmm0, %xmm0
vpaddq %xmm4, %xmm9, %xmm2
vpaddq %xmm0, %xmm8, %xmm8
vpaddq %xmm7, %xmm2, %xmm2
vpaddq %xmm5, %xmm8, %xmm0
vpxor %xmm2, %xmm14, %xmm15
vpxor %xmm0, %xmm3, %xmm9
vpshufb %xmm12, %xmm15, %xmm15
vpshufb %xmm12, %xmm9, %xmm3
vpaddq %xmm15, %xmm6, %xmm8
vpaddq %xmm3, %xmm10, %xmm6
vpxor %xmm8, %xmm7, %xmm10
vpxor %xmm6, %xmm5, %xmm5
vpaddq %xmm5, %xmm5, %xmm9
vpsrlq $63, %xmm10, %xmm4
vpsrlq $63, %xmm5, %xmm7
vpaddq %xmm10, %xmm10, %xmm10
vpor %xmm10, %xmm4, %xmm13
vpor %xmm9, %xmm7, %xmm11
vpalignr $8, %xmm11, %xmm13, %xmm4
vpalignr $8, %xmm13, %xmm11, %xmm7
vpalignr $8, %xmm15, %xmm3, %xmm9
vpalignr $8, %xmm3, %xmm15, %xmm10
blake2b_blocks_avx_L23:
movzbl (%rcx), %edi
movzbl 2(%rcx), %r9d
movzbl 4(%rcx), %r10d
movzbl 6(%rcx), %r11d
vmovq (%rdi,%rsi), %xmm5
vpinsrq $1, (%r9,%rsi), %xmm5, %xmm14
vmovq (%r10,%rsi), %xmm3
vpinsrq $1, (%r11,%rsi), %xmm3, %xmm15
vpaddq %xmm14, %xmm2, %xmm2
vpaddq %xmm15, %xmm0, %xmm0
vpaddq %xmm4, %xmm2, %xmm2
vpaddq %xmm7, %xmm0, %xmm0
vpxor %xmm2, %xmm9, %xmm11
vpxor %xmm0, %xmm10, %xmm10
vpshufd $177, %xmm11, %xmm3
movzbl 1(%rcx), %r12d
movzbl 5(%rcx), %r14d
vpshufd $177, %xmm10, %xmm5
vpaddq %xmm3, %xmm6, %xmm6
vpaddq %xmm5, %xmm8, %xmm9
movzbl 3(%rcx), %r13d
vpxor %xmm6, %xmm4, %xmm14
movzbl 7(%rcx), %r15d
vpxor %xmm9, %xmm7, %xmm15
vmovq (%r12,%rsi), %xmm4
vmovq (%r14,%rsi), %xmm11
vpinsrq $1, (%r13,%rsi), %xmm4, %xmm7
vpinsrq $1, (%r15,%rsi), %xmm11, %xmm13
vpshufb %xmm1, %xmm14, %xmm8
vpshufb %xmm1, %xmm15, %xmm14
vpaddq %xmm7, %xmm2, %xmm2
vpaddq %xmm13, %xmm0, %xmm0
vpaddq %xmm8, %xmm2, %xmm4
vpaddq %xmm14, %xmm0, %xmm7
vpxor %xmm4, %xmm3, %xmm10
vpxor %xmm7, %xmm5, %xmm3
vpshufb %xmm12, %xmm10, %xmm11
vpshufb %xmm12, %xmm3, %xmm10
vpaddq %xmm11, %xmm6, %xmm13
vpaddq %xmm10, %xmm9, %xmm9
movzbl 8(%rcx), %edi
vpxor %xmm13, %xmm8, %xmm8
movzbl 12(%rcx), %r10d
vpxor %xmm9, %xmm14, %xmm2
movzbl 10(%rcx), %r9d
vpsrlq $63, %xmm8, %xmm6
movzbl 14(%rcx), %r11d
vpsrlq $63, %xmm2, %xmm0
vpaddq %xmm8, %xmm8, %xmm5
vpaddq %xmm2, %xmm2, %xmm14
vmovq (%rdi,%rsi), %xmm15
vpor %xmm5, %xmm6, %xmm8
vmovq (%r10,%rsi), %xmm3
vpor %xmm14, %xmm0, %xmm6
vpinsrq $1, (%r9,%rsi), %xmm15, %xmm5
vpinsrq $1, (%r11,%rsi), %xmm3, %xmm0
vpalignr $8, %xmm8, %xmm6, %xmm2
vpalignr $8, %xmm6, %xmm8, %xmm14
vpalignr $8, %xmm10, %xmm11, %xmm8
vpalignr $8, %xmm11, %xmm10, %xmm11
vpaddq %xmm5, %xmm4, %xmm4
vpaddq %xmm0, %xmm7, %xmm7
vpaddq %xmm2, %xmm4, %xmm15
vpaddq %xmm14, %xmm7, %xmm0
vpxor %xmm15, %xmm8, %xmm6
vpxor %xmm0, %xmm11, %xmm10
vpshufd $177, %xmm6, %xmm6
vpshufd $177, %xmm10, %xmm8
movzbl 9(%rcx), %r12d
movzbl 13(%rcx), %r14d
vpaddq %xmm6, %xmm9, %xmm4
vpaddq %xmm8, %xmm13, %xmm7
movzbl 11(%rcx), %r13d
vpxor %xmm4, %xmm2, %xmm9
movzbl 15(%rcx), %r15d
vpxor %xmm7, %xmm14, %xmm2
vmovq (%r12,%rsi), %xmm14
addq $16, %rcx
vmovq (%r14,%rsi), %xmm3
vpshufb %xmm1, %xmm9, %xmm13
vpinsrq $1, (%r13,%rsi), %xmm14, %xmm5
vpinsrq $1, (%r15,%rsi), %xmm3, %xmm9
vpshufb %xmm1, %xmm2, %xmm11
vpaddq %xmm5, %xmm15, %xmm15
vpaddq %xmm9, %xmm0, %xmm0
vpaddq %xmm13, %xmm15, %xmm2
vpaddq %xmm11, %xmm0, %xmm0
vpxor %xmm2, %xmm6, %xmm6
vpxor %xmm0, %xmm8, %xmm8
vpshufb %xmm12, %xmm6, %xmm14
vpshufb %xmm12, %xmm8, %xmm15
vpaddq %xmm14, %xmm4, %xmm8
vpaddq %xmm15, %xmm7, %xmm6
vpxor %xmm8, %xmm13, %xmm4
vpxor %xmm6, %xmm11, %xmm11
vpaddq %xmm4, %xmm4, %xmm10
vpsrlq $63, %xmm4, %xmm7
vpsrlq $63, %xmm11, %xmm13
vpaddq %xmm11, %xmm11, %xmm4
vpor %xmm10, %xmm7, %xmm3
vpor %xmm4, %xmm13, %xmm11
vpalignr $8, %xmm11, %xmm3, %xmm4
vpalignr $8, %xmm3, %xmm11, %xmm7
vpalignr $8, %xmm15, %xmm14, %xmm10
vpalignr $8, %xmm14, %xmm15, %xmm9
cmpq %rbx, %rcx
jb blake2b_blocks_avx_L23
blake2b_blocks_avx_L24:
movq 32(%rsi), %r13
movq (%rsi), %r10
movq 48(%rsi), %r9
vmovd %r13, %xmm13
vpinsrq $1, %r9, %xmm13, %xmm14
vmovd %r10, %xmm3
movq 16(%rsi), %rbx
vpinsrq $1, %rbx, %xmm3, %xmm15
vpaddq %xmm14, %xmm0, %xmm0
vpaddq %xmm7, %xmm0, %xmm3
vpxor %xmm3, %xmm10, %xmm10
vpaddq %xmm15, %xmm2, %xmm2
vpaddq %xmm4, %xmm2, %xmm5
vpshufd $177, %xmm10, %xmm15
vpxor %xmm5, %xmm9, %xmm9
vpshufd $177, %xmm9, %xmm9
vpaddq %xmm15, %xmm8, %xmm14
vpaddq %xmm9, %xmm6, %xmm0
vpxor %xmm14, %xmm7, %xmm7
vpxor %xmm0, %xmm4, %xmm8
vpshufb %xmm1, %xmm7, %xmm4
vpshufb %xmm1, %xmm8, %xmm2
vmovq 8(%rsi), %xmm7
movq %r8, 288(%rsp)
movq 24(%rsi), %r8
vpinsrq $1, %r8, %xmm7, %xmm6
vpinsrq $1, %r10, %xmm7, %xmm7
vpaddq %xmm6, %xmm5, %xmm13
movq 40(%rsi), %rcx
movq 56(%rsi), %rdi
vpaddq %xmm2, %xmm13, %xmm13
vmovd %rcx, %xmm5
vpxor %xmm13, %xmm9, %xmm9
vpinsrq $1, %rdi, %xmm5, %xmm10
vpshufb %xmm12, %xmm9, %xmm5
vpaddq %xmm10, %xmm3, %xmm3
vpaddq %xmm4, %xmm3, %xmm11
vpaddq %xmm5, %xmm0, %xmm3
vpxor %xmm11, %xmm15, %xmm8
vpshufb %xmm12, %xmm8, %xmm10
vpaddq %xmm10, %xmm14, %xmm8
vpxor %xmm3, %xmm2, %xmm14
vpxor %xmm8, %xmm4, %xmm9
vpsrlq $63, %xmm14, %xmm4
vpsrlq $63, %xmm9, %xmm0
vpaddq %xmm14, %xmm14, %xmm14
movq 64(%rsi), %r15
vpor %xmm14, %xmm4, %xmm6
vpaddq %xmm9, %xmm9, %xmm4
vmovq 96(%rsi), %xmm9
vpor %xmm4, %xmm0, %xmm2
movq 112(%rsi), %r14
vmovd %r15, %xmm15
vpinsrq $1, %r14, %xmm9, %xmm0
vpinsrq $1, %rbx, %xmm9, %xmm9
vpalignr $8, %xmm6, %xmm2, %xmm4
vpalignr $8, %xmm2, %xmm6, %xmm2
vpaddq %xmm0, %xmm11, %xmm11
movq 80(%rsi), %r11
vpinsrq $1, %r11, %xmm15, %xmm14
vpaddq %xmm2, %xmm11, %xmm11
vpalignr $8, %xmm10, %xmm5, %xmm15
vpalignr $8, %xmm5, %xmm10, %xmm5
vpxor %xmm11, %xmm5, %xmm10
vpaddq %xmm14, %xmm13, %xmm13
vpaddq %xmm4, %xmm13, %xmm6
vpshufd $177, %xmm10, %xmm14
vpxor %xmm6, %xmm15, %xmm13
vpaddq %xmm14, %xmm3, %xmm0
vpshufd $177, %xmm13, %xmm13
vpaddq %xmm13, %xmm8, %xmm15
vpxor %xmm0, %xmm2, %xmm8
vpxor %xmm15, %xmm4, %xmm3
vpshufb %xmm1, %xmm8, %xmm5
vpshufb %xmm1, %xmm3, %xmm4
vmovq 72(%rsi), %xmm8
movq %rax, 296(%rsp)
movq 88(%rsi), %rax
vpinsrq $1, %rax, %xmm8, %xmm2
movq 104(%rsi), %r12
vpaddq %xmm2, %xmm6, %xmm6
vpinsrq $1, %r12, %xmm8, %xmm8
vmovd %r12, %xmm3
vpaddq %xmm4, %xmm6, %xmm10
vpxor %xmm10, %xmm13, %xmm13
movq %rsi, 280(%rsp)
movq 120(%rsi), %rsi
vpinsrq $1, %rsi, %xmm3, %xmm6
vpshufb %xmm12, %xmm13, %xmm3
vpaddq %xmm6, %xmm11, %xmm11
vpaddq %xmm5, %xmm11, %xmm6
vpxor %xmm6, %xmm14, %xmm14
vpshufb %xmm12, %xmm14, %xmm2
vpaddq %xmm3, %xmm15, %xmm14
vpaddq %xmm2, %xmm0, %xmm0
vpaddq %xmm8, %xmm6, %xmm6
vpxor %xmm14, %xmm4, %xmm4
vpxor %xmm0, %xmm5, %xmm13
vpsrlq $63, %xmm4, %xmm5
vpsrlq $63, %xmm13, %xmm15
vpaddq %xmm4, %xmm4, %xmm4
vpaddq %xmm13, %xmm13, %xmm13
vpor %xmm4, %xmm5, %xmm11
vpor %xmm13, %xmm15, %xmm5
vpalignr $8, %xmm5, %xmm11, %xmm15
vmovd %r11, %xmm4
vpalignr $8, %xmm11, %xmm5, %xmm5
vmovd %r14, %xmm11
vpinsrq $1, %r13, %xmm11, %xmm13
vpinsrq $1, %r15, %xmm4, %xmm11
vpaddq %xmm5, %xmm6, %xmm6
vpaddq %xmm13, %xmm10, %xmm10
vpaddq %xmm15, %xmm10, %xmm10
vpalignr $8, %xmm3, %xmm2, %xmm13
vpxor %xmm10, %xmm13, %xmm8
vmovd %rsi, %xmm13
vpshufd $177, %xmm8, %xmm8
vpalignr $8, %xmm2, %xmm3, %xmm3
vpxor %xmm6, %xmm3, %xmm2
vpaddq %xmm8, %xmm0, %xmm3
vpaddq %xmm11, %xmm10, %xmm10
vpxor %xmm3, %xmm15, %xmm0
vpshufd $177, %xmm2, %xmm2
vpshufb %xmm1, %xmm0, %xmm0
vpaddq %xmm2, %xmm14, %xmm14
vpxor %xmm14, %xmm5, %xmm5
vpshufb %xmm1, %xmm5, %xmm15
vpaddq %xmm0, %xmm10, %xmm5
vpinsrq $1, %r9, %xmm13, %xmm10
vpaddq %xmm10, %xmm6, %xmm6
vpaddq %xmm15, %xmm6, %xmm13
vpxor %xmm5, %xmm8, %xmm10
vpxor %xmm13, %xmm2, %xmm8
vpshufb %xmm12, %xmm10, %xmm4
vpshufb %xmm12, %xmm8, %xmm6
vpaddq %xmm4, %xmm3, %xmm8
vpaddq %xmm6, %xmm14, %xmm2
vpxor %xmm8, %xmm0, %xmm14
vpxor %xmm2, %xmm15, %xmm15
vpaddq %xmm14, %xmm14, %xmm0
vpsrlq $63, %xmm14, %xmm3
vpsrlq $63, %xmm15, %xmm14
vpor %xmm0, %xmm3, %xmm10
vpaddq %xmm15, %xmm15, %xmm3
vpor %xmm3, %xmm14, %xmm0
vpaddq %xmm7, %xmm5, %xmm14
vpalignr $8, %xmm10, %xmm0, %xmm11
vmovd %rax, %xmm5
vpaddq %xmm11, %xmm14, %xmm7
vpinsrq $1, %rcx, %xmm5, %xmm14
vpalignr $8, %xmm0, %xmm10, %xmm15
vpaddq %xmm9, %xmm7, %xmm3
vmovd %rdi, %xmm9
vpinsrq $1, %r8, %xmm9, %xmm10
vpaddq %xmm14, %xmm13, %xmm13
vpaddq %xmm15, %xmm13, %xmm5
vpalignr $8, %xmm6, %xmm4, %xmm13
vpalignr $8, %xmm4, %xmm6, %xmm4
vpxor %xmm7, %xmm13, %xmm14
vpxor %xmm5, %xmm4, %xmm6
vpshufd $177, %xmm14, %xmm13
vpshufd $177, %xmm6, %xmm14
vpaddq %xmm13, %xmm2, %xmm6
vpaddq %xmm14, %xmm8, %xmm4
vpaddq %xmm10, %xmm5, %xmm5
vpxor %xmm6, %xmm11, %xmm2
vpxor %xmm4, %xmm15, %xmm8
vpshufb %xmm1, %xmm2, %xmm2
vpshufb %xmm1, %xmm8, %xmm8
vpaddq %xmm2, %xmm3, %xmm7
vpaddq %xmm8, %xmm5, %xmm5
vpxor %xmm7, %xmm13, %xmm13
vpxor %xmm5, %xmm14, %xmm14
vpshufb %xmm12, %xmm13, %xmm13
vpshufb %xmm12, %xmm14, %xmm14
vpaddq %xmm13, %xmm6, %xmm10
vpaddq %xmm14, %xmm4, %xmm0
vpxor %xmm10, %xmm2, %xmm2
vpxor %xmm0, %xmm8, %xmm8
vpaddq %xmm2, %xmm2, %xmm6
vpaddq %xmm8, %xmm8, %xmm15
vpsrlq $63, %xmm2, %xmm4
vpsrlq $63, %xmm8, %xmm11
vpor %xmm6, %xmm4, %xmm3
vpor %xmm15, %xmm11, %xmm9
vpxor %xmm0, %xmm7, %xmm0
vpxor 208(%rsp), %xmm0, %xmm7
vpxor %xmm10, %xmm5, %xmm0
vpalignr $8, %xmm9, %xmm3, %xmm4
vpalignr $8, %xmm13, %xmm14, %xmm5
vpalignr $8, %xmm3, %xmm9, %xmm3
vpxor %xmm5, %xmm4, %xmm6
vpalignr $8, %xmm14, %xmm13, %xmm8
vpxor %xmm8, %xmm3, %xmm9
vmovdqu %xmm7, 208(%rsp)
vpxor 224(%rsp), %xmm0, %xmm2
vpxor 256(%rsp), %xmm6, %xmm7
vpxor 240(%rsp), %xmm9, %xmm10
movq 296(%rsp), %rax
movq 288(%rsp), %r8
movq 280(%rsp), %rsi
vmovdqu %xmm2, 224(%rsp)
vmovdqu %xmm7, 256(%rsp)
vmovdqu %xmm10, 240(%rsp)
cmpq $128, %rdx
ja blake2b_blocks_avx_L25
blake2b_blocks_avx_L26:
vmovdqu 240(%rsp), %xmm8
vmovdqu 256(%rsp), %xmm7
vmovdqu 224(%rsp), %xmm6
vmovdqu 208(%rsp), %xmm5
movq 128(%rsp), %rdi
vmovdqu %xmm5, (%rdi)
vmovdqu %xmm6, 16(%rdi)
vmovdqu %xmm7, 32(%rdi)
vmovdqu %xmm8, 48(%rdi)
movq %r8, 64(%rdi)
movq %rax, 72(%rdi)
addq $344, %rsp
popq %rbx
popq %r15
popq %r14
popq %r13
popq %r12
movq %rbp, %rsp
popq %rbp
ret

.align 16,0x90
.globl blake2b_blocks_xop
.globl _blake2b_blocks_xop
blake2b_blocks_xop:
_blake2b_blocks_xop:
pushq %rbp
movl $128, %r9d
movq %rsp, %rbp
pushq %rbx
andq $-64, %rsp
subq $584, %rsp
cmpq $128, %rdx
cmovbe %rdx, %r9
cmpq $0, 80(%rdi)
movq 64(%rdi), %rax
vmovdqa 80(%rdi), %xmm0
movq 72(%rdi), %r8
vpxor 48+blake2b_constants(%rip), %xmm0, %xmm0
vmovdqa %xmm0, -88(%rsp)
je blake2b_blocks_xop_L2
cmpq $128, %rdx
je blake2b_blocks_xop_L2
testb $64, %dl
jne blake2b_blocks_xop_L15
vpxor %xmm0, %xmm0, %xmm0
leaq 456(%rsp), %r11
movq %r11, %r10
vmovdqa %xmm0, 520(%rsp)
vmovdqa %xmm0, 536(%rsp)
vmovdqa %xmm0, 552(%rsp)
vmovdqa %xmm0, 568(%rsp)
blake2b_blocks_xop_L4:
vpxor %xmm0, %xmm0, %xmm0
testb $32, %dl
vmovdqa %xmm0, (%r10)
vmovdqa %xmm0, 16(%r10)
vmovdqa %xmm0, 32(%r10)
vmovdqa %xmm0, 48(%r10)
jne blake2b_blocks_xop_L16
blake2b_blocks_xop_L5:
testb $16, %dl
jne blake2b_blocks_xop_L17
blake2b_blocks_xop_L6:
testb $8, %dl
je blake2b_blocks_xop_L7
movq (%rsi), %rbx
addq $8, %rsi
movq %rbx, (%r10)
addq $8, %r10
blake2b_blocks_xop_L7:
testb $4, %dl
je blake2b_blocks_xop_L8
movl (%rsi), %ebx
addq $4, %rsi
movl %ebx, (%r10)
addq $4, %r10
blake2b_blocks_xop_L8:
testb $2, %dl
je blake2b_blocks_xop_L9
movzwl (%rsi), %ebx
addq $2, %rsi
movw %bx, (%r10)
addq $2, %r10
blake2b_blocks_xop_L9:
testb $1, %dl
je blake2b_blocks_xop_L13
movzbl (%rsi), %esi
movb %sil, (%r10)
movq %r11, %rsi
.align 16,0x90
blake2b_blocks_xop_L2:
vmovdqa (%rdi), %xmm0
vmovdqa 16(%rdi), %xmm2
vmovdqa %xmm0, %xmm14
vmovdqa 32(%rdi), %xmm6
vmovdqa 48(%rdi), %xmm7
vmovdqa %xmm0, 184(%rsp)
vmovdqa %xmm2, 168(%rsp)
vmovdqa %xmm6, 312(%rsp)
vmovdqa %xmm7, 296(%rsp)
jmp blake2b_blocks_xop_L12
.align 16,0x90
blake2b_blocks_xop_L18:
vmovdqa 184(%rsp), %xmm14
addq %rcx, %rsi
addq $-128, %rdx
blake2b_blocks_xop_L12:
vpxor %xmm8, %xmm8, %xmm8
addq %r9, %rax
vmovdqu 16(%rsi), %xmm1
adcq $0, %r8
cmpq $128, %rdx
vpinsrq $0, %r8, %xmm8, %xmm6
vmovdqu (%rsi), %xmm0
vpinsrq $0, %rax, %xmm8, %xmm7
vmovdqa %xmm1, 440(%rsp)
vpunpcklqdq %xmm6, %xmm7, %xmm7
vmovdqu 48(%rsi), %xmm4
vpunpcklqdq 440(%rsp), %xmm0, %xmm9
vmovdqu 32(%rsi), %xmm5
vpxor 32+blake2b_constants(%rip), %xmm7, %xmm7
vmovdqu 112(%rsi), %xmm15
vpunpcklqdq %xmm4, %xmm5, %xmm12
vmovdqu 96(%rsi), %xmm1
vpaddq %xmm9, %xmm14, %xmm13
vpaddq 312(%rsp), %xmm13, %xmm13
vmovdqu 80(%rsi), %xmm2
vpxor %xmm13, %xmm7, %xmm7
vmovdqu 64(%rsi), %xmm3
vmovdqa %xmm15, 424(%rsp)
vprotq $32, %xmm7, %xmm7
vpaddq blake2b_constants(%rip), %xmm7, %xmm11
vpxor 312(%rsp), %xmm11, %xmm6
vmovdqa %xmm9, 120(%rsp)
vmovdqa %xmm12, 104(%rsp)
vprotq $40, %xmm6, %xmm6
vmovdqa 168(%rsp), %xmm15
vpaddq %xmm12, %xmm15, %xmm14
vpaddq 296(%rsp), %xmm14, %xmm14
vpxor -88(%rsp), %xmm14, %xmm9
vpunpckhqdq 440(%rsp), %xmm0, %xmm12
vpunpckhqdq %xmm4, %xmm5, %xmm15
vprotq $32, %xmm9, %xmm9
vpaddq 16+blake2b_constants(%rip), %xmm9, %xmm10
vpxor 296(%rsp), %xmm10, %xmm8
vpaddq %xmm12, %xmm13, %xmm13
vpaddq %xmm15, %xmm14, %xmm14
vpaddq %xmm6, %xmm13, %xmm13
vpxor %xmm13, %xmm7, %xmm7
vmovdqa %xmm12, 88(%rsp)
vprotq $40, %xmm8, %xmm8
vpaddq %xmm8, %xmm14, %xmm14
vpxor %xmm14, %xmm9, %xmm9
vprotq $48, %xmm7, %xmm7
vpaddq %xmm7, %xmm11, %xmm11
vpxor %xmm11, %xmm6, %xmm6
vmovdqa %xmm15, 72(%rsp)
vprotq $48, %xmm9, %xmm9
vpaddq %xmm9, %xmm10, %xmm10
vpxor %xmm10, %xmm8, %xmm8
vprotq $1, %xmm6, %xmm6
vpalignr $8, %xmm7, %xmm9, %xmm15
vpalignr $8, %xmm9, %xmm7, %xmm7
vprotq $1, %xmm8, %xmm8
vpunpcklqdq 424(%rsp), %xmm1, %xmm9
vpalignr $8, %xmm6, %xmm8, %xmm12
vpalignr $8, %xmm8, %xmm6, %xmm8
vpunpcklqdq %xmm2, %xmm3, %xmm6
vpaddq %xmm6, %xmm13, %xmm13
vpaddq %xmm12, %xmm13, %xmm13
vpxor %xmm13, %xmm7, %xmm7
vpaddq %xmm9, %xmm14, %xmm14
vpaddq %xmm8, %xmm14, %xmm14
vpxor %xmm14, %xmm15, %xmm15
vmovdqa %xmm9, 248(%rsp)
vprotq $32, %xmm7, %xmm9
vpunpckhqdq 424(%rsp), %xmm1, %xmm7
vpaddq %xmm9, %xmm10, %xmm10
vmovdqa %xmm6, 56(%rsp)
vprotq $32, %xmm15, %xmm15
vpaddq %xmm15, %xmm11, %xmm11
vpunpckhqdq %xmm2, %xmm3, %xmm6
vpxor %xmm10, %xmm12, %xmm12
vpxor %xmm11, %xmm8, %xmm8
vpaddq %xmm6, %xmm13, %xmm13
vpaddq %xmm7, %xmm14, %xmm14
vmovdqa %xmm6, 40(%rsp)
vprotq $40, %xmm12, %xmm12
vpaddq %xmm12, %xmm13, %xmm13
vpxor %xmm13, %xmm9, %xmm9
vprotq $40, %xmm8, %xmm8
vpaddq %xmm8, %xmm14, %xmm14
vpxor %xmm14, %xmm15, %xmm15
vmovdqa %xmm7, 24(%rsp)
vprotq $48, %xmm9, %xmm9
vpaddq %xmm9, %xmm10, %xmm10
vpxor %xmm10, %xmm12, %xmm12
vprotq $48, %xmm15, %xmm6
vpaddq %xmm6, %xmm11, %xmm11
vpxor %xmm11, %xmm8, %xmm8
vpunpckhqdq %xmm1, %xmm3, %xmm15
vprotq $1, %xmm12, %xmm12
vprotq $1, %xmm8, %xmm7
vpalignr $8, %xmm7, %xmm12, %xmm8
vpalignr $8, %xmm12, %xmm7, %xmm7
vpalignr $8, %xmm6, %xmm9, %xmm12
vpalignr $8, %xmm9, %xmm6, %xmm6
vmovdqa 424(%rsp), %xmm9
vpaddq %xmm15, %xmm14, %xmm14
vpaddq %xmm7, %xmm14, %xmm14
vpxor %xmm14, %xmm12, %xmm12
vpunpcklqdq %xmm5, %xmm9, %xmm9
vprotq $32, %xmm12, %xmm12
vpaddq %xmm12, %xmm10, %xmm10
vpxor %xmm10, %xmm7, %xmm7
vpaddq %xmm9, %xmm13, %xmm13
vpaddq %xmm8, %xmm13, %xmm13
vpxor %xmm13, %xmm6, %xmm6
vmovdqa %xmm9, 232(%rsp)
vpunpcklqdq %xmm3, %xmm2, %xmm9
vprotq $40, %xmm7, %xmm7
vmovdqa %xmm15, 8(%rsp)
vprotq $32, %xmm6, %xmm6
vpalignr $8, 424(%rsp), %xmm4, %xmm15
vpaddq %xmm6, %xmm11, %xmm11
vpxor %xmm11, %xmm8, %xmm8
vmovdqa %xmm15, -8(%rsp)
vpaddq %xmm9, %xmm13, %xmm13
vprotq $40, %xmm8, %xmm8
vpaddq %xmm8, %xmm13, %xmm13
vpxor %xmm13, %xmm6, %xmm6
vpaddq -8(%rsp), %xmm14, %xmm14
vpaddq %xmm7, %xmm14, %xmm14
vpxor %xmm14, %xmm12, %xmm12
vmovdqa %xmm9, 216(%rsp)
vprotq $48, %xmm6, %xmm6
vpaddq %xmm6, %xmm11, %xmm11
vpxor %xmm11, %xmm8, %xmm8
vprotq $48, %xmm12, %xmm12
vpaddq %xmm12, %xmm10, %xmm10
vpxor %xmm10, %xmm7, %xmm7
vmovdqa %xmm2, 280(%rsp)
vprotq $1, %xmm8, %xmm15
vprotq $1, %xmm7, %xmm8
vpshufd $78, %xmm0, %xmm7
vpalignr $8, %xmm15, %xmm8, %xmm9
vpalignr $8, %xmm8, %xmm15, %xmm8
vpalignr $8, %xmm6, %xmm12, %xmm15
vpalignr $8, %xmm12, %xmm6, %xmm6
vmovdqa %xmm5, 344(%rsp)
vmovdqa %xmm7, 152(%rsp)
vpunpckhqdq %xmm5, %xmm2, %xmm7
vpaddq 152(%rsp), %xmm13, %xmm13
vpaddq %xmm9, %xmm13, %xmm13
vpxor %xmm13, %xmm6, %xmm6
vpaddq %xmm7, %xmm14, %xmm14
vpaddq %xmm8, %xmm14, %xmm14
vpxor %xmm14, %xmm15, %xmm15
vmovdqa %xmm7, -24(%rsp)
vpunpckhqdq 440(%rsp), %xmm4, %xmm7
vprotq $32, %xmm6, %xmm12
vpaddq %xmm12, %xmm10, %xmm10
vprotq $32, %xmm15, %xmm15
vpaddq %xmm15, %xmm11, %xmm11
vpxor %xmm11, %xmm8, %xmm8
vpunpcklqdq 440(%rsp), %xmm1, %xmm6
vpxor %xmm10, %xmm9, %xmm9
vprotq $40, %xmm8, %xmm8
vpaddq %xmm7, %xmm14, %xmm14
vpaddq %xmm8, %xmm14, %xmm14
vpxor %xmm14, %xmm15, %xmm15
vmovdqa %xmm7, 328(%rsp)
vprotq $40, %xmm9, %xmm9
vpaddq %xmm6, %xmm13, %xmm13
vpaddq %xmm9, %xmm13, %xmm13
vpxor %xmm13, %xmm12, %xmm12
vprotq $48, %xmm15, %xmm7
vpaddq %xmm7, %xmm11, %xmm11
vmovdqa %xmm6, -40(%rsp)
vpunpckhqdq 424(%rsp), %xmm5, %xmm15
vprotq $48, %xmm12, %xmm12
vpaddq %xmm12, %xmm10, %xmm10
vpxor %xmm11, %xmm8, %xmm8
vpxor %xmm10, %xmm9, %xmm6
vprotq $1, %xmm8, %xmm8
vpaddq %xmm15, %xmm14, %xmm14
vmovdqa %xmm15, 200(%rsp)
vprotq $1, %xmm6, %xmm6
vpalignr $8, %xmm8, %xmm6, %xmm9
vpalignr $8, %xmm6, %xmm8, %xmm6
vpalignr $8, %xmm7, %xmm12, %xmm8
vpaddq %xmm6, %xmm14, %xmm14
vpalignr $8, %xmm12, %xmm7, %xmm7
vpxor %xmm14, %xmm8, %xmm8
vpalignr $8, %xmm2, %xmm1, %xmm12
vpaddq %xmm12, %xmm13, %xmm13
vpunpcklqdq %xmm0, %xmm3, %xmm12
vpaddq %xmm9, %xmm13, %xmm13
vmovdqa 440(%rsp), %xmm15
vpxor %xmm13, %xmm7, %xmm7
vprotq $32, %xmm8, %xmm8
vpaddq %xmm8, %xmm10, %xmm10
vpxor %xmm10, %xmm6, %xmm6
vmovdqa %xmm12, 376(%rsp)
vprotq $32, %xmm7, %xmm7
vpaddq %xmm7, %xmm11, %xmm11
vpxor %xmm11, %xmm9, %xmm9
vpblendw $240, %xmm1, %xmm15, %xmm12
vprotq $40, %xmm6, %xmm6
vpaddq 376(%rsp), %xmm13, %xmm13
vmovdqa %xmm15, 408(%rsp)
vprotq $40, %xmm9, %xmm9
vpaddq %xmm12, %xmm14, %xmm14
vpaddq %xmm9, %xmm13, %xmm13
vpaddq %xmm6, %xmm14, %xmm14
vpxor %xmm13, %xmm7, %xmm7
vpxor %xmm14, %xmm8, %xmm8
vprotq $48, %xmm7, %xmm7
vpaddq %xmm7, %xmm11, %xmm11
vpxor %xmm11, %xmm9, %xmm9
vprotq $48, %xmm8, %xmm8
vpaddq %xmm8, %xmm10, %xmm10
vpxor %xmm10, %xmm6, %xmm6
vprotq $1, %xmm9, %xmm15
vprotq $1, %xmm6, %xmm9
vpalignr $8, %xmm7, %xmm8, %xmm6
vpalignr $8, %xmm8, %xmm7, %xmm7
vpunpckhqdq %xmm3, %xmm4, %xmm8
vpalignr $8, %xmm15, %xmm9, %xmm12
vpalignr $8, %xmm9, %xmm15, %xmm9
vpblendw $240, 408(%rsp), %xmm2, %xmm15
vpaddq %xmm8, %xmm14, %xmm14
vpaddq %xmm15, %xmm13, %xmm13
vpaddq %xmm9, %xmm14, %xmm14
vpaddq %xmm12, %xmm13, %xmm13
vpxor %xmm14, %xmm6, %xmm6
vpxor %xmm13, %xmm7, %xmm7
vmovdqa 424(%rsp), %xmm8
vprotq $32, %xmm6, %xmm6
vpunpcklqdq %xmm4, %xmm8, %xmm15
vpaddq %xmm6, %xmm11, %xmm11
vprotq $32, %xmm7, %xmm7
vpxor %xmm11, %xmm9, %xmm9
vpaddq %xmm7, %xmm10, %xmm10
vpxor %xmm10, %xmm12, %xmm12
vpalignr $8, %xmm0, %xmm5, %xmm8
vpaddq %xmm8, %xmm14, %xmm14
vpaddq %xmm15, %xmm13, %xmm13
vprotq $40, %xmm9, %xmm9
vpaddq %xmm9, %xmm14, %xmm14
vpxor %xmm14, %xmm6, %xmm6
vprotq $40, %xmm12, %xmm12
vpaddq %xmm12, %xmm13, %xmm13
vpxor %xmm13, %xmm7, %xmm7
vpaddq 328(%rsp), %xmm13, %xmm13
vprotq $48, %xmm6, %xmm6
vpaddq %xmm6, %xmm11, %xmm11
vpxor %xmm11, %xmm9, %xmm9
vprotq $48, %xmm7, %xmm7
vpaddq %xmm7, %xmm10, %xmm10
vpxor %xmm10, %xmm12, %xmm12
vprotq $1, %xmm9, %xmm8
vprotq $1, %xmm12, %xmm12
vpalignr $8, %xmm8, %xmm12, %xmm9
vpalignr $8, %xmm12, %xmm8, %xmm12
vpalignr $8, %xmm6, %xmm7, %xmm8
vpalignr $8, %xmm7, %xmm6, %xmm7
vpunpckhqdq %xmm2, %xmm1, %xmm6
vpaddq %xmm9, %xmm13, %xmm13
vpxor %xmm13, %xmm7, %xmm7
vpaddq %xmm6, %xmm14, %xmm14
vpaddq %xmm12, %xmm14, %xmm14
vpxor %xmm14, %xmm8, %xmm8
vpunpckhqdq %xmm0, %xmm3, %xmm6
vprotq $32, %xmm7, %xmm7
vpaddq %xmm7, %xmm11, %xmm11
vpxor %xmm11, %xmm9, %xmm9
vpaddq 248(%rsp), %xmm14, %xmm14
vprotq $32, %xmm8, %xmm8
vpaddq %xmm8, %xmm10, %xmm10
vpxor %xmm10, %xmm12, %xmm12
vpaddq %xmm6, %xmm13, %xmm13
vprotq $40, %xmm9, %xmm9
vpaddq %xmm9, %xmm13, %xmm13
vpxor %xmm13, %xmm7, %xmm7
vprotq $40, %xmm12, %xmm12
vpaddq %xmm12, %xmm14, %xmm14
vpxor %xmm14, %xmm8, %xmm8
vprotq $48, %xmm7, %xmm7
vpaddq %xmm7, %xmm11, %xmm11
vpxor %xmm11, %xmm9, %xmm9
vprotq $48, %xmm8, %xmm8
vpaddq %xmm8, %xmm10, %xmm10
vpxor %xmm10, %xmm12, %xmm12
vpalignr $8, %xmm7, %xmm8, %xmm15
vmovdqa %xmm15, 376(%rsp)
vpalignr $8, %xmm8, %xmm7, %xmm7
vprotq $1, %xmm9, %xmm6
vprotq $1, %xmm12, %xmm9
vpalignr $8, %xmm6, %xmm9, %xmm12
vpalignr $8, %xmm9, %xmm6, %xmm9
vmovdqa 424(%rsp), %xmm15
vmovdqa 408(%rsp), %xmm6
vmovdqa %xmm15, 264(%rsp)
vpblendw $240, %xmm15, %xmm5, %xmm15
vpblendw $240, %xmm5, %xmm6, %xmm8
vmovdqa %xmm15, 360(%rsp)
vpaddq %xmm15, %xmm14, %xmm15
vpaddq %xmm9, %xmm15, %xmm15
vpxor 376(%rsp), %xmm15, %xmm6
vpaddq %xmm8, %xmm13, %xmm13
vpaddq %xmm12, %xmm13, %xmm13
vpxor %xmm13, %xmm7, %xmm7
vpunpcklqdq %xmm2, %xmm4, %xmm8
vpunpcklqdq %xmm3, %xmm0, %xmm14
vprotq $32, %xmm7, %xmm7
vprotq $32, %xmm6, %xmm6
vpaddq %xmm7, %xmm10, %xmm10
vpaddq %xmm6, %xmm11, %xmm11
vpxor %xmm10, %xmm12, %xmm12
vpaddq %xmm8, %xmm13, %xmm13
vpxor %xmm11, %xmm9, %xmm9
vpaddq %xmm14, %xmm15, %xmm15
vmovdqa %xmm8, -56(%rsp)
vprotq $40, %xmm12, %xmm12
vpaddq %xmm12, %xmm13, %xmm13
vpxor %xmm13, %xmm7, %xmm7
vprotq $40, %xmm9, %xmm9
vpaddq %xmm9, %xmm15, %xmm15
vpxor %xmm15, %xmm6, %xmm6
vmovdqa %xmm14, -72(%rsp)
vprotq $48, %xmm7, %xmm7
vpaddq %xmm7, %xmm10, %xmm10
vpxor %xmm10, %xmm12, %xmm12
vprotq $48, %xmm6, %xmm6
vpaddq %xmm6, %xmm11, %xmm11
vpxor %xmm11, %xmm9, %xmm9
vpunpckhqdq %xmm5, %xmm3, %xmm14
vprotq $1, %xmm12, %xmm12
vprotq $1, %xmm9, %xmm8
vpalignr $8, %xmm8, %xmm12, %xmm9
vpalignr $8, %xmm12, %xmm8, %xmm12
vpalignr $8, %xmm6, %xmm7, %xmm8
vmovdqa %xmm8, 376(%rsp)
vpalignr $8, %xmm7, %xmm6, %xmm7
vpaddq %xmm14, %xmm13, %xmm13
vpaddq %xmm9, %xmm13, %xmm13
vpxor %xmm13, %xmm7, %xmm7
vmovdqa 440(%rsp), %xmm8
vprotq $32, %xmm7, %xmm7
vpaddq %xmm7, %xmm11, %xmm11
vpxor %xmm11, %xmm9, %xmm9
vpunpcklqdq %xmm2, %xmm8, %xmm6
vprotq $40, %xmm9, %xmm9
vpaddq %xmm6, %xmm15, %xmm15
vpaddq %xmm12, %xmm15, %xmm15
vpxor 376(%rsp), %xmm15, %xmm8
vpblendw $240, %xmm4, %xmm0, %xmm6
vmovdqa %xmm4, 376(%rsp)
vpaddq 360(%rsp), %xmm15, %xmm15
vpaddq %xmm6, %xmm13, %xmm13
vpaddq %xmm9, %xmm13, %xmm13
vpxor %xmm13, %xmm7, %xmm7
vmovdqa %xmm0, 136(%rsp)
vprotq $32, %xmm8, %xmm8
vpaddq %xmm8, %xmm10, %xmm10
vpxor %xmm10, %xmm12, %xmm12
vprotq $48, %xmm7, %xmm7
vpaddq %xmm7, %xmm11, %xmm11
vpxor %xmm11, %xmm9, %xmm9
vprotq $40, %xmm12, %xmm12
vpaddq %xmm12, %xmm15, %xmm15
vpxor %xmm15, %xmm8, %xmm8
vprotq $1, %xmm9, %xmm6
vprotq $48, %xmm8, %xmm8
vpaddq %xmm8, %xmm10, %xmm10
vpxor %xmm10, %xmm12, %xmm12
vprotq $1, %xmm12, %xmm9
vpalignr $8, %xmm6, %xmm9, %xmm12
vpalignr $8, %xmm9, %xmm6, %xmm9
vpalignr $8, %xmm7, %xmm8, %xmm6
vpalignr $8, %xmm8, %xmm7, %xmm7
vmovdqa 264(%rsp), %xmm8
vmovdqa %xmm6, 360(%rsp)
vpblendw $240, %xmm2, %xmm8, %xmm14
vpblendw $240, 408(%rsp), %xmm4, %xmm8
vpaddq %xmm14, %xmm13, %xmm13
vpaddq %xmm12, %xmm13, %xmm13
vpxor %xmm13, %xmm7, %xmm7
vpaddq %xmm8, %xmm15, %xmm15
vpaddq %xmm9, %xmm15, %xmm15
vpxor 360(%rsp), %xmm15, %xmm6
vpblendw $240, %xmm1, %xmm3, %xmm8
vpalignr $8, %xmm0, %xmm1, %xmm14
vpaddq %xmm14, %xmm13, %xmm13
vprotq $32, %xmm7, %xmm7
vpaddq %xmm7, %xmm10, %xmm10
vpxor %xmm10, %xmm12, %xmm12
vpaddq %xmm8, %xmm15, %xmm15
vmovdqa 440(%rsp), %xmm14
vprotq $32, %xmm6, %xmm6
vpaddq %xmm6, %xmm11, %xmm11
vpxor %xmm11, %xmm9, %xmm9
vprotq $40, %xmm12, %xmm12
vpaddq %xmm12, %xmm13, %xmm13
vpxor %xmm13, %xmm7, %xmm7
vmovdqa %xmm8, -104(%rsp)
vprotq $40, %xmm9, %xmm9
vpaddq %xmm9, %xmm15, %xmm15
vpxor %xmm15, %xmm6, %xmm6
vprotq $48, %xmm7, %xmm7
vpaddq %xmm7, %xmm10, %xmm10
vpxor %xmm10, %xmm12, %xmm12
vpaddq -72(%rsp), %xmm15, %xmm15
vprotq $48, %xmm6, %xmm6
vpaddq %xmm6, %xmm11, %xmm11
vpxor %xmm11, %xmm9, %xmm9
vprotq $1, %xmm12, %xmm12
vprotq $1, %xmm9, %xmm8
vpalignr $8, %xmm8, %xmm12, %xmm9
vpalignr $8, %xmm12, %xmm8, %xmm12
vpalignr $8, %xmm6, %xmm7, %xmm8
vpalignr $8, %xmm7, %xmm6, %xmm7
vpunpcklqdq %xmm4, %xmm14, %xmm6
vpaddq %xmm12, %xmm15, %xmm15
vpxor %xmm15, %xmm8, %xmm8
vpunpcklqdq %xmm2, %xmm1, %xmm14
vpaddq %xmm6, %xmm13, %xmm13
vpaddq %xmm9, %xmm13, %xmm13
vpxor %xmm13, %xmm7, %xmm7
vpunpckhqdq 440(%rsp), %xmm2, %xmm6
vprotq $32, %xmm8, %xmm8
vpaddq %xmm8, %xmm10, %xmm10
vpaddq %xmm14, %xmm13, %xmm13
vprotq $32, %xmm7, %xmm7
vpxor %xmm10, %xmm12, %xmm12
vpaddq %xmm7, %xmm11, %xmm11
vpxor %xmm11, %xmm9, %xmm9
vprotq $40, %xmm12, %xmm12
vpaddq %xmm6, %xmm15, %xmm15
vpaddq %xmm12, %xmm15, %xmm15
vprotq $40, %xmm9, %xmm9
vpxor %xmm15, %xmm8, %xmm8
vpaddq %xmm9, %xmm13, %xmm13
vpxor %xmm13, %xmm7, %xmm7
vprotq $48, %xmm8, %xmm8
vpaddq %xmm8, %xmm10, %xmm10
vpxor %xmm10, %xmm12, %xmm12
vprotq $48, %xmm7, %xmm7
vpaddq %xmm7, %xmm11, %xmm11
vpxor %xmm11, %xmm9, %xmm9
vprotq $1, %xmm9, %xmm6
vprotq $1, %xmm12, %xmm9
vpalignr $8, %xmm6, %xmm9, %xmm14
vpalignr $8, %xmm9, %xmm6, %xmm9
vpalignr $8, %xmm7, %xmm8, %xmm6
vmovdqa %xmm6, -72(%rsp)
vpalignr $8, %xmm8, %xmm7, %xmm7
vpblendw $240, %xmm4, %xmm5, %xmm8
vpaddq %xmm8, %xmm13, %xmm13
vpaddq %xmm14, %xmm13, %xmm13
vpxor %xmm13, %xmm7, %xmm7
vmovdqa 424(%rsp), %xmm6
vpunpckhqdq %xmm5, %xmm1, %xmm8
vpunpckhqdq %xmm0, %xmm6, %xmm12
vprotq $32, %xmm7, %xmm7
vpaddq %xmm7, %xmm10, %xmm10
vpxor %xmm10, %xmm14, %xmm14
vpaddq %xmm8, %xmm13, %xmm13
vpaddq %xmm12, %xmm15, %xmm15
vpaddq %xmm9, %xmm15, %xmm15
vpxor -72(%rsp), %xmm15, %xmm6
vmovdqa 264(%rsp), %xmm12
vprotq $40, %xmm14, %xmm14
vpaddq %xmm14, %xmm13, %xmm13
vpxor %xmm13, %xmm7, %xmm7
vpblendw $240, %xmm3, %xmm12, %xmm12
vprotq $32, %xmm6, %xmm6
vmovdqa %xmm12, 360(%rsp)
vpaddq %xmm6, %xmm11, %xmm11
vpxor %xmm11, %xmm9, %xmm9
vprotq $48, %xmm7, %xmm7
vpaddq %xmm7, %xmm10, %xmm10
vpxor %xmm10, %xmm14, %xmm14
vpaddq 360(%rsp), %xmm15, %xmm12
vpunpcklqdq %xmm4, %xmm0, %xmm15
vprotq $40, %xmm9, %xmm9
vpaddq %xmm9, %xmm12, %xmm12
vpxor %xmm12, %xmm6, %xmm6
vprotq $1, %xmm14, %xmm14
vpaddq 232(%rsp), %xmm12, %xmm12
vprotq $48, %xmm6, %xmm6
vpaddq %xmm6, %xmm11, %xmm11
vpxor %xmm11, %xmm9, %xmm9
vprotq $1, %xmm9, %xmm8
vpalignr $8, %xmm8, %xmm14, %xmm9
vpalignr $8, %xmm14, %xmm8, %xmm14
vpalignr $8, %xmm6, %xmm7, %xmm8
vpalignr $8, %xmm7, %xmm6, %xmm7
vpblendw $240, %xmm0, %xmm1, %xmm6
vpaddq %xmm14, %xmm12, %xmm12
vpxor %xmm12, %xmm8, %xmm8
vpaddq %xmm6, %xmm13, %xmm13
vpaddq %xmm9, %xmm13, %xmm13
vpxor %xmm13, %xmm7, %xmm7
vpalignr $8, %xmm1, %xmm2, %xmm6
vpaddq 200(%rsp), %xmm13, %xmm13
vpaddq %xmm6, %xmm12, %xmm12
vprotq $32, %xmm8, %xmm8
vpaddq %xmm8, %xmm10, %xmm10
vpxor %xmm10, %xmm14, %xmm14
vprotq $32, %xmm7, %xmm7
vpaddq %xmm7, %xmm11, %xmm11
vpxor %xmm11, %xmm9, %xmm9
vprotq $40, %xmm14, %xmm14
vpaddq %xmm14, %xmm12, %xmm12
vpxor %xmm12, %xmm8, %xmm8
vprotq $40, %xmm9, %xmm9
vpaddq %xmm9, %xmm13, %xmm13
vpxor %xmm13, %xmm7, %xmm7
vpaddq %xmm15, %xmm13, %xmm13
vmovdqa 408(%rsp), %xmm15
vprotq $48, %xmm8, %xmm8
vpaddq %xmm8, %xmm10, %xmm10
vpxor %xmm10, %xmm14, %xmm14
vprotq $48, %xmm7, %xmm7
vpaddq %xmm7, %xmm11, %xmm11
vpxor %xmm11, %xmm9, %xmm9
vprotq $1, %xmm9, %xmm6
vprotq $1, %xmm14, %xmm9
vpalignr $8, %xmm6, %xmm9, %xmm14
vpalignr $8, %xmm9, %xmm6, %xmm9
vpalignr $8, %xmm7, %xmm8, %xmm6
vpalignr $8, %xmm8, %xmm7, %xmm7
vpshufd $78, %xmm3, %xmm8
vpaddq %xmm14, %xmm13, %xmm13
vpxor %xmm13, %xmm7, %xmm7
vpaddq 328(%rsp), %xmm13, %xmm13
vpaddq %xmm8, %xmm12, %xmm12
vpaddq %xmm9, %xmm12, %xmm12
vpxor %xmm12, %xmm6, %xmm6
vprotq $32, %xmm7, %xmm7
vpaddq %xmm7, %xmm10, %xmm10
vpxor %xmm10, %xmm14, %xmm14
vpblendw $240, %xmm2, %xmm15, %xmm8
vpunpckhqdq %xmm4, %xmm1, %xmm15
vprotq $32, %xmm6, %xmm6
vpaddq %xmm6, %xmm11, %xmm11
vpxor %xmm11, %xmm9, %xmm9
vprotq $40, %xmm14, %xmm14
vpaddq %xmm8, %xmm12, %xmm12
vpaddq %xmm14, %xmm13, %xmm13
vpxor %xmm13, %xmm7, %xmm7
vpaddq %xmm15, %xmm13, %xmm13
vprotq $40, %xmm9, %xmm9
vpaddq %xmm9, %xmm12, %xmm12
vpxor %xmm12, %xmm6, %xmm6
vmovdqa 424(%rsp), %xmm15
vprotq $48, %xmm7, %xmm7
vpaddq %xmm7, %xmm10, %xmm10
vpxor %xmm10, %xmm14, %xmm14
vprotq $48, %xmm6, %xmm6
vpaddq %xmm6, %xmm11, %xmm11
vpxor %xmm11, %xmm9, %xmm9
vpalignr $8, %xmm2, %xmm15, %xmm15
vmovdqa %xmm15, 392(%rsp)
vprotq $1, %xmm14, %xmm14
vpunpcklqdq 424(%rsp), %xmm4, %xmm15
vprotq $1, %xmm9, %xmm8
vpalignr $8, %xmm8, %xmm14, %xmm9
vpalignr $8, %xmm14, %xmm8, %xmm14
vpalignr $8, %xmm6, %xmm7, %xmm8
vmovdqa %xmm8, 360(%rsp)
vpalignr $8, %xmm7, %xmm6, %xmm7
vpblendw $240, 408(%rsp), %xmm1, %xmm6
vpaddq %xmm9, %xmm13, %xmm13
vpxor %xmm13, %xmm7, %xmm7
vpaddq 392(%rsp), %xmm13, %xmm13
vpaddq %xmm6, %xmm12, %xmm12
vpaddq %xmm14, %xmm12, %xmm12
vpunpckhqdq %xmm3, %xmm0, %xmm6
vpxor 360(%rsp), %xmm12, %xmm8
vprotq $32, %xmm7, %xmm7
vpaddq %xmm7, %xmm11, %xmm11
vpxor %xmm11, %xmm9, %xmm9
vpaddq %xmm6, %xmm12, %xmm12
vprotq $32, %xmm8, %xmm8
vpaddq %xmm8, %xmm10, %xmm10
vpxor %xmm10, %xmm14, %xmm14
vprotq $40, %xmm9, %xmm9
vpaddq %xmm9, %xmm13, %xmm13
vpxor %xmm13, %xmm7, %xmm7
vpaddq 200(%rsp), %xmm13, %xmm13
vprotq $40, %xmm14, %xmm14
vpaddq %xmm14, %xmm12, %xmm12
vpxor %xmm12, %xmm8, %xmm8
vprotq $48, %xmm7, %xmm7
vpaddq %xmm7, %xmm11, %xmm11
vpxor %xmm11, %xmm9, %xmm9
vprotq $48, %xmm8, %xmm8
vpaddq %xmm8, %xmm10, %xmm10
vpxor %xmm10, %xmm14, %xmm14
vprotq $1, %xmm9, %xmm6
vprotq $1, %xmm14, %xmm9
vpalignr $8, %xmm6, %xmm9, %xmm14
vpalignr $8, %xmm9, %xmm6, %xmm9
vpalignr $8, %xmm7, %xmm8, %xmm6
vpalignr $8, %xmm8, %xmm7, %xmm7
vpunpcklqdq 440(%rsp), %xmm3, %xmm8
vpaddq %xmm14, %xmm13, %xmm13
vpxor %xmm13, %xmm7, %xmm7
vpaddq %xmm8, %xmm12, %xmm12
vpaddq %xmm9, %xmm12, %xmm12
vpxor %xmm12, %xmm6, %xmm6
vpunpcklqdq %xmm5, %xmm0, %xmm8
vprotq $32, %xmm7, %xmm7
vpaddq %xmm7, %xmm10, %xmm10
vpxor %xmm10, %xmm14, %xmm14
vpaddq -56(%rsp), %xmm12, %xmm12
vprotq $32, %xmm6, %xmm6
vpaddq %xmm6, %xmm11, %xmm11
vpxor %xmm11, %xmm9, %xmm9
vpaddq %xmm8, %xmm13, %xmm13
vprotq $40, %xmm14, %xmm14
vpaddq %xmm14, %xmm13, %xmm13
vpxor %xmm13, %xmm7, %xmm7
vprotq $40, %xmm9, %xmm9
vpaddq %xmm9, %xmm12, %xmm12
vpxor %xmm12, %xmm6, %xmm6
vpaddq %xmm15, %xmm13, %xmm13
vprotq $48, %xmm7, %xmm7
vpaddq %xmm7, %xmm10, %xmm10
vpxor %xmm10, %xmm14, %xmm14
vprotq $48, %xmm6, %xmm6
vpaddq %xmm6, %xmm11, %xmm11
vpxor %xmm11, %xmm9, %xmm9
vprotq $1, %xmm14, %xmm14
vprotq $1, %xmm9, %xmm8
vpalignr $8, %xmm8, %xmm14, %xmm9
vpalignr $8, %xmm14, %xmm8, %xmm8
vpaddq %xmm9, %xmm13, %xmm13
vpalignr $8, %xmm6, %xmm7, %xmm14
vpalignr $8, %xmm7, %xmm6, %xmm6
vpalignr $8, %xmm2, %xmm0, %xmm7
vpxor %xmm13, %xmm6, %xmm6
vpaddq %xmm7, %xmm12, %xmm12
vpaddq %xmm8, %xmm12, %xmm12
vpxor %xmm12, %xmm14, %xmm14
vmovdqa 424(%rsp), %xmm7
vpalignr $8, %xmm0, %xmm2, %xmm2
vpunpckhqdq %xmm3, %xmm7, %xmm15
vprotq $32, %xmm6, %xmm6
vpaddq %xmm6, %xmm11, %xmm11
vprotq $32, %xmm14, %xmm14
vpxor %xmm11, %xmm9, %xmm9
vpaddq %xmm14, %xmm10, %xmm10
vpxor %xmm10, %xmm8, %xmm8
vpalignr $8, 440(%rsp), %xmm3, %xmm3
vpaddq %xmm3, %xmm12, %xmm3
vpaddq %xmm15, %xmm13, %xmm13
vmovdqa 408(%rsp), %xmm12
vprotq $40, %xmm9, %xmm9
vpaddq %xmm9, %xmm13, %xmm13
vpxor %xmm13, %xmm6, %xmm6
vprotq $40, %xmm8, %xmm8
vpaddq %xmm8, %xmm3, %xmm3
vpxor %xmm3, %xmm14, %xmm14
vpaddq %xmm1, %xmm13, %xmm13
vpaddq %xmm2, %xmm3, %xmm2
vpblendw $240, %xmm4, %xmm12, %xmm3
vprotq $48, %xmm6, %xmm6
vpaddq %xmm6, %xmm11, %xmm11
vpxor %xmm11, %xmm9, %xmm9
vprotq $48, %xmm14, %xmm14
vpaddq %xmm14, %xmm10, %xmm10
vpxor %xmm10, %xmm8, %xmm8
vpunpckhqdq %xmm0, %xmm4, %xmm4
vprotq $1, %xmm9, %xmm9
vpunpcklqdq %xmm0, %xmm1, %xmm0
vprotq $1, %xmm8, %xmm8
vpalignr $8, %xmm9, %xmm8, %xmm7
vpalignr $8, %xmm8, %xmm9, %xmm8
vpaddq %xmm7, %xmm13, %xmm13
vpalignr $8, %xmm6, %xmm14, %xmm9
vpaddq %xmm8, %xmm2, %xmm2
vpalignr $8, %xmm14, %xmm6, %xmm6
vpxor %xmm2, %xmm9, %xmm9
vpaddq %xmm5, %xmm2, %xmm2
vpxor %xmm13, %xmm6, %xmm6
vpaddq %xmm3, %xmm13, %xmm13
vmovdqa 440(%rsp), %xmm14
vprotq $32, %xmm9, %xmm9
vpaddq %xmm9, %xmm11, %xmm11
vpxor %xmm11, %xmm8, %xmm8
vprotq $32, %xmm6, %xmm6
vpaddq %xmm6, %xmm10, %xmm10
vpxor %xmm10, %xmm7, %xmm7
vpunpcklqdq %xmm5, %xmm14, %xmm5
vprotq $40, %xmm8, %xmm8
vpaddq %xmm8, %xmm2, %xmm2
vpxor %xmm2, %xmm9, %xmm9
vprotq $40, %xmm7, %xmm7
vpaddq %xmm7, %xmm13, %xmm13
vpxor %xmm13, %xmm6, %xmm6
vpaddq %xmm4, %xmm2, %xmm4
vpaddq 216(%rsp), %xmm13, %xmm13
vprotq $48, %xmm9, %xmm9
vpaddq %xmm9, %xmm11, %xmm11
vpxor %xmm11, %xmm8, %xmm8
vprotq $48, %xmm6, %xmm6
vpaddq %xmm6, %xmm10, %xmm10
vpxor %xmm10, %xmm7, %xmm7
vprotq $1, %xmm8, %xmm8
vprotq $1, %xmm7, %xmm7
vpalignr $8, %xmm8, %xmm7, %xmm3
vpalignr $8, %xmm7, %xmm8, %xmm7
vpaddq %xmm3, %xmm13, %xmm13
vpaddq %xmm7, %xmm4, %xmm4
vpalignr $8, %xmm9, %xmm6, %xmm8
vpalignr $8, %xmm6, %xmm9, %xmm9
vpxor %xmm4, %xmm8, %xmm8
vpaddq %xmm5, %xmm13, %xmm5
vpxor %xmm13, %xmm9, %xmm9
vmovdqa 376(%rsp), %xmm6
vprotq $32, %xmm8, %xmm8
vpaddq %xmm8, %xmm10, %xmm10
vpxor %xmm10, %xmm7, %xmm7
vprotq $32, %xmm9, %xmm9
vpaddq %xmm9, %xmm11, %xmm11
vpxor %xmm11, %xmm3, %xmm3
vpblendw $240, 344(%rsp), %xmm6, %xmm2
vprotq $40, %xmm7, %xmm7
vprotq $40, %xmm3, %xmm3
vpaddq %xmm2, %xmm4, %xmm2
vpaddq %xmm3, %xmm5, %xmm5
vpaddq %xmm7, %xmm2, %xmm2
vpxor %xmm5, %xmm9, %xmm9
vpaddq %xmm15, %xmm5, %xmm5
vpxor %xmm2, %xmm8, %xmm8
vpunpckhqdq %xmm1, %xmm14, %xmm4
vprotq $48, %xmm9, %xmm9
vpaddq %xmm9, %xmm11, %xmm11
vpxor %xmm11, %xmm3, %xmm3
vprotq $48, %xmm8, %xmm8
vpaddq %xmm8, %xmm10, %xmm10
vpxor %xmm10, %xmm7, %xmm7
vpaddq %xmm4, %xmm2, %xmm2
vprotq $1, %xmm3, %xmm3
vprotq $1, %xmm7, %xmm7
vpalignr $8, %xmm3, %xmm7, %xmm6
vpalignr $8, %xmm7, %xmm3, %xmm3
vpaddq %xmm6, %xmm5, %xmm5
vpaddq %xmm3, %xmm2, %xmm2
vpalignr $8, %xmm9, %xmm8, %xmm7
vpalignr $8, %xmm8, %xmm9, %xmm9
vpxor %xmm2, %xmm7, %xmm7
vpaddq %xmm0, %xmm2, %xmm0
vpxor %xmm5, %xmm9, %xmm9
vpaddq 392(%rsp), %xmm5, %xmm5
vprotq $32, %xmm7, %xmm7
vpaddq %xmm7, %xmm11, %xmm11
vpxor %xmm11, %xmm3, %xmm3
vprotq $32, %xmm9, %xmm9
vpaddq %xmm9, %xmm10, %xmm10
vpxor %xmm10, %xmm6, %xmm6
vprotq $40, %xmm3, %xmm3
vpaddq %xmm3, %xmm0, %xmm0
vpxor %xmm0, %xmm7, %xmm7
vprotq $40, %xmm6, %xmm6
vpaddq %xmm6, %xmm5, %xmm5
vpxor %xmm5, %xmm9, %xmm9
vpaddq 104(%rsp), %xmm0, %xmm0
vpaddq 120(%rsp), %xmm5, %xmm5
vprotq $48, %xmm7, %xmm7
vpaddq %xmm7, %xmm11, %xmm11
vpxor %xmm11, %xmm3, %xmm3
vprotq $48, %xmm9, %xmm9
vpaddq %xmm9, %xmm10, %xmm10
vpxor %xmm10, %xmm6, %xmm6
vprotq $1, %xmm3, %xmm3
vprotq $1, %xmm6, %xmm6
vpalignr $8, %xmm3, %xmm6, %xmm4
vpalignr $8, %xmm6, %xmm3, %xmm3
vpaddq %xmm4, %xmm5, %xmm5
vpaddq %xmm3, %xmm0, %xmm2
vpalignr $8, %xmm7, %xmm9, %xmm6
vpalignr $8, %xmm9, %xmm7, %xmm7
vpxor %xmm2, %xmm6, %xmm6
vpaddq 72(%rsp), %xmm2, %xmm2
vpxor %xmm5, %xmm7, %xmm7
vpaddq 88(%rsp), %xmm5, %xmm5
vprotq $32, %xmm6, %xmm6
vpaddq %xmm6, %xmm10, %xmm10
vpxor %xmm10, %xmm3, %xmm3
vprotq $32, %xmm7, %xmm7
vpaddq %xmm7, %xmm11, %xmm11
vpxor %xmm11, %xmm4, %xmm4
vprotq $40, %xmm3, %xmm3
vpaddq %xmm3, %xmm2, %xmm2
vpxor %xmm2, %xmm6, %xmm6
vprotq $40, %xmm4, %xmm4
vpaddq %xmm4, %xmm5, %xmm5
vpxor %xmm5, %xmm7, %xmm7
vpaddq 248(%rsp), %xmm2, %xmm2
vpaddq 56(%rsp), %xmm5, %xmm5
vprotq $48, %xmm6, %xmm6
vpaddq %xmm6, %xmm10, %xmm10
vpxor %xmm10, %xmm3, %xmm3
vprotq $48, %xmm7, %xmm0
vpaddq %xmm0, %xmm11, %xmm11
vpxor %xmm11, %xmm4, %xmm4
vprotq $1, %xmm3, %xmm3
vprotq $1, %xmm4, %xmm4
vpalignr $8, %xmm4, %xmm3, %xmm1
vpalignr $8, %xmm3, %xmm4, %xmm3
vpaddq %xmm1, %xmm5, %xmm5
vpalignr $8, %xmm0, %xmm6, %xmm4
vpaddq %xmm3, %xmm2, %xmm2
vpalignr $8, %xmm6, %xmm0, %xmm0
vpxor %xmm2, %xmm4, %xmm4
vpaddq 24(%rsp), %xmm2, %xmm2
vpxor %xmm5, %xmm0, %xmm0
vpaddq 40(%rsp), %xmm5, %xmm5
vprotq $32, %xmm4, %xmm4
vpaddq %xmm4, %xmm11, %xmm11
vpxor %xmm11, %xmm3, %xmm3
vprotq $32, %xmm0, %xmm0
vpaddq %xmm0, %xmm10, %xmm10
vpxor %xmm10, %xmm1, %xmm1
vprotq $40, %xmm3, %xmm3
vpaddq %xmm3, %xmm2, %xmm2
vpxor %xmm2, %xmm4, %xmm4
vprotq $40, %xmm1, %xmm1
vpaddq %xmm1, %xmm5, %xmm5
vpxor %xmm5, %xmm0, %xmm0
vpaddq 8(%rsp), %xmm2, %xmm2
vpaddq 232(%rsp), %xmm5, %xmm5
vprotq $48, %xmm4, %xmm4
vpaddq %xmm4, %xmm11, %xmm11
vpxor %xmm11, %xmm3, %xmm3
vprotq $48, %xmm0, %xmm0
vpaddq %xmm0, %xmm10, %xmm10
vpxor %xmm10, %xmm1, %xmm1
vprotq $1, %xmm3, %xmm3
vprotq $1, %xmm1, %xmm1
vpalignr $8, %xmm3, %xmm1, %xmm6
vpalignr $8, %xmm1, %xmm3, %xmm1
vpaddq %xmm6, %xmm5, %xmm5
vpalignr $8, %xmm4, %xmm0, %xmm3
vpaddq %xmm1, %xmm2, %xmm2
vpalignr $8, %xmm0, %xmm4, %xmm0
vpxor %xmm2, %xmm3, %xmm3
vpaddq -8(%rsp), %xmm2, %xmm2
vpxor %xmm5, %xmm0, %xmm0
vpaddq 216(%rsp), %xmm5, %xmm5
vprotq $32, %xmm3, %xmm3
vpaddq %xmm3, %xmm10, %xmm10
vpxor %xmm10, %xmm1, %xmm1
vprotq $32, %xmm0, %xmm0
vpaddq %xmm0, %xmm11, %xmm11
vpxor %xmm11, %xmm6, %xmm6
vprotq $40, %xmm1, %xmm1
vpaddq %xmm1, %xmm2, %xmm2
vpxor %xmm2, %xmm3, %xmm3
vprotq $40, %xmm6, %xmm6
vpaddq %xmm6, %xmm5, %xmm5
vpxor %xmm5, %xmm0, %xmm0
vpaddq -24(%rsp), %xmm2, %xmm2
vpaddq 152(%rsp), %xmm5, %xmm5
vprotq $48, %xmm3, %xmm3
vpaddq %xmm3, %xmm10, %xmm10
vpxor %xmm10, %xmm1, %xmm1
vprotq $48, %xmm0, %xmm0
vpaddq %xmm0, %xmm11, %xmm11
vpxor %xmm11, %xmm6, %xmm6
vprotq $1, %xmm1, %xmm1
vprotq $1, %xmm6, %xmm6
vpalignr $8, %xmm6, %xmm1, %xmm4
vpalignr $8, %xmm1, %xmm6, %xmm1
vpalignr $8, %xmm0, %xmm3, %xmm6
vpaddq %xmm1, %xmm2, %xmm2
vpxor %xmm2, %xmm6, %xmm6
vpaddq %xmm4, %xmm5, %xmm5
vpalignr $8, %xmm3, %xmm0, %xmm0
vpxor %xmm5, %xmm0, %xmm0
vpaddq 328(%rsp), %xmm2, %xmm2
vpaddq -40(%rsp), %xmm5, %xmm5
vprotq $32, %xmm6, %xmm6
vpaddq %xmm6, %xmm11, %xmm11
vpxor %xmm11, %xmm1, %xmm1
vprotq $32, %xmm0, %xmm0
vpaddq %xmm0, %xmm10, %xmm10
vpxor %xmm10, %xmm4, %xmm4
vprotq $40, %xmm1, %xmm1
vpaddq %xmm1, %xmm2, %xmm2
vpxor %xmm2, %xmm6, %xmm6
vprotq $40, %xmm4, %xmm4
vpaddq %xmm4, %xmm5, %xmm5
vpxor %xmm5, %xmm0, %xmm0
vprotq $48, %xmm6, %xmm6
vpaddq %xmm6, %xmm11, %xmm11
vpxor %xmm11, %xmm1, %xmm1
vpxor %xmm11, %xmm5, %xmm11
vprotq $48, %xmm0, %xmm0
vpaddq %xmm0, %xmm10, %xmm10
vpxor %xmm10, %xmm4, %xmm4
vpalignr $8, %xmm6, %xmm0, %xmm3
vpalignr $8, %xmm0, %xmm6, %xmm0
vprotq $1, %xmm1, %xmm1
vpxor %xmm10, %xmm2, %xmm10
vpxor 184(%rsp), %xmm11, %xmm11
vprotq $1, %xmm4, %xmm4
vpalignr $8, %xmm1, %xmm4, %xmm7
vpalignr $8, %xmm4, %xmm1, %xmm1
vpxor %xmm0, %xmm7, %xmm0
vpxor %xmm3, %xmm1, %xmm1
vmovdqa %xmm11, 184(%rsp)
vpxor 168(%rsp), %xmm10, %xmm10
vpxor 312(%rsp), %xmm0, %xmm0
vpxor 296(%rsp), %xmm1, %xmm1
vmovdqa %xmm10, 168(%rsp)
vmovdqa %xmm0, 312(%rsp)
vmovdqa %xmm1, 296(%rsp)
ja blake2b_blocks_xop_L18
vmovdqa %xmm11, (%rdi)
movq %rax, 64(%rdi)
movq %r8, 72(%rdi)
vmovdqa %xmm10, 16(%rdi)
vmovdqa %xmm0, 32(%rdi)
vmovdqa %xmm1, 48(%rdi)
movq -8(%rbp), %rbx
leave
ret
.align 16,0x90
blake2b_blocks_xop_L13:
movq %r11, %rsi
jmp blake2b_blocks_xop_L2
blake2b_blocks_xop_L17:
vmovdqu (%rsi), %xmm0
addq $16, %rsi
vmovdqa %xmm0, (%r10)
addq $16, %r10
jmp blake2b_blocks_xop_L6
blake2b_blocks_xop_L16:
vmovdqu (%rsi), %xmm0
vmovdqa %xmm0, (%r10)
vmovdqu 16(%rsi), %xmm0
addq $32, %rsi
vmovdqa %xmm0, 16(%r10)
addq $32, %r10
jmp blake2b_blocks_xop_L5
blake2b_blocks_xop_L15:
vmovdqu (%rsi), %xmm0
leaq 456(%rsp), %r11
vmovdqa %xmm0, 456(%rsp)
leaq 64(%r11), %r10
vmovdqu 16(%rsi), %xmm0
vmovdqa %xmm0, 472(%rsp)
vmovdqu 32(%rsi), %xmm0
vmovdqa %xmm0, 488(%rsp)
vmovdqu 48(%rsi), %xmm0
addq $64, %rsi
vmovdqa %xmm0, 504(%rsp)
jmp blake2b_blocks_xop_L4


.align 16,0x90
.globl blake2b_blocks_x86
.globl _blake2b_blocks_x86
blake2b_blocks_x86:
_blake2b_blocks_x86:
pushq %r12
pushq %r13
pushq %r14
pushq %r15
pushq %rbx
pushq %rbp
subq $504, %rsp
movl $128, %r13d
cmpq $128, %rdx
movq $0x1f83d9abfb41bd6b, %r15
movq $0x5be0cd19137e2179, %r14
movq 80(%rdi), %rax
cmovbe %rdx, %r13
xorq 88(%rdi), %r14
xorq %rax, %r15
movq %rcx, 136(%rsp)
testq %rax, %rax
je blake2b_blocks_x86_L23
blake2b_blocks_x86_L2:
cmpq $128, %rdx
je blake2b_blocks_x86_L23
blake2b_blocks_x86_L3:
testq $64, %rdx
lea (%rsp), %rcx
jne blake2b_blocks_x86_L5
blake2b_blocks_x86_L4:
pxor %xmm0, %xmm0
movdqa %xmm0, 64(%rsp)
movdqa %xmm0, 80(%rsp)
movdqa %xmm0, 96(%rsp)
movdqa %xmm0, 112(%rsp)
jmp blake2b_blocks_x86_L8
blake2b_blocks_x86_L5:
xorl %ecx, %ecx
xorl %eax, %eax
blake2b_blocks_x86_L6:
movdqu (%rax,%rsi), %xmm0
incq %rcx
movdqa %xmm0, (%rsp,%rax)
addq $16, %rax
cmpq $4, %rcx
jl blake2b_blocks_x86_L6
blake2b_blocks_x86_L7:
addq $64, %rsi
lea 64(%rsp), %rcx
pxor %xmm0, %xmm0
blake2b_blocks_x86_L8:
movdqa %xmm0, (%rcx)
testq $32, %rdx
movdqa %xmm0, 16(%rcx)
movdqa %xmm0, 32(%rcx)
movdqa %xmm0, 48(%rcx)
je blake2b_blocks_x86_L10
blake2b_blocks_x86_L9:
movdqu (%rsi), %xmm0
movdqa %xmm0, (%rcx)
movdqu 16(%rsi), %xmm1
movdqa %xmm1, 16(%rcx)
addq $32, %rsi
addq $32, %rcx
blake2b_blocks_x86_L10:
testq $16, %rdx
je blake2b_blocks_x86_L12
blake2b_blocks_x86_L11:
movdqu (%rsi), %xmm0
movdqa %xmm0, (%rcx)
addq $16, %rsi
addq $16, %rcx
blake2b_blocks_x86_L12:
testq $8, %rdx
je blake2b_blocks_x86_L14
blake2b_blocks_x86_L13:
movq (%rsi), %rax
addq $8, %rsi
movq %rax, (%rcx)
addq $8, %rcx
blake2b_blocks_x86_L14:
testq $4, %rdx
je blake2b_blocks_x86_L16
blake2b_blocks_x86_L15:
movl (%rsi), %eax
addq $4, %rsi
movl %eax, (%rcx)
addq $4, %rcx
blake2b_blocks_x86_L16:
testq $2, %rdx
je blake2b_blocks_x86_L18
blake2b_blocks_x86_L17:
movzwl (%rsi), %eax
addq $2, %rsi
movw %ax, (%rcx)
addq $2, %rcx
blake2b_blocks_x86_L18:
testq $1, %rdx
je blake2b_blocks_x86_L20
blake2b_blocks_x86_L19:
movb (%rsi), %al
movb %al, (%rcx)
blake2b_blocks_x86_L20:
lea (%rsp), %rsi
blake2b_blocks_x86_L23:
movq 40(%rdi), %rax
movq %rax, 248(%rsp)
movq (%rdi), %r11
movq 8(%rdi), %r10
movq 16(%rdi), %r9
movq 24(%rdi), %r8
movq 32(%rdi), %r12
movq 48(%rdi), %rbp
movq 56(%rdi), %rax
movq 64(%rdi), %rcx
movq 72(%rdi), %rbx
movq %rbx, 168(%rsp)
movq %rcx, 192(%rsp)
movq %rax, 232(%rsp)
movq %rbp, 240(%rsp)
movq %r12, 256(%rsp)
movq %r8, 224(%rsp)
movq %r9, 208(%rsp)
movq %r10, 216(%rsp)
movq %r11, 200(%rsp)
movq %r13, 160(%rsp)
movq %r14, 152(%rsp)
movq %r15, 144(%rsp)
movq %rdi, 128(%rsp)
movq %rsi, 184(%rsp)
movq %rdx, 176(%rsp)
jmp blake2b_blocks_x86_L24
blake2b_blocks_x86_L25:
movq 184(%rsp), %rax
addq 136(%rsp), %rax
movq 176(%rsp), %rdx
addq $-128, %rdx
movq %rax, 184(%rsp)
movq %rdx, 176(%rsp)
blake2b_blocks_x86_L24:
movq 200(%rsp), %r12
movq $0x510e527fade682d1, %r13
movq 256(%rsp), %rdx
movq $0x3c6ef372fe94f82b, %rsi
movq 184(%rsp), %rdi
movq 168(%rsp), %rbp
movq 160(%rsp), %r14
addq %rdx, %r12
movq 192(%rsp), %r8
addq %r14, %r8
lea 1(%rbp), %r15
cmpq %r14, %r8
movq (%rdi), %r14
cmovb %r15, %rbp
addq %r14, %r12
xorq %r8, %r13
movq $0x6a09e667f3bcc908, %r15
xorq %r12, %r13
rolq $32, %r13
movq 16(%rdi), %rax
movq 216(%rsp), %rbx
movq %r8, 192(%rsp)
movq %r14, 360(%rsp)
lea (%r15,%r13), %r9
movq $0x9b05688c2b3e6c1f, %r14
lea (%rbx,%rax), %r8
movq %r9, 416(%rsp)
xorq %r9, %rdx
movq 248(%rsp), %r9
addq %r9, %r8
xorq %rbp, %r14
xorq %r8, %r14
movq %rbp, 168(%rsp)
movq $0xbb67ae8584caa73b, %rbp
rolq $32, %r14
movq 32(%rdi), %r11
movq 208(%rsp), %r10
movq %rax, 368(%rsp)
movq 48(%rdi), %rax
movq 224(%rsp), %rcx
movq %r13, 408(%rsp)
lea (%rbp,%r14), %r13
movq 240(%rsp), %r15
lea (%r10,%r11), %rbp
addq %r15, %rbp
movq $0xa54ff53a5f1d36f1, %r10
rolq $40, %rdx
xorq %r13, %r9
movq %rdx, 424(%rsp)
movq %r11, 272(%rsp)
lea (%rcx,%rax), %r11
movq 144(%rsp), %rdx
xorq %rbp, %rdx
movq 232(%rsp), %rcx
addq %rcx, %r11
rolq $32, %rdx
movq %rax, 280(%rsp)
movq 152(%rsp), %rax
xorq %r11, %rax
rolq $32, %rax
lea (%rsi,%rdx), %rbx
xorq %rbx, %r15
rolq $40, %r15
rolq $40, %r9
lea (%r10,%rax), %rsi
movq 40(%rdi), %r10
addq %r10, %rbp
xorq %rsi, %rcx
addq %r15, %rbp
xorq %rbp, %rdx
rolq $48, %rdx
movq %rdx, 432(%rsp)
addq %rdx, %rbx
movq 56(%rdi), %rdx
addq %rdx, %r11
movq %rdx, 376(%rsp)
xorq %rbx, %r15
movq 24(%rdi), %rdx
addq %rdx, %r8
addq %r9, %r8
xorq %r8, %r14
rolq $48, %r14
addq %r14, %r13
movq %r13, 440(%rsp)
xorq %r13, %r9
movq 8(%rdi), %r13
addq %r13, %r12
movq %r10, 264(%rsp)
movq 424(%rsp), %r10
addq %r10, %r12
movq %rdx, 384(%rsp)
movq 408(%rsp), %rdx
xorq %r12, %rdx
rolq $48, %rdx
movq %r13, 328(%rsp)
movq 416(%rsp), %r13
addq %rdx, %r13
rolq $40, %rcx
xorq %r13, %r10
addq %rcx, %r11
rolq $1, %r10
xorq %r11, %rax
movq %r10, 424(%rsp)
movq 64(%rdi), %r10
addq %r10, %r12
rolq $1, %r9
rolq $48, %rax
addq %r9, %r12
addq %rax, %rsi
xorq %r12, %rax
rolq $32, %rax
xorq %rsi, %rcx
addq %rax, %rbx
xorq %rbx, %r9
rolq $40, %r9
movq %r9, 464(%rsp)
movq 96(%rdi), %r9
addq %r9, %rbp
rolq $1, %rcx
addq %rcx, %rbp
xorq %rbp, %r14
rolq $32, %r14
addq %r14, %r13
xorq %r13, %rcx
movq %r10, 312(%rsp)
movq 104(%rdi), %r10
addq %r10, %rbp
rolq $40, %rcx
movq %rax, 448(%rsp)
addq %rcx, %rbp
movq 112(%rdi), %rax
addq %rax, %r11
movq %r9, 352(%rsp)
xorq %rbp, %r14
movq 424(%rsp), %r9
addq %r9, %r11
movq %rax, 344(%rsp)
movq %rbx, 456(%rsp)
movq 432(%rsp), %rax
movq 80(%rdi), %rbx
xorq %r11, %rax
rolq $1, %r15
addq %rbx, %r8
rolq $48, %r14
addq %r15, %r8
rolq $32, %rax
addq %r14, %r13
movq %rbx, 288(%rsp)
xorq %r8, %rdx
movq 440(%rsp), %rbx
xorq %r13, %rcx
addq %rax, %rbx
xorq %rbx, %r9
rolq $32, %rdx
rolq $1, %rcx
addq %rdx, %rsi
movq %rcx, 472(%rsp)
xorq %rsi, %r15
movq 120(%rdi), %rcx
addq %rcx, %r11
rolq $40, %r9
addq %r9, %r11
movq %r11, 480(%rsp)
xorq %r11, %rax
movq 88(%rdi), %r11
addq %r11, %r8
rolq $40, %r15
addq %r15, %r8
xorq %r8, %rdx
rolq $48, %rax
movq %rcx, 296(%rsp)
addq %rax, %rbx
rolq $48, %rdx
xorq %rbx, %r9
movq 72(%rdi), %rcx
addq %rcx, %r12
movq %r11, 304(%rsp)
addq %rdx, %rsi
movq 464(%rsp), %r11
addq %r11, %r12
movq %rsi, 488(%rsp)
xorq %rsi, %r15
movq 448(%rsp), %rsi
addq %rcx, %rbp
rolq $1, %r9
xorq %r12, %rsi
addq 344(%rsp), %r12
addq %r9, %r12
xorq %r12, %rdx
rolq $32, %rdx
rolq $48, %rsi
addq %rdx, %r13
movq 456(%rsp), %rdi
xorq %r13, %r9
movq %r13, 416(%rsp)
addq %rsi, %rdi
movq 480(%rsp), %r13
xorq %rdi, %r11
addq %r10, %r13
movq %rcx, 336(%rsp)
movq %rsi, 448(%rsp)
movq 472(%rsp), %rcx
addq %rcx, %r13
movq %rdx, 408(%rsp)
rolq $1, %r11
addq 272(%rsp), %r8
movq 448(%rsp), %rdx
addq %r11, %r8
xorq %r13, %rdx
xorq %r8, %r14
rolq $32, %rdx
rolq $1, %r15
movq 488(%rsp), %rsi
addq %r15, %rbp
addq %rdx, %rsi
xorq %rbp, %rax
rolq $32, %r14
xorq %rsi, %rcx
addq %r14, %rbx
addq 280(%rsp), %r13
xorq %rbx, %r11
rolq $40, %rcx
rolq $32, %rax
addq %rcx, %r13
addq %rax, %rdi
xorq %r13, %rdx
addq 312(%rsp), %r8
xorq %rdi, %r15
rolq $40, %r11
addq %r11, %r8
rolq $48, %rdx
xorq %r8, %r14
addq 296(%rsp), %rbp
addq %rdx, %rsi
rolq $40, %r15
xorq %rsi, %rcx
addq %r15, %rbp
rolq $48, %r14
xorq %rbp, %rax
addq 288(%rsp), %r12
addq %r14, %rbx
rolq $40, %r9
xorq %rbx, %r11
addq 304(%rsp), %rbp
addq %r9, %r12
rolq $1, %rcx
rolq $48, %rax
addq %rcx, %rbp
movq %rbx, 440(%rsp)
addq %rax, %rdi
movq 408(%rsp), %rbx
xorq %rbp, %r14
xorq %r12, %rbx
xorq %rdi, %r15
rolq $48, %rbx
movq %rax, 432(%rsp)
movq 416(%rsp), %rax
rolq $32, %r14
addq %rbx, %rax
addq 360(%rsp), %r8
xorq %rax, %r9
rolq $1, %r15
addq %r14, %rax
addq %r15, %r8
xorq %rax, %rcx
xorq %r8, %rbx
addq 376(%rsp), %rbp
rolq $40, %rcx
rolq $32, %rbx
addq %rcx, %rbp
addq 328(%rsp), %r12
addq %rbx, %rsi
rolq $1, %r11
xorq %rbp, %r14
addq %r11, %r12
xorq %rsi, %r15
xorq %r12, %rdx
rolq $48, %r14
addq 264(%rsp), %r13
addq %r14, %rax
addq 368(%rsp), %r8
xorq %rax, %rcx
rolq $1, %r9
rolq $40, %r15
addq %r9, %r13
rolq $32, %rdx
addq %r15, %r8
addq %rdx, %rdi
xorq %r8, %rbx
movq %r10, 320(%rsp)
xorq %rdi, %r11
movq 432(%rsp), %r10
xorq %r13, %r10
rolq $1, %rcx
movq %rcx, 472(%rsp)
rolq $32, %r10
rolq $48, %rbx
movq 352(%rsp), %rcx
addq %rcx, %r12
rolq $40, %r11
addq %rbx, %rsi
movq %rdi, 456(%rsp)
addq %r11, %r12
movq 440(%rsp), %rdi
xorq %rsi, %r15
movq %rdx, 448(%rsp)
addq %r10, %rdi
movq %rsi, 488(%rsp)
xorq %rdi, %r9
movq 448(%rsp), %rsi
addq %rcx, %r8
xorq %r12, %rsi
addq 384(%rsp), %r13
rolq $40, %r9
rolq $48, %rsi
addq %r9, %r13
movq 456(%rsp), %rdx
xorq %r13, %r10
addq %rsi, %rdx
xorq %rdx, %r11
rolq $48, %r10
rolq $1, %r11
addq %r10, %rdi
addq %r11, %r8
xorq %rdi, %r9
addq 264(%rsp), %rbp
xorq %r8, %r14
rolq $1, %r15
addq 304(%rsp), %r12
addq %r15, %rbp
rolq $1, %r9
xorq %rbp, %r10
rolq $32, %r14
addq %r9, %r12
addq 296(%rsp), %r13
addq %r14, %rdi
movq 472(%rsp), %rcx
xorq %r12, %rbx
movq %rsi, 448(%rsp)
xorq %rdi, %r11
rolq $32, %r10
addq %rcx, %r13
rolq $32, %rbx
addq %r10, %rdx
movq 448(%rsp), %rsi
addq %rbx, %rax
addq 360(%rsp), %r8
xorq %r13, %rsi
rolq $40, %r11
xorq %rdx, %r15
rolq $32, %rsi
addq %r11, %r8
movq %rax, 416(%rsp)
xorq %rax, %r9
movq 488(%rsp), %rax
xorq %r8, %r14
addq 368(%rsp), %rbp
addq %rsi, %rax
rolq $40, %r15
xorq %rax, %rcx
rolq $48, %r14
addq %r15, %rbp
addq 312(%rsp), %r12
xorq %rbp, %r10
rolq $40, %r9
addq %r14, %rdi
addq 320(%rsp), %r13
addq %r9, %r12
rolq $40, %rcx
xorq %rdi, %r11
rolq $48, %r10
addq %rcx, %r13
xorq %r12, %rbx
addq %r10, %rdx
addq 288(%rsp), %r12
xorq %r13, %rsi
rolq $1, %r11
xorq %rdx, %r15
rolq $48, %rbx
addq %r11, %r12
movq %r10, 432(%rsp)
rolq $48, %rsi
movq 416(%rsp), %r10
addq %rsi, %rax
addq %rbx, %r10
xorq %r12, %rsi
addq 384(%rsp), %r8
xorq %r10, %r9
rolq $1, %r15
xorq %rax, %rcx
rolq $32, %rsi
addq %r15, %r8
addq 336(%rsp), %r13
addq %rsi, %rdx
rolq $1, %r9
xorq %r8, %rbx
addq %r9, %r13
xorq %rdx, %r11
movq %rdx, 456(%rsp)
rolq $32, %rbx
movq 432(%rsp), %rdx
addq %rbx, %rax
xorq %r13, %rdx
xorq %rax, %r15
rolq $32, %rdx
addq 376(%rsp), %rbp
addq %rdx, %rdi
rolq $1, %rcx
xorq %rdi, %r9
addq 280(%rsp), %r8
addq %rcx, %rbp
rolq $40, %r15
xorq %rbp, %r14
addq %r15, %r8
addq 272(%rsp), %r13
xorq %r8, %rbx
addq 344(%rsp), %r12
rolq $40, %r11
rolq $40, %r9
addq %r11, %r12
rolq $32, %r14
addq %r9, %r13
rolq $48, %rbx
addq %r14, %r10
xorq %r13, %rdx
xorq %r12, %rsi
addq %rbx, %rax
xorq %r10, %rcx
rolq $48, %rdx
xorq %rax, %r15
rolq $48, %rsi
addq %rdx, %rdi
movq %rax, 488(%rsp)
xorq %rdi, %r9
movq 456(%rsp), %rax
addq 328(%rsp), %rbp
addq %rsi, %rax
rolq $40, %rcx
xorq %rax, %r11
addq %rcx, %rbp
addq 376(%rsp), %r12
xorq %rbp, %r14
addq 384(%rsp), %r8
addq 320(%rsp), %rbp
rolq $1, %r9
rolq $1, %r15
addq %r9, %r12
rolq $1, %r11
addq %r15, %rbp
rolq $48, %r14
addq %r11, %r8
addq %r14, %r10
xorq %r12, %rbx
xorq %r8, %r14
xorq %rbp, %rdx
rolq $32, %rbx
xorq %r10, %rcx
rolq $32, %r14
addq %rbx, %r10
rolq $32, %rdx
addq %r14, %rdi
addq %rdx, %rax
xorq %r10, %r9
addq 304(%rsp), %r13
xorq %rdi, %r11
rolq $1, %rcx
xorq %rax, %r15
movq %r12, 392(%rsp)
addq %rcx, %r13
rolq $40, %r9
movq %r8, 400(%rsp)
rolq $40, %r11
rolq $40, %r15
movq 488(%rsp), %r12
blake2b_blocks_x86_L31:
xorq %r13, %rsi
rolq $32, %rsi
movq 400(%rsp), %r8
addq %rsi, %r12
addq 328(%rsp), %r8
xorq %r12, %rcx
addq 344(%rsp), %r13
addq %r11, %r8
rolq $40, %rcx
xorq %r8, %r14
addq %rcx, %r13
rolq $48, %r14
xorq %r13, %rsi
rolq $48, %rsi
addq %r14, %rdi
movq %rdi, 440(%rsp)
addq %rsi, %r12
addq 352(%rsp), %rbp
xorq %rdi, %r11
movq 392(%rsp), %rdi
addq %r15, %rbp
addq 336(%rsp), %rdi
xorq %r12, %rcx
rolq $1, %rcx
xorq %rbp, %rdx
addq 272(%rsp), %rbp
addq %r9, %rdi
xorq %rdi, %rbx
addq %rcx, %rbp
rolq $48, %rbx
xorq %rbp, %r14
rolq $32, %r14
addq %rbx, %r10
rolq $48, %rdx
xorq %r10, %r9
addq %r14, %r10
addq %rdx, %rax
xorq %r10, %rcx
xorq %rax, %r15
addq 368(%rsp), %rdi
rolq $1, %r11
addq 360(%rsp), %rbp
addq %r11, %rdi
rolq $40, %rcx
xorq %rdi, %rsi
addq 264(%rsp), %r8
addq %rcx, %rbp
rolq $1, %r15
xorq %rbp, %r14
addq %r15, %r8
addq 296(%rsp), %r13
xorq %r8, %rbx
rolq $1, %r9
movq %rdx, 432(%rsp)
addq %r9, %r13
rolq $32, %rsi
rolq $48, %r14
addq %rsi, %rax
movq %rsi, 448(%rsp)
addq %r14, %r10
rolq $32, %rbx
xorq %r10, %rcx
movq 432(%rsp), %rsi
addq %rbx, %r12
xorq %r13, %rsi
xorq %rax, %r11
rolq $32, %rsi
xorq %r12, %r15
movq %rax, 456(%rsp)
movq 440(%rsp), %rax
addq %rsi, %rax
rolq $1, %rcx
xorq %rax, %r9
movq %rcx, 472(%rsp)
movq 288(%rsp), %rcx
addq %rcx, %r8
rolq $40, %r15
addq %r15, %r8
addq 312(%rsp), %r13
xorq %r8, %rbx
rolq $40, %r9
addq 280(%rsp), %rdi
addq %r9, %r13
rolq $40, %r11
xorq %r13, %rsi
addq %r11, %rdi
addq %rcx, %r13
rolq $48, %rbx
movq 448(%rsp), %rdx
addq %rbx, %r12
xorq %rdi, %rdx
xorq %r12, %r15
rolq $48, %rsi
rolq $48, %rdx
addq %rsi, %rax
movq %r12, 488(%rsp)
xorq %rax, %r9
movq 456(%rsp), %r12
addq %rdx, %r12
addq 368(%rsp), %rbp
xorq %r12, %r11
rolq $1, %r15
addq %r15, %rbp
addq 336(%rsp), %rdi
xorq %rbp, %rsi
rolq $1, %r9
addq 264(%rsp), %r8
addq %r9, %rdi
rolq $1, %r11
xorq %rdi, %rbx
addq %r11, %r8
rolq $32, %rsi
xorq %r8, %r14
addq %rsi, %r12
movq %rax, 440(%rsp)
xorq %r12, %r15
rolq $32, %rbx
rolq $32, %r14
addq %rbx, %r10
movq %rdx, 448(%rsp)
xorq %r10, %r9
movq %rbx, 408(%rsp)
movq 440(%rsp), %rbx
movq 472(%rsp), %rdx
addq %r14, %rbx
addq %rdx, %r13
xorq %rbx, %r11
addq 272(%rsp), %rbp
movq %r10, 416(%rsp)
rolq $40, %r15
movq 448(%rsp), %r10
addq %r15, %rbp
xorq %r13, %r10
xorq %rbp, %rsi
addq 376(%rsp), %r8
rolq $40, %r11
rolq $32, %r10
addq %r11, %r8
movq 488(%rsp), %rax
xorq %r8, %r14
addq %r10, %rax
rolq $48, %rsi
xorq %rax, %rdx
addq 360(%rsp), %rdi
addq %rsi, %r12
rolq $40, %r9
xorq %r12, %r15
movq %rbx, 440(%rsp)
addq %r9, %rdi
rolq $40, %rdx
addq 296(%rsp), %r13
rolq $48, %r14
addq %rdx, %r13
movq 440(%rsp), %rcx
xorq %r13, %r10
movq 408(%rsp), %rbx
addq %r14, %rcx
xorq %rdi, %rbx
xorq %rcx, %r11
addq 304(%rsp), %r8
rolq $1, %r15
rolq $48, %rbx
addq %r15, %r8
movq %rcx, 440(%rsp)
rolq $48, %r10
rolq $1, %r11
addq %r10, %rax
movq 416(%rsp), %rcx
xorq %rax, %rdx
addq 344(%rsp), %rdi
addq %rbx, %rcx
xorq %r8, %rbx
addq %r11, %rdi
xorq %rcx, %r9
xorq %rdi, %r10
rolq $32, %rbx
addq 384(%rsp), %r13
addq %rbx, %rax
rolq $1, %r9
xorq %rax, %r15
addq 280(%rsp), %rbp
addq %r9, %r13
movq %rsi, 432(%rsp)
rolq $1, %rdx
rolq $32, %r10
addq %rdx, %rbp
movq %r10, 448(%rsp)
addq %r10, %r12
movq 432(%rsp), %r10
xorq %rbp, %r14
xorq %r13, %r10
xorq %r12, %r11
addq 352(%rsp), %r8
rolq $40, %r15
rolq $32, %r10
addq %r15, %r8
movq %r12, 456(%rsp)
xorq %r8, %rbx
rolq $32, %r14
movq 440(%rsp), %r12
addq %r14, %rcx
addq %r10, %r12
xorq %rcx, %rdx
xorq %r12, %r9
rolq $48, %rbx
addq 328(%rsp), %rdi
addq %rbx, %rax
rolq $40, %r11
xorq %rax, %r15
addq 320(%rsp), %r13
addq %r11, %rdi
rolq $40, %r9
addq 312(%rsp), %rbp
addq %r9, %r13
rolq $40, %rdx
xorq %r13, %r10
movq %rax, 488(%rsp)
addq %rdx, %rbp
movq 448(%rsp), %rax
xorq %rbp, %r14
xorq %rdi, %rax
rolq $48, %rax
rolq $48, %r10
movq 456(%rsp), %rsi
addq %r10, %r12
addq %rax, %rsi
xorq %r12, %r9
rolq $48, %r14
xorq %rsi, %r11
addq %r14, %rcx
addq 280(%rsp), %r8
xorq %rcx, %rdx
rolq $1, %r11
addq 368(%rsp), %rdi
addq %r11, %r8
rolq $1, %r9
xorq %r8, %r14
rolq $1, %rdx
addq %r9, %rdi
movq %rdx, 472(%rsp)
xorq %rdi, %rbx
addq 312(%rsp), %r13
movq %rax, 448(%rsp)
movq 472(%rsp), %rax
addq %rax, %r13
rolq $32, %r14
movq 448(%rsp), %rdx
addq %r14, %r12
rolq $32, %rbx
xorq %r13, %rdx
addq %rbx, %rcx
xorq %r12, %r11
rolq $32, %rdx
xorq %rcx, %r9
addq 360(%rsp), %rbp
rolq $1, %r15
movq %rcx, 416(%rsp)
addq %r15, %rbp
movq 488(%rsp), %rcx
xorq %rbp, %r10
addq %rdx, %rcx
addq 288(%rsp), %r8
xorq %rcx, %rax
rolq $40, %r11
addq %r11, %r8
addq 384(%rsp), %r13
xorq %r8, %r14
rolq $40, %rax
rolq $32, %r10
addq %rax, %r13
addq 352(%rsp), %rdi
addq %r10, %rsi
rolq $40, %r9
xorq %r13, %rdx
rolq $48, %r14
addq %r9, %rdi
xorq %rsi, %r15
addq %r14, %r12
xorq %rdi, %rbx
xorq %r12, %r11
rolq $48, %rdx
addq 304(%rsp), %rbp
addq %rdx, %rcx
rolq $40, %r15
xorq %rcx, %rax
rolq $48, %rbx
addq %r15, %rbp
movq %r12, 440(%rsp)
xorq %rbp, %r10
rolq $1, %r11
movq 416(%rsp), %r12
addq 272(%rsp), %rdi
addq %rbx, %r12
addq %r11, %rdi
xorq %r12, %r9
addq 296(%rsp), %rbp
xorq %rdi, %rdx
rolq $1, %rax
rolq $48, %r10
addq %rax, %rbp
addq 328(%rsp), %r13
addq %r10, %rsi
rolq $1, %r9
xorq %rbp, %r14
movq %r10, 432(%rsp)
addq %r9, %r13
rolq $32, %rdx
xorq %rsi, %r15
movq %rdx, 448(%rsp)
addq %rdx, %rsi
movq 432(%rsp), %rdx
xorq %rsi, %r11
xorq %r13, %rdx
rolq $32, %r14
addq 376(%rsp), %r8
addq %r14, %r12
rolq $1, %r15
xorq %r12, %rax
rolq $32, %rdx
addq %r15, %r8
movq 440(%rsp), %r10
xorq %r8, %rbx
addq %rdx, %r10
xorq %r10, %r9
addq 344(%rsp), %rbp
rolq $40, %rax
addq 336(%rsp), %r13
addq %rax, %rbp
rolq $32, %rbx
xorq %rbp, %r14
rolq $40, %r9
addq %rbx, %rcx
addq %r9, %r13
xorq %rcx, %r15
addq 320(%rsp), %rdi
xorq %r13, %rdx
rolq $40, %r11
rolq $48, %r14
addq %r11, %rdi
addq 264(%rsp), %r8
addq %r14, %r12
rolq $40, %r15
xorq %r12, %rax
rolq $48, %rdx
addq %r15, %r8
movq %rsi, 456(%rsp)
addq %rdx, %r10
movq 448(%rsp), %rsi
xorq %r10, %r9
xorq %rdi, %rsi
xorq %r8, %rbx
rolq $48, %rsi
rolq $1, %rax
movq %rax, 472(%rsp)
movq 456(%rsp), %rax
addq 352(%rsp), %rdi
addq %rsi, %rax
rolq $1, %r9
xorq %rax, %r11
rolq $48, %rbx
addq %r9, %rdi
addq %rbx, %rcx
xorq %rdi, %rbx
addq 272(%rsp), %r13
xorq %rcx, %r15
movq %rcx, 488(%rsp)
rolq $1, %r11
addq 328(%rsp), %r8
movq 472(%rsp), %rcx
addq %rcx, %r13
rolq $32, %rbx
addq %r11, %r8
addq 344(%rsp), %rbp
xorq %r13, %rsi
rolq $1, %r15
addq %rbx, %r12
xorq %r8, %r14
addq %r15, %rbp
rolq $32, %rsi
xorq %r12, %r9
movq %r12, 416(%rsp)
xorq %rbp, %rdx
rolq $32, %r14
movq 488(%rsp), %r12
addq %r14, %r10
addq %rsi, %r12
xorq %r10, %r11
rolq $32, %rdx
xorq %r12, %rcx
addq 288(%rsp), %r13
addq %rdx, %rax
rolq $40, %rcx
xorq %rax, %r15
addq 296(%rsp), %r8
addq %rcx, %r13
rolq $40, %r11
xorq %r13, %rsi
addq %r11, %r8
addq 320(%rsp), %rbp
xorq %r8, %r14
addq 264(%rsp), %rdi
rolq $40, %r9
rolq $40, %r15
addq %r9, %rdi
rolq $48, %rsi
addq %r15, %rbp
rolq $48, %r14
xorq %rbp, %rdx
addq %rsi, %r12
xorq %rdi, %rbx
addq %r14, %r10
xorq %r12, %rcx
rolq $48, %rdx
xorq %r10, %r11
rolq $48, %rbx
addq %rdx, %rax
movq %r10, 440(%rsp)
xorq %rax, %r15
movq 416(%rsp), %r10
addq 336(%rsp), %rbp
addq %rbx, %r10
rolq $1, %rcx
xorq %r10, %r9
addq %rcx, %rbp
addq 360(%rsp), %rdi
xorq %rbp, %r14
addq 280(%rsp), %r8
addq 312(%rsp), %r13
rolq $1, %r15
rolq $1, %r11
addq %r15, %r8
rolq $1, %r9
addq %r11, %rdi
rolq $32, %r14
addq %r9, %r13
xorq %rdi, %rsi
xorq %r8, %rbx
addq %r14, %r10
xorq %r13, %rdx
rolq $32, %rsi
xorq %r10, %rcx
rolq $32, %rbx
addq %rsi, %rax
rolq $32, %rdx
addq %rbx, %r12
movq %rdi, 392(%rsp)
xorq %rax, %r11
movq 440(%rsp), %rdi
xorq %r12, %r15
addq 368(%rsp), %rbp
addq %rdx, %rdi
rolq $40, %rcx
xorq %rdi, %r9
addq %rcx, %rbp
rolq $40, %r11
xorq %rbp, %r14
movq %r8, 400(%rsp)
rolq $40, %r15
rolq $40, %r9
blake2b_blocks_x86_L30:
rolq $48, %r14
addq %r14, %r10
xorq %r10, %rcx
rolq $1, %rcx
movq %rcx, 472(%rsp)
movq 400(%rsp), %rcx
addq 384(%rsp), %rcx
addq %r15, %rcx
addq 304(%rsp), %r13
xorq %rcx, %rbx
addq %r9, %r13
rolq $48, %rbx
xorq %r13, %rdx
addq %rbx, %r12
rolq $48, %rdx
xorq %r12, %r15
movq %r12, 488(%rsp)
addq %rdx, %rdi
movq 376(%rsp), %r12
xorq %rdi, %r9
movq 392(%rsp), %r8
addq %r12, %rcx
addq %r12, %r8
addq %r11, %r8
rolq $1, %r9
xorq %r8, %rsi
addq 320(%rsp), %r8
addq %r9, %r8
xorq %r8, %rbx
rolq $48, %rsi
rolq $32, %rbx
addq %rsi, %rax
addq %rbx, %r10
xorq %rax, %r11
addq 384(%rsp), %r13
xorq %r10, %r9
movq %r10, 416(%rsp)
movq %rsi, 448(%rsp)
movq 472(%rsp), %r10
addq %r10, %r13
rolq $1, %r11
movq %rbx, 408(%rsp)
addq %r11, %rcx
movq 448(%rsp), %rbx
xorq %rcx, %r14
xorq %r13, %rbx
rolq $32, %rbx
addq 352(%rsp), %rbp
movq 488(%rsp), %rsi
rolq $1, %r15
addq %rbx, %rsi
rolq $32, %r14
addq %r15, %rbp
xorq %rsi, %r10
addq %r14, %rdi
xorq %rbp, %rdx
xorq %rdi, %r11
addq 336(%rsp), %r13
rolq $40, %r10
rolq $32, %rdx
addq %r10, %r13
addq 344(%rsp), %rcx
addq %rdx, %rax
rolq $40, %r11
xorq %r13, %rbx
addq %r11, %rcx
xorq %rax, %r15
rolq $48, %rbx
xorq %rcx, %r14
addq 328(%rsp), %rbp
addq %rbx, %rsi
rolq $40, %r15
xorq %rsi, %r10
rolq $48, %r14
addq %r15, %rbp
addq 304(%rsp), %r8
addq %r14, %rdi
rolq $40, %r9
xorq %rbp, %rdx
addq %r9, %r8
xorq %rdi, %r11
rolq $1, %r10
movq 408(%rsp), %r12
movq %r10, 472(%rsp)
xorq %r8, %r12
addq 312(%rsp), %rbp
rolq $48, %rdx
movq %rdi, 440(%rsp)
addq %rdx, %rax
rolq $1, %r11
xorq %rax, %r15
addq 264(%rsp), %r8
movq 472(%rsp), %rdi
addq %rdi, %rbp
rolq $48, %r12
addq %r11, %r8
movq 416(%rsp), %r10
xorq %rbp, %r14
addq %r12, %r10
xorq %r8, %rbx
rolq $32, %r14
xorq %r10, %r9
addq 296(%rsp), %rcx
addq %r14, %r10
rolq $1, %r15
xorq %r10, %rdi
rolq $32, %rbx
addq %r15, %rcx
addq 368(%rsp), %r13
addq %rbx, %rax
rolq $1, %r9
xorq %rcx, %r12
movq %rdx, 432(%rsp)
addq %r9, %r13
movq %rbx, 448(%rsp)
xorq %rax, %r11
movq %rax, 456(%rsp)
movq 432(%rsp), %rbx
movq 280(%rsp), %rax
xorq %r13, %rbx
rolq $40, %rdi
addq %rax, %rbp
rolq $32, %r12
addq %rdi, %rbp
rolq $32, %rbx
addq %r12, %rsi
movq 440(%rsp), %rdx
xorq %rbp, %r14
addq %rbx, %rdx
xorq %rsi, %r15
rolq $48, %r14
xorq %rdx, %r9
addq 272(%rsp), %rcx
addq %r14, %r10
rolq $40, %r15
xorq %r10, %rdi
addq 288(%rsp), %r13
addq %r15, %rcx
rolq $40, %r9
xorq %rcx, %r12
addq 360(%rsp), %r8
addq %r9, %r13
rolq $40, %r11
xorq %r13, %rbx
addq %r11, %r8
rolq $1, %rdi
movq %rdi, 472(%rsp)
rolq $48, %r12
movq 448(%rsp), %rdi
addq %r12, %rsi
xorq %r8, %rdi
xorq %rsi, %r15
rolq $48, %rbx
addq %rax, %r8
rolq $48, %rdi
addq %rbx, %rdx
movq %rsi, 488(%rsp)
xorq %rdx, %r9
movq 456(%rsp), %rsi
addq %rdi, %rsi
xorq %rsi, %r11
rolq $1, %r9
addq 344(%rsp), %rcx
addq %r9, %r8
rolq $1, %r11
xorq %r8, %r12
addq 304(%rsp), %rbp
addq %r11, %rcx
rolq $1, %r15
xorq %rcx, %r14
addq %r15, %rbp
rolq $32, %r12
xorq %rbp, %rbx
addq 360(%rsp), %r13
addq %r12, %r10
rolq $32, %r14
xorq %r10, %r9
movq %r12, 408(%rsp)
addq %r14, %rdx
movq %rsi, 456(%rsp)
xorq %rdx, %r11
movq 472(%rsp), %r12
addq %r12, %r13
rolq $32, %rbx
xorq %r13, %rdi
movq 456(%rsp), %rax
addq %rbx, %rax
rolq $32, %rdi
xorq %rax, %r15
addq 336(%rsp), %rcx
rolq $40, %r11
movq 488(%rsp), %rsi
addq %r11, %rcx
addq 384(%rsp), %rbp
addq %rdi, %rsi
rolq $40, %r15
xorq %rsi, %r12
addq 296(%rsp), %r8
addq %r15, %rbp
rolq $40, %r9
xorq %rcx, %r14
addq %r9, %r8
xorq %rbp, %rbx
addq 312(%rsp), %r13
rolq $40, %r12
movq %r10, 416(%rsp)
addq %r12, %r13
rolq $48, %r14
xorq %r13, %rdi
movq 408(%rsp), %r10
addq %r14, %rdx
xorq %r8, %r10
xorq %rdx, %r11
rolq $48, %rbx
rolq $48, %r10
addq %rbx, %rax
movq %rdx, 440(%rsp)
xorq %rax, %r15
movq 416(%rsp), %rdx
addq %r10, %rdx
rolq $48, %rdi
xorq %rdx, %r9
addq 352(%rsp), %r8
addq %rdi, %rsi
rolq $1, %r11
xorq %rsi, %r12
addq 320(%rsp), %rcx
addq %r11, %r8
rolq $1, %r15
xorq %r8, %rdi
addq 288(%rsp), %r13
addq %r15, %rcx
rolq $1, %r9
xorq %rcx, %r10
movq %rbx, 432(%rsp)
addq %r9, %r13
rolq $1, %r12
addq 328(%rsp), %rbp
movq %rax, 456(%rsp)
addq %r12, %rbp
movq %rdx, 416(%rsp)
xorq %rbp, %r14
rolq $32, %rdi
movq 432(%rsp), %rdx
xorq %r13, %rdx
rolq $32, %r10
movq 456(%rsp), %rbx
addq %r10, %rsi
addq %rdi, %rbx
xorq %rsi, %r15
rolq $32, %rdx
xorq %rbx, %r11
movq %rbx, 456(%rsp)
movq 440(%rsp), %rbx
addq %rdx, %rbx
rolq $32, %r14
xorq %rbx, %r9
movq %rdi, 448(%rsp)
movq 416(%rsp), %rdi
movq 376(%rsp), %rax
addq %r14, %rdi
rolq $40, %r15
addq %rax, %rcx
addq 264(%rsp), %r13
xorq %rdi, %r12
rolq $40, %r9
addq %r15, %rcx
addq %r9, %r13
xorq %rcx, %r10
addq 272(%rsp), %rbp
xorq %r13, %rdx
rolq $40, %r12
rolq $48, %r10
addq %r12, %rbp
addq 368(%rsp), %r8
xorq %rbp, %r14
rolq $40, %r11
addq %r10, %rsi
rolq $48, %rdx
addq %r11, %r8
addq %rdx, %rbx
xorq %rsi, %r15
movq %rsi, 488(%rsp)
xorq %rbx, %r9
rolq $48, %r14
addq %rax, %rbp
movq 448(%rsp), %rsi
addq %r14, %rdi
xorq %r8, %rsi
xorq %rdi, %r12
rolq $48, %rsi
addq 288(%rsp), %r8
rolq $1, %r9
movq %rdi, 416(%rsp)
addq %r9, %r8
movq 456(%rsp), %rdi
xorq %r8, %r10
addq %rsi, %rdi
xorq %rdi, %r11
rolq $1, %r15
addq 312(%rsp), %rcx
addq %r15, %rbp
rolq $1, %r11
xorq %rbp, %rdx
rolq $1, %r12
addq %r11, %rcx
movq %r12, 472(%rsp)
xorq %rcx, %r14
rolq $32, %r10
addq 328(%rsp), %r13
movq 416(%rsp), %r12
movq %r10, 408(%rsp)
addq %r10, %r12
movq 472(%rsp), %r10
addq %r10, %r13
rolq $32, %rdx
xorq %r13, %rsi
rolq $32, %r14
addq %rdx, %rdi
rolq $32, %rsi
addq %r14, %rbx
xorq %rdi, %r15
xorq %rbx, %r11
movq 488(%rsp), %rax
xorq %r12, %r9
addq %rsi, %rax
addq 280(%rsp), %rbp
xorq %rax, %r10
rolq $40, %r15
addq 272(%rsp), %rcx
addq %r15, %rbp
rolq $40, %r11
xorq %rbp, %rdx
addq 264(%rsp), %r13
addq %r11, %rcx
rolq $40, %r10
xorq %rcx, %r14
addq %r10, %r13
rolq $48, %rdx
xorq %r13, %rsi
rolq $48, %r14
addq %rdx, %rdi
addq 368(%rsp), %r8
addq %r14, %rbx
rolq $40, %r9
xorq %rdi, %r15
rolq $48, %rsi
addq %r9, %r8
addq %rsi, %rax
xorq %rbx, %r11
movq %rbx, 440(%rsp)
xorq %rax, %r10
movq 408(%rsp), %rbx
addq 336(%rsp), %rcx
xorq %r8, %rbx
rolq $1, %r15
movq %r12, 416(%rsp)
addq %r15, %rcx
rolq $48, %rbx
rolq $1, %r10
movq %r10, 472(%rsp)
rolq $1, %r11
movq 416(%rsp), %r10
addq 296(%rsp), %r8
addq %rbx, %r10
xorq %rcx, %rbx
addq %r11, %r8
addq 384(%rsp), %rbp
xorq %r10, %r9
rolq $32, %rbx
xorq %r8, %rsi
movq 472(%rsp), %r12
addq %r12, %rbp
addq 320(%rsp), %r13
addq %rbx, %rax
rolq $1, %r9
xorq %rbp, %r14
rolq $32, %rsi
xorq %rax, %r15
addq %r9, %r13
addq %rsi, %rdi
rolq $32, %r14
xorq %r13, %rdx
addq 344(%rsp), %rcx
addq %r14, %r10
rolq $40, %r15
xorq %rdi, %r11
rolq $32, %rdx
addq %r15, %rcx
movq %rdi, 456(%rsp)
xorq %r10, %r12
rolq $40, %r11
xorq %rcx, %rbx
movq 440(%rsp), %rdi
addq 304(%rsp), %r8
addq %rdx, %rdi
addq 352(%rsp), %rbp
addq %r11, %r8
rolq $40, %r12
xorq %rdi, %r9
rolq $48, %rbx
addq %r12, %rbp
xorq %r8, %rsi
addq %rbx, %rax
addq 360(%rsp), %r13
xorq %rbp, %r14
rolq $40, %r9
xorq %rax, %r15
rolq $48, %rsi
addq %r9, %r13
movq %rax, 488(%rsp)
xorq %r13, %rdx
rolq $48, %r14
movq 456(%rsp), %rax
addq %r14, %r10
addq %rsi, %rax
xorq %r10, %r12
addq 272(%rsp), %rbp
xorq %rax, %r11
rolq $1, %r15
rolq $48, %rdx
addq %r15, %rbp
addq 368(%rsp), %rcx
addq %rdx, %rdi
rolq $1, %r11
xorq %rbp, %rdx
rolq $1, %r12
addq %r11, %rcx
movq %r12, 472(%rsp)
xorq %rcx, %r14
rolq $32, %rdx
xorq %rdi, %r9
addq 280(%rsp), %r13
addq %rdx, %rax
movq %rcx, 400(%rsp)
xorq %rax, %r15
movq 472(%rsp), %rcx
addq %rcx, %r13
xorq %r13, %rsi
addq 360(%rsp), %r8
addq 264(%rsp), %rbp
rolq $1, %r9
rolq $40, %r15
addq %r9, %r8
rolq $32, %rsi
addq %r15, %rbp
movq 488(%rsp), %r12
xorq %r8, %rbx
addq %rsi, %r12
xorq %rbp, %rdx
xorq %r12, %rcx
addq 376(%rsp), %r13
rolq $32, %rbx
rolq $32, %r14
addq %rbx, %r10
rolq $40, %rcx
addq %r14, %rdi
rolq $48, %rdx
addq %rcx, %r13
addq %rdx, %rax
xorq %r10, %r9
xorq %rdi, %r11
xorq %rax, %r15
xorq %r13, %rsi
movq %r8, 392(%rsp)
rolq $40, %r9
rolq $40, %r11
rolq $1, %r15
rolq $48, %rsi
blake2b_blocks_x86_L29:
movq %rdx, 432(%rsp)
addq %rsi, %r12
movq 400(%rsp), %rdx
xorq %r12, %rcx
addq 384(%rsp), %rdx
addq %r11, %rdx
xorq %rdx, %r14
rolq $48, %r14
addq %r14, %rdi
movq %rdi, 440(%rsp)
xorq %rdi, %r11
movq 392(%rsp), %rdi
addq 328(%rsp), %rdi
addq %r9, %rdi
xorq %rdi, %rbx
rolq $48, %rbx
addq %rbx, %r10
addq 312(%rsp), %rdi
xorq %r10, %r9
rolq $1, %r11
addq %r11, %rdi
addq 344(%rsp), %r13
xorq %rdi, %rsi
rolq $1, %r9
addq 288(%rsp), %rdx
addq %r9, %r13
movq 432(%rsp), %r8
addq %r15, %rdx
rolq $32, %rsi
xorq %r13, %r8
addq %rsi, %rax
xorq %rdx, %rbx
addq 352(%rsp), %rbp
xorq %rax, %r11
rolq $1, %rcx
rolq $32, %r8
addq %rcx, %rbp
movq %rax, 456(%rsp)
xorq %rbp, %r14
rolq $32, %rbx
movq 440(%rsp), %rax
addq %rbx, %r12
addq %r8, %rax
xorq %r12, %r15
xorq %rax, %r9
addq 296(%rsp), %r13
rolq $32, %r14
rolq $40, %r9
addq %r14, %r10
addq 304(%rsp), %rdx
addq %r9, %r13
rolq $40, %r15
xorq %r10, %rcx
addq %r15, %rdx
xorq %r13, %r8
movq %rsi, 448(%rsp)
xorq %rdx, %rbx
movq 320(%rsp), %rsi
addq %rsi, %rbp
rolq $40, %rcx
rolq $48, %r8
addq %rcx, %rbp
movq %r13, 480(%rsp)
addq %r8, %rax
rolq $48, %rbx
xorq %rbp, %r14
movq 336(%rsp), %r13
addq %r13, %rdi
rolq $40, %r11
addq %rbx, %r12
xorq %rax, %r9
addq %r11, %rdi
movq %r12, 488(%rsp)
xorq %r12, %r15
movq 448(%rsp), %r12
addq %r13, %rbp
rolq $48, %r14
xorq %rdi, %r12
addq 344(%rsp), %rdi
addq %r14, %r10
rolq $1, %r9
xorq %r10, %rcx
addq %r9, %rdi
xorq %rdi, %rbx
rolq $48, %r12
rolq $1, %rcx
rolq $32, %rbx
movq %rcx, 472(%rsp)
addq %rbx, %r10
movq 456(%rsp), %rcx
xorq %r10, %r9
addq %r12, %rcx
xorq %rcx, %r11
movq %r10, 416(%rsp)
movq 480(%rsp), %r10
addq %rsi, %r10
addq 272(%rsp), %rdx
rolq $1, %r11
movq 472(%rsp), %r13
addq %r13, %r10
addq %r11, %rdx
xorq %r10, %r12
xorq %rdx, %r14
rolq $32, %r12
rolq $32, %r14
movq 488(%rsp), %rsi
addq %r14, %rax
rolq $1, %r15
addq %r12, %rsi
addq %r15, %rbp
xorq %rsi, %r13
xorq %rax, %r11
xorq %rbp, %r8
addq 280(%rsp), %r10
rolq $40, %r13
addq 312(%rsp), %rdx
addq %r13, %r10
rolq $40, %r11
xorq %r10, %r12
rolq $32, %r8
addq %r11, %rdx
addq %r8, %rcx
xorq %rdx, %r14
rolq $48, %r12
xorq %rcx, %r15
rolq $48, %r14
addq %r12, %rsi
addq 296(%rsp), %rbp
addq %r14, %rax
rolq $40, %r15
xorq %rsi, %r13
addq 288(%rsp), %rdi
addq %r15, %rbp
rolq $40, %r9
xorq %rax, %r11
addq %r9, %rdi
xorq %rbp, %r8
addq 304(%rsp), %rbp
xorq %rdi, %rbx
rolq $1, %r13
addq 328(%rsp), %rdi
addq %r13, %rbp
rolq $1, %r11
xorq %rbp, %r14
addq %r11, %rdi
rolq $48, %rbx
xorq %rdi, %r12
rolq $48, %r8
movq %rax, 440(%rsp)
addq %r8, %rcx
movq 416(%rsp), %rax
xorq %rcx, %r15
rolq $32, %r14
addq %rbx, %rax
rolq $32, %r12
xorq %rax, %r9
addq %r14, %rax
addq %r12, %rcx
xorq %rax, %r13
xorq %rcx, %r11
movq %rcx, 456(%rsp)
movq 360(%rsp), %rcx
addq 264(%rsp), %r10
addq %rdx, %rcx
rolq $1, %r15
rolq $1, %r9
addq %r15, %rcx
rolq $40, %r13
addq %r9, %r10
movq %r12, 448(%rsp)
xorq %rcx, %rbx
movq 376(%rsp), %r12
xorq %r10, %r8
addq %r13, %r12
addq %rbp, %r12
rolq $32, %rbx
xorq %r12, %r14
rolq $32, %r8
addq %rbx, %rsi
movq 440(%rsp), %rdx
xorq %rsi, %r15
addq %r8, %rdx
rolq $48, %r14
xorq %rdx, %r9
addq %r14, %rax
rolq $40, %r15
xorq %rax, %r13
rolq $40, %r9
movq %r13, 472(%rsp)
movq 384(%rsp), %r13
movq 368(%rsp), %rbp
addq %r9, %r13
addq %r15, %rbp
addq %r10, %r13
rolq $40, %r11
addq %rcx, %rbp
movq 352(%rsp), %rcx
xorq %r13, %r8
addq %r11, %rcx
xorq %rbp, %rbx
addq %rdi, %rcx
movq 448(%rsp), %rdi
xorq %rcx, %rax
rolq $48, %r8
xorq %rcx, %rdi
addq %r8, %rdx
rolq $48, %rbx
xorq %rdx, %r9
rolq $48, %rdi
addq %rbx, %rsi
movq 456(%rsp), %r10
xorq %rsi, %r15
addq %rdi, %r10
xorq %rbp, %rdx
rolq $1, %r9
xorq %r10, %r11
xorq %rbx, %r9
xorq %r10, %r12
movq 472(%rsp), %rbx
xorq %rsi, %r13
rolq $1, %r11
rolq $1, %r15
xorq %r14, %r11
rolq $1, %rbx
xorq %r8, %r15
xorq %rdi, %rbx
xorq %rax, 200(%rsp)
xorq %rdx, 216(%rsp)
xorq %r12, 208(%rsp)
xorq %r13, 224(%rsp)
xorq %r9, 256(%rsp)
xorq %r11, 248(%rsp)
xorq %r15, 240(%rsp)
xorq %rbx, 232(%rsp)
cmpq $128, 176(%rsp)
ja blake2b_blocks_x86_L25
blake2b_blocks_x86_L26:
movq 168(%rsp), %rbx
movq 192(%rsp), %rcx
movq 232(%rsp), %rax
movq 240(%rsp), %rbp
movq 256(%rsp), %r12
movq 224(%rsp), %r8
movq 208(%rsp), %r9
movq 216(%rsp), %r10
movq 200(%rsp), %r11
movq 128(%rsp), %rdi
movq 248(%rsp), %rdx
movq %r11, (%rdi)
movq %r10, 8(%rdi)
movq %r9, 16(%rdi)
movq %r8, 24(%rdi)
movq %r12, 32(%rdi)
movq %rdx, 40(%rdi)
movq %rbp, 48(%rdi)
movq %rax, 56(%rdi)
movq %rcx, 64(%rdi)
movq %rbx, 72(%rdi)
addq $504, %rsp
popq %rbp
popq %rbx
popq %r15
popq %r14
popq %r13
popq %r12
ret

.data
.section .rodata, "a"

.align 16
blake2b_constants:
.long	0xf3bcc908,0x6a09e667
.long	0x84caa73b,0xbb67ae85
.long	0xfe94f82b,0x3c6ef372
.long	0x5f1d36f1,0xa54ff53a
.long	0xade682d1,0x510e527f
.long	0x2b3e6c1f,0x9b05688c
.long	0xfb41bd6b,0x1f83d9ab
.long	0x137e2179,0x5be0cd19


.align 16
ssse3_rotr16_64:
.byte	2
.byte	3
.byte	4
.byte	5
.byte	6
.byte	7
.byte	0
.byte	1
.byte	10
.byte	11
.byte	12
.byte	13
.byte	14
.byte	15
.byte	8
.byte	9


.align 16
ssse3_rotr24_64:
.byte	3
.byte	4
.byte	5
.byte	6
.byte	7
.byte	0
.byte	1
.byte	2
.byte	11
.byte	12
.byte	13
.byte	14
.byte	15
.byte	8
.byte	9
.byte	10


blake2b_sigma:
.byte	0
.byte	8
.byte	16
.byte	24
.byte	32
.byte	40
.byte	48
.byte	56
.byte	64
.byte	72
.byte	80
.byte	88
.byte	96
.byte	104
.byte	112
.byte	120
.byte	112
.byte	80
.byte	32
.byte	64
.byte	72
.byte	120
.byte	104
.byte	48
.byte	8
.byte	96
.byte	0
.byte	16
.byte	88
.byte	56
.byte	40
.byte	24
.byte	88
.byte	64
.byte	96
.byte	0
.byte	40
.byte	16
.byte	120
.byte	104
.byte	80
.byte	112
.byte	24
.byte	48
.byte	56
.byte	8
.byte	72
.byte	32
.byte	56
.byte	72
.byte	24
.byte	8
.byte	104
.byte	96
.byte	88
.byte	112
.byte	16
.byte	48
.byte	40
.byte	80
.byte	32
.byte	0
.byte	120
.byte	64
.byte	72
.byte	0
.byte	40
.byte	56
.byte	16
.byte	32
.byte	80
.byte	120
.byte	112
.byte	8
.byte	88
.byte	96
.byte	48
.byte	64
.byte	24
.byte	104
.byte	16
.byte	96
.byte	48
.byte	80
.byte	0
.byte	88
.byte	64
.byte	24
.byte	32
.byte	104
.byte	56
.byte	40
.byte	120
.byte	112
.byte	8
.byte	72
.byte	96
.byte	40
.byte	8
.byte	120
.byte	112
.byte	104
.byte	32
.byte	80
.byte	0
.byte	56
.byte	48
.byte	24
.byte	72
.byte	16
.byte	64
.byte	88
.byte	104
.byte	88
.byte	56
.byte	112
.byte	96
.byte	8
.byte	24
.byte	72
.byte	40
.byte	0
.byte	120
.byte	32
.byte	64
.byte	48
.byte	16
.byte	80
.byte	48
.byte	120
.byte	112
.byte	72
.byte	88
.byte	24
.byte	0
.byte	64
.byte	96
.byte	16
.byte	104
.byte	56
.byte	8
.byte	32
.byte	80
.byte	40
.byte	80
.byte	16
.byte	64
.byte	32
.byte	56
.byte	48
.byte	8
.byte	40
.byte	120
.byte	88
.byte	72
.byte	112
.byte	24
.byte	96
.byte	104
.byte	0
.byte	0
.byte	8
.byte	16
.byte	24
.byte	32
.byte	40
.byte	48
.byte	56
.byte	64
.byte	72
.byte	80
.byte	88
.byte	96
.byte	104
.byte	112
.byte	120
.byte	112
.byte	80
.byte	32
.byte	64
.byte	72
.byte	120
.byte	104
.byte	48
.byte	8
.byte	96
.byte	0
.byte	16
.byte	88
.byte	56
.byte	40
.byte	24

