.text

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


