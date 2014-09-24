SECTION_TEXT

GLOBAL_HIDDEN_FN blake2b_blocks_xop
pushq %rbp
pushq %rbx
pushq %r12
movl $128, %r10d
movq %rsp, %rbp
andq $-64, %rsp
subq $128, %rsp
cmpq $128, %rdx
cmovbe %rdx, %r10
cmpq $0, 80(%rdi)
vmovups 80(%rdi), %xmm15
movq 64(%rdi), %r8
movq 72(%rdi), %r9
LOAD_VAR_PIC blake2b_constants, %rbx
vxorps 48(%rbx), %xmm15, %xmm15
je .Lblake2b_blocks_xop_2
cmpq $128, %rdx
je .Lblake2b_blocks_xop_2
testb $64, %dl
je .Lblake2b_blocks_xop_3
vmovups (%rsi), %xmm0
leaq 0(%rsp), %rax
addq $64, %rsi
addq $64, %rax
vmovaps %xmm0, 0(%rsp)
vmovups -48(%rsi), %xmm0
vmovaps %xmm0, 16(%rsp)
vmovups -32(%rsi), %xmm0
vmovaps %xmm0, 32(%rsp)
vmovups -16(%rsi), %xmm0
vmovaps %xmm0, 48(%rsp)
jmp .Lblake2b_blocks_xop_4
.Lblake2b_blocks_xop_3:
vxorps %xmm0, %xmm0, %xmm0
leaq 0(%rsp), %rax
vmovaps %xmm0, 64(%rsp)
vmovaps %xmm0, 80(%rsp)
vmovaps %xmm0, 96(%rsp)
vmovaps %xmm0, 112(%rsp)
.Lblake2b_blocks_xop_4:
vxorps %xmm0, %xmm0, %xmm0
testb $32, %dl
vmovaps %xmm0, (%rax)
vmovaps %xmm0, 16(%rax)
vmovaps %xmm0, 32(%rax)
vmovaps %xmm0, 48(%rax)
je .Lblake2b_blocks_xop_5
vmovups (%rsi), %xmm0
addq $32, %rax
addq $32, %rsi
vmovaps %xmm0, -32(%rax)
vmovups -16(%rsi), %xmm0
vmovaps %xmm0, -16(%rax)
.Lblake2b_blocks_xop_5:
testb $16, %dl
je .Lblake2b_blocks_xop_6
vmovups (%rsi), %xmm0
addq $16, %rax
addq $16, %rsi
vmovaps %xmm0, -16(%rax)
.Lblake2b_blocks_xop_6:
testb $8, %dl
je .Lblake2b_blocks_xop_7
movq (%rsi), %r11
addq $8, %rax
addq $8, %rsi
movq %r11, -8(%rax)
.Lblake2b_blocks_xop_7:
testb $4, %dl
je .Lblake2b_blocks_xop_8
movl (%rsi), %r11d
addq $4, %rax
addq $4, %rsi
movl %r11d, -4(%rax)
.Lblake2b_blocks_xop_8:
testb $2, %dl
je .Lblake2b_blocks_xop_9
movw (%rsi), %r11w
addq $2, %rax
addq $2, %rsi
movw %r11w, -2(%rax)
.Lblake2b_blocks_xop_9:
testb $1, %dl
je .Lblake2b_blocks_xop_15
movb (%rsi), %sil
movb %sil, (%rax)
.Lblake2b_blocks_xop_15:
leaq 0(%rsp), %rsi
.Lblake2b_blocks_xop_2:
vmovups (%rdi), %xmm3
vmovups 16(%rdi), %xmm2
vmovups 32(%rdi), %xmm1
vmovups 48(%rdi), %xmm0
vxorps %xmm11, %xmm11, %xmm11
.Lblake2b_blocks_xop_14:
LOAD_VAR_PIC blake2b_constants, %rbx
addq %r10, %r8
vmovaps 16(%rbx), %xmm6
adcq $0, %r9
vpinsrq $0, %r8, %xmm11, %xmm10
vpinsrq $0, %r9, %xmm11, %xmm4
vmovaps 0(%rbx), %xmm8
vmovaps %xmm15, %xmm12
vmovaps %xmm1, %xmm5
vpunpcklqdq %xmm4, %xmm10, %xmm10
vmovaps %xmm2, %xmm7
vmovaps %xmm0, %xmm4
vmovaps %xmm3, %xmm9
vxorps 32(%rbx), %xmm10, %xmm10
leaq 64(%rbx), %rax
leaq 256(%rbx), %r12
.Lblake2b_blocks_xop_12:
movzbl (%rax), %ebx
movzbl 2(%rax), %r11d
addq $32, %rax
vmovq (%rsi,%rbx), %xmm13
movzbl -28(%rax), %ebx
vpinsrq $1, (%rsi,%r11), %xmm13, %xmm13
movzbl -26(%rax), %r11d
vmovq (%rsi,%rbx), %xmm14
movzbl -31(%rax), %ebx
vpaddq %xmm13, %xmm9, %xmm9
vpinsrq $1, (%rsi,%r11), %xmm14, %xmm13
movzbl -29(%rax), %r11d
vpaddq %xmm5, %xmm9, %xmm9
vxorps %xmm9, %xmm10, %xmm10
vpaddq %xmm13, %xmm7, %xmm7
vmovq (%rsi,%rbx), %xmm13
vprotq $32, %xmm10, %xmm10
movzbl -27(%rax), %ebx
vpaddq %xmm10, %xmm8, %xmm8
vpaddq %xmm4, %xmm7, %xmm7
vxorps %xmm8, %xmm5, %xmm5
vpinsrq $1, (%rsi,%r11), %xmm13, %xmm13
movzbl -25(%rax), %r11d
vxorps %xmm7, %xmm12, %xmm12
vprotq $40, %xmm5, %xmm5
vmovq (%rsi,%rbx), %xmm14
movzbl -24(%rax), %ebx
vprotq $32, %xmm12, %xmm12
vpaddq %xmm12, %xmm6, %xmm6
vxorps %xmm6, %xmm4, %xmm4
vpaddq %xmm13, %xmm9, %xmm9
vpinsrq $1, (%rsi,%r11), %xmm14, %xmm13
vprotq $40, %xmm4, %xmm4
movzbl -22(%rax), %r11d
vmovq (%rsi,%rbx), %xmm14
vpaddq %xmm5, %xmm9, %xmm9
movzbl -20(%rax), %ebx
vxorps %xmm9, %xmm10, %xmm10
vpaddq %xmm13, %xmm7, %xmm7
vprotq $48, %xmm10, %xmm10
vpaddq %xmm10, %xmm8, %xmm8
vpaddq %xmm4, %xmm7, %xmm7
vxorps %xmm8, %xmm5, %xmm5
vxorps %xmm7, %xmm12, %xmm12
vprotq $1, %xmm5, %xmm5
vprotq $48, %xmm12, %xmm12
vpaddq %xmm12, %xmm6, %xmm6
vxorps %xmm6, %xmm4, %xmm4
vprotq $1, %xmm4, %xmm4
vpalignr $8, %xmm5, %xmm4, %xmm13
vpalignr $8, %xmm4, %xmm5, %xmm5
vpalignr $8, %xmm10, %xmm12, %xmm4
vpalignr $8, %xmm12, %xmm10, %xmm12
vpinsrq $1, (%rsi,%r11), %xmm14, %xmm10
movzbl -18(%rax), %r11d
vmovq (%rsi,%rbx), %xmm14
movzbl -23(%rax), %ebx
vpaddq %xmm10, %xmm9, %xmm9
vpinsrq $1, (%rsi,%r11), %xmm14, %xmm10
movzbl -21(%rax), %r11d
vmovq (%rsi,%rbx), %xmm14
movzbl -19(%rax), %ebx
vpaddq %xmm13, %xmm9, %xmm9
vxorps %xmm9, %xmm12, %xmm12
vpaddq %xmm10, %xmm7, %xmm7
vpinsrq $1, (%rsi,%r11), %xmm14, %xmm10
vprotq $32, %xmm12, %xmm12
movzbl -17(%rax), %r11d
vmovq (%rsi,%rbx), %xmm14
vpaddq %xmm5, %xmm7, %xmm7
vpaddq %xmm12, %xmm6, %xmm6
movzbl -16(%rax), %ebx
vxorps %xmm7, %xmm4, %xmm4
vxorps %xmm6, %xmm13, %xmm13
vpinsrq $1, (%rsi,%r11), %xmm14, %xmm14
vprotq $32, %xmm4, %xmm4
vpaddq %xmm4, %xmm8, %xmm8
vpaddq %xmm10, %xmm9, %xmm9
vprotq $40, %xmm13, %xmm13
movzbl -14(%rax), %r11d
vxorps %xmm8, %xmm5, %xmm5
vpaddq %xmm13, %xmm9, %xmm9
vprotq $40, %xmm5, %xmm5
vpaddq %xmm14, %xmm7, %xmm7
vpaddq %xmm5, %xmm7, %xmm14
vxorps %xmm9, %xmm12, %xmm7
vxorps %xmm14, %xmm4, %xmm4
vprotq $48, %xmm7, %xmm7
vpaddq %xmm7, %xmm6, %xmm6
vprotq $48, %xmm4, %xmm4
vpaddq %xmm4, %xmm8, %xmm8
vxorps %xmm6, %xmm13, %xmm10
vxorps %xmm8, %xmm5, %xmm5
vprotq $1, %xmm10, %xmm10
vprotq $1, %xmm5, %xmm5
vpalignr $8, %xmm5, %xmm10, %xmm12
vpalignr $8, %xmm10, %xmm5, %xmm10
vpalignr $8, %xmm4, %xmm7, %xmm5
vpalignr $8, %xmm7, %xmm4, %xmm4
vmovq (%rsi,%rbx), %xmm7
movzbl -12(%rax), %ebx
vpinsrq $1, (%rsi,%r11), %xmm7, %xmm7
movzbl -10(%rax), %r11d
vpaddq %xmm7, %xmm9, %xmm9
vmovq (%rsi,%rbx), %xmm7
movzbl -15(%rax), %ebx
vpaddq %xmm12, %xmm9, %xmm9
vpinsrq $1, (%rsi,%r11), %xmm7, %xmm7
movzbl -13(%rax), %r11d
vxorps %xmm9, %xmm4, %xmm4
vprotq $32, %xmm4, %xmm4
vpaddq %xmm4, %xmm8, %xmm8
vxorps %xmm8, %xmm12, %xmm12
vpaddq %xmm7, %xmm14, %xmm14
vmovq (%rsi,%rbx), %xmm7
movzbl -11(%rax), %ebx
vprotq $40, %xmm12, %xmm12
vpaddq %xmm10, %xmm14, %xmm14
vpinsrq $1, (%rsi,%r11), %xmm7, %xmm7
movzbl -9(%rax), %r11d
vxorps %xmm14, %xmm5, %xmm5
vprotq $32, %xmm5, %xmm5
vpaddq %xmm5, %xmm6, %xmm6
vxorps %xmm6, %xmm10, %xmm10
vpaddq %xmm7, %xmm9, %xmm9
vmovq (%rsi,%rbx), %xmm7
movzbl -8(%rax), %ebx
vprotq $40, %xmm10, %xmm10
vpaddq %xmm12, %xmm9, %xmm9
vpinsrq $1, (%rsi,%r11), %xmm7, %xmm7
movzbl -6(%rax), %r11d
vxorps %xmm9, %xmm4, %xmm4
vprotq $48, %xmm4, %xmm4
vpaddq %xmm4, %xmm8, %xmm8
vxorps %xmm8, %xmm12, %xmm12
vpaddq %xmm7, %xmm14, %xmm14
vmovq (%rsi,%rbx), %xmm7
movzbl -4(%rax), %ebx
vprotq $1, %xmm12, %xmm12
vpaddq %xmm10, %xmm14, %xmm14
vxorps %xmm14, %xmm5, %xmm5
vprotq $48, %xmm5, %xmm5
vpaddq %xmm5, %xmm6, %xmm6
vxorps %xmm6, %xmm10, %xmm10
vprotq $1, %xmm10, %xmm10
vpalignr $8, %xmm12, %xmm10, %xmm13
vpalignr $8, %xmm10, %xmm12, %xmm12
vpalignr $8, %xmm4, %xmm5, %xmm10
vpalignr $8, %xmm5, %xmm4, %xmm5
vpinsrq $1, (%rsi,%r11), %xmm7, %xmm4
movzbl -2(%rax), %r11d
vmovq (%rsi,%rbx), %xmm7
movzbl -7(%rax), %ebx
vpinsrq $1, (%rsi,%r11), %xmm7, %xmm7
movzbl -5(%rax), %r11d
vpaddq %xmm4, %xmm9, %xmm9
vmovq (%rsi,%rbx), %xmm4
movzbl -3(%rax), %ebx
vpaddq %xmm13, %xmm9, %xmm9
vpinsrq $1, (%rsi,%r11), %xmm4, %xmm4
movzbl -1(%rax), %r11d
vpaddq %xmm7, %xmm14, %xmm14
vxorps %xmm9, %xmm5, %xmm5
vmovq (%rsi,%rbx), %xmm7
cmpq %r12, %rax
vpaddq %xmm12, %xmm14, %xmm14
vprotq $32, %xmm5, %xmm5
vpaddq %xmm5, %xmm6, %xmm6
vxorps %xmm14, %xmm10, %xmm10
vpinsrq $1, (%rsi,%r11), %xmm7, %xmm7
vpaddq %xmm4, %xmm9, %xmm9
vprotq $32, %xmm10, %xmm10
vpaddq %xmm10, %xmm8, %xmm8
vxorps %xmm6, %xmm13, %xmm13
vxorps %xmm8, %xmm12, %xmm12
vprotq $40, %xmm13, %xmm13
vpaddq %xmm13, %xmm9, %xmm9
vprotq $40, %xmm12, %xmm12
vxorps %xmm9, %xmm5, %xmm5
vpaddq %xmm7, %xmm14, %xmm14
vpaddq %xmm12, %xmm14, %xmm7
vprotq $48, %xmm5, %xmm14
vpaddq %xmm14, %xmm6, %xmm6
vxorps %xmm7, %xmm10, %xmm10
vxorps %xmm6, %xmm13, %xmm13
vprotq $48, %xmm10, %xmm10
vpaddq %xmm10, %xmm8, %xmm8
vprotq $1, %xmm13, %xmm4
vxorps %xmm8, %xmm12, %xmm12
vprotq $1, %xmm12, %xmm12
vpalignr $8, %xmm12, %xmm4, %xmm5
vpalignr $8, %xmm4, %xmm12, %xmm4
vpalignr $8, %xmm10, %xmm14, %xmm12
vpalignr $8, %xmm14, %xmm10, %xmm10
jb .Lblake2b_blocks_xop_12
vxorps %xmm8, %xmm9, %xmm8
cmpq $128, %rdx
vxorps %xmm6, %xmm7, %xmm6
vxorps %xmm10, %xmm5, %xmm10
vxorps %xmm12, %xmm4, %xmm12
vxorps %xmm3, %xmm8, %xmm3
vxorps %xmm2, %xmm6, %xmm2
vxorps %xmm1, %xmm10, %xmm1
vxorps %xmm0, %xmm12, %xmm0
jbe .Lblake2b_blocks_xop_13
addq %rcx, %rsi
addq $-128, %rdx
jmp .Lblake2b_blocks_xop_14
.Lblake2b_blocks_xop_13:
movq %r8, 64(%rdi)
movq %r9, 72(%rdi)
vmovups %xmm3, (%rdi)
vmovups %xmm2, 16(%rdi)
vmovups %xmm1, 32(%rdi)
vmovups %xmm0, 48(%rdi)
movq %rbp, %rsp
popq %r12
popq %rbx
popq %rbp
ret
FN_END blake2b_blocks_xop

INCLUDE_VAR_FILE "blake2b/blake2b_constants.inc", blake2b_constants

