.text


.align 16,0x90
.globl blake2b_blocks_avx
.globl _blake2b_blocks_avx
blake2b_blocks_avx:
_blake2b_blocks_avx:
pushl %ebp
movl %esp, %ebp
andl $-64, %esp
pushl %esi
pushl %edi
pushl %ebx
subl $1268, %esp
movl 8(%ebp), %ebx
call blake2b_blocks_avx_LL2
blake2b_blocks_avx_LL2:
popl %ecx
leal _GLOBAL_OFFSET_TABLE_+1(%ecx), %ecx
movl 80(%ebx), %edi
vmovdqu 80(%ebx), %xmm1
vmovdqu ssse3_rotr24_64@GOTOFF(%ecx), %xmm0
lea 160+blake2b_sigma@GOTOFF(%ecx), %eax
movl 12(%ebp), %edx
movl 16(%ebp), %esi
vmovdqu ssse3_rotr16_64@GOTOFF(%ecx), %xmm4
vmovdqu %xmm0, 1120(%esp)
vpxor 48+blake2b_constants@GOTOFF(%ecx), %xmm1, %xmm3
movl %eax, 1040(%esp)
orl 84(%ebx), %edi
jne blake2b_blocks_avx_L2
blake2b_blocks_avx_L31:
cmpl $128, %esi
jmp blake2b_blocks_avx_L21
blake2b_blocks_avx_L2:
cmpl $128, %esi
je blake2b_blocks_avx_L21
blake2b_blocks_avx_L3:
lea (%esp), %eax
testl $64, %esi
je blake2b_blocks_avx_L5
blake2b_blocks_avx_L4:
vmovdqu (%edx), %xmm0
vmovdqu %xmm0, (%esp)
lea 64(%esp), %eax
vmovdqu 16(%edx), %xmm1
vmovdqu %xmm1, 16(%esp)
vpxor %xmm0, %xmm0, %xmm0
vmovdqu 32(%edx), %xmm2
vmovdqu %xmm2, 32(%esp)
vmovdqu 48(%edx), %xmm5
vmovdqu %xmm5, 48(%esp)
addl $64, %edx
jmp blake2b_blocks_avx_L6
blake2b_blocks_avx_L5:
vpxor %xmm0, %xmm0, %xmm0
vmovdqu %xmm0, 64(%esp)
vmovdqu %xmm0, 80(%esp)
vmovdqu %xmm0, 96(%esp)
vmovdqu %xmm0, 112(%esp)
blake2b_blocks_avx_L6:
vmovdqu %xmm0, (%eax)
vmovdqu %xmm0, 16(%eax)
vmovdqu %xmm0, 32(%eax)
vmovdqu %xmm0, 48(%eax)
testl $32, %esi
je blake2b_blocks_avx_L8
blake2b_blocks_avx_L7:
vmovdqu (%edx), %xmm0
vmovdqu %xmm0, (%eax)
vmovdqu 16(%edx), %xmm1
vmovdqu %xmm1, 16(%eax)
addl $32, %edx
addl $32, %eax
blake2b_blocks_avx_L8:
testl $16, %esi
je blake2b_blocks_avx_L10
blake2b_blocks_avx_L9:
vmovdqu (%edx), %xmm0
vmovdqu %xmm0, (%eax)
addl $16, %edx
addl $16, %eax
blake2b_blocks_avx_L10:
testl $8, %esi
je blake2b_blocks_avx_L12
blake2b_blocks_avx_L11:
movl (%edx), %ebx
movl 4(%edx), %edi
addl $8, %edx
movl %ebx, (%eax)
movl %edi, 4(%eax)
addl $8, %eax
blake2b_blocks_avx_L12:
testl $4, %esi
je blake2b_blocks_avx_L14
blake2b_blocks_avx_L13:
movl (%edx), %ebx
addl $4, %edx
movl %ebx, (%eax)
addl $4, %eax
blake2b_blocks_avx_L14:
testl $2, %esi
je blake2b_blocks_avx_L16
blake2b_blocks_avx_L15:
movzwl (%edx), %ebx
addl $2, %edx
movw %bx, (%eax)
addl $2, %eax
blake2b_blocks_avx_L16:
testl $1, %esi
je blake2b_blocks_avx_L18
blake2b_blocks_avx_L17:
movzbl (%edx), %edx
movb %dl, (%eax)
blake2b_blocks_avx_L18:
cmpl $128, %esi
lea (%esp), %edx
blake2b_blocks_avx_L21:
movl 8(%ebp), %eax
movl $128, %ebx
vmovdqu 32+blake2b_constants@GOTOFF(%ecx), %xmm7
cmovbe %esi, %ebx
vmovdqu blake2b_constants@GOTOFF(%ecx), %xmm6
vmovdqu (%eax), %xmm0
vmovdqu %xmm0, 192(%esp)
vmovdqu 16(%eax), %xmm0
vmovdqu 32(%eax), %xmm1
vmovdqu 48(%eax), %xmm2
vmovdqu 16+blake2b_constants@GOTOFF(%ecx), %xmm5
lea 64+blake2b_sigma@GOTOFF(%ecx), %ecx
movl 64(%eax), %edi
movl 68(%eax), %eax
vmovdqu %xmm5, 240(%esp)
vmovdqu %xmm6, 128(%esp)
vmovdqu %xmm7, 144(%esp)
vmovdqu %xmm2, 208(%esp)
vmovdqu %xmm1, 224(%esp)
vmovdqu %xmm0, 176(%esp)
vmovdqu %xmm3, 160(%esp)
vmovdqu %xmm4, 1056(%esp)
movl %ecx, 1032(%esp)
movl %ebx, 1036(%esp)
jmp blake2b_blocks_avx_L22
# align to 5 mod 64
.align 64
nop;nop;nop;nop;nop;
blake2b_blocks_avx_L27:
addl 20(%ebp), %edx
addl $-128, %esi
blake2b_blocks_avx_L22:
movl 8(%ebp), %ebx
movl 1036(%esp), %ecx
addl %ecx, %edi
adcl $0, %eax
movl %edi, 64(%ebx)
movl %eax, 68(%ebx)
movl %edi, %ebx
subl %ecx, %ebx
movl $0, %ecx
movl %eax, %ebx
sbbl %ecx, %ebx
jae blake2b_blocks_avx_L24
blake2b_blocks_avx_L23:
movl 8(%ebp), %ecx
addl $1, 72(%ecx)
adcl $0, 76(%ecx)
blake2b_blocks_avx_L24:
movl 8(%ebp), %ecx
vmovdqu 144(%esp), %xmm3
vmovdqu 16(%edx), %xmm6
vmovdqu 32(%edx), %xmm1
vpxor 64(%ecx), %xmm3, %xmm4
vmovdqu (%edx), %xmm3
vpunpcklqdq %xmm6, %xmm3, %xmm5
vmovhpd 48(%edx), %xmm1, %xmm0
vpaddq 192(%esp), %xmm5, %xmm7
vpaddq 176(%esp), %xmm0, %xmm5
vmovdqu 224(%esp), %xmm2
vmovdqu 208(%esp), %xmm0
vpaddq %xmm2, %xmm7, %xmm7
vpaddq %xmm0, %xmm5, %xmm5
vmovdqu %xmm5, 256(%esp)
vpxor %xmm7, %xmm4, %xmm4
vpxor 160(%esp), %xmm5, %xmm5
vpshufd $177, %xmm4, %xmm4
vpshufd $177, %xmm5, %xmm5
vmovdqu %xmm4, 272(%esp)
vmovdqu %xmm5, 288(%esp)
vpaddq 128(%esp), %xmm4, %xmm4
vpaddq 240(%esp), %xmm5, %xmm5
vmovdqu %xmm4, 304(%esp)
vpxor %xmm4, %xmm2, %xmm4
vmovdqu 1120(%esp), %xmm2
vpxor %xmm5, %xmm0, %xmm0
vpshufb %xmm2, %xmm4, %xmm4
vpshufb %xmm2, %xmm0, %xmm2
vpunpckhqdq %xmm6, %xmm3, %xmm6
vpunpckhqdq 48(%edx), %xmm1, %xmm1
vpaddq %xmm6, %xmm7, %xmm3
vpaddq 256(%esp), %xmm1, %xmm0
vpaddq %xmm4, %xmm3, %xmm6
vpaddq %xmm2, %xmm0, %xmm3
vpxor 272(%esp), %xmm6, %xmm7
vmovdqu 1056(%esp), %xmm0
vpxor 288(%esp), %xmm3, %xmm1
vpshufb %xmm0, %xmm7, %xmm7
vpshufb %xmm0, %xmm1, %xmm0
vpaddq 304(%esp), %xmm7, %xmm1
vpaddq %xmm0, %xmm5, %xmm5
vmovdqu %xmm0, 320(%esp)
vpxor %xmm1, %xmm4, %xmm4
vpxor %xmm5, %xmm2, %xmm0
vpsrlq $63, %xmm4, %xmm2
vmovdqu %xmm1, 336(%esp)
vmovdqu %xmm5, 352(%esp)
vpsrlq $63, %xmm0, %xmm5
vpaddq %xmm4, %xmm4, %xmm1
vpaddq %xmm0, %xmm0, %xmm0
vpor %xmm1, %xmm2, %xmm1
vpor %xmm0, %xmm5, %xmm2
vpalignr $8, %xmm1, %xmm2, %xmm4
vpalignr $8, %xmm2, %xmm1, %xmm0
vmovdqu 96(%edx), %xmm1
vmovhpd 112(%edx), %xmm1, %xmm5
vmovdqu 64(%edx), %xmm1
vpaddq %xmm5, %xmm3, %xmm3
vmovhpd 80(%edx), %xmm1, %xmm2
vpaddq %xmm2, %xmm6, %xmm6
vpaddq %xmm0, %xmm3, %xmm3
vpaddq %xmm4, %xmm6, %xmm6
vmovdqu 320(%esp), %xmm2
vmovdqu %xmm5, 368(%esp)
vpalignr $8, %xmm2, %xmm7, %xmm5
vpalignr $8, %xmm7, %xmm2, %xmm7
vpxor %xmm6, %xmm5, %xmm5
vpxor %xmm3, %xmm7, %xmm7
vpshufd $177, %xmm5, %xmm5
vpshufd $177, %xmm7, %xmm2
vmovdqu %xmm5, 384(%esp)
vpaddq 352(%esp), %xmm5, %xmm7
vpaddq 336(%esp), %xmm2, %xmm5
vmovdqu %xmm7, 400(%esp)
vpxor %xmm7, %xmm4, %xmm4
vmovdqu 1120(%esp), %xmm7
vpxor %xmm5, %xmm0, %xmm0
vpunpckhqdq 80(%edx), %xmm1, %xmm1
vpshufb %xmm7, %xmm4, %xmm4
vpaddq %xmm1, %xmm6, %xmm6
vmovdqu 112(%edx), %xmm1
vpaddq %xmm4, %xmm6, %xmm6
vpshufb %xmm7, %xmm0, %xmm0
vmovdqu 96(%edx), %xmm7
vpunpckhqdq %xmm1, %xmm7, %xmm7
vpaddq %xmm7, %xmm3, %xmm3
vmovdqu %xmm6, 416(%esp)
vpaddq %xmm0, %xmm3, %xmm3
vpxor 384(%esp), %xmm6, %xmm6
vpxor %xmm3, %xmm2, %xmm2
vmovdqu 1056(%esp), %xmm7
vpshufb %xmm7, %xmm6, %xmm6
vpshufb %xmm7, %xmm2, %xmm2
vpaddq 400(%esp), %xmm6, %xmm7
vpaddq %xmm2, %xmm5, %xmm5
vmovdqu %xmm7, 432(%esp)
vpxor %xmm7, %xmm4, %xmm7
vpsrlq $63, %xmm7, %xmm4
vpxor %xmm5, %xmm0, %xmm0
vpaddq %xmm7, %xmm7, %xmm7
vpor %xmm7, %xmm4, %xmm7
vpsrlq $63, %xmm0, %xmm4
vpaddq %xmm0, %xmm0, %xmm0
vmovhpd 32(%edx), %xmm1, %xmm1
vpor %xmm0, %xmm4, %xmm4
vpaddq 416(%esp), %xmm1, %xmm1
vpalignr $8, %xmm4, %xmm7, %xmm0
vmovdqu %xmm0, 448(%esp)
vpaddq %xmm0, %xmm1, %xmm0
vmovdqu 64(%edx), %xmm1
vpalignr $8, %xmm7, %xmm4, %xmm4
vpunpckhqdq 96(%edx), %xmm1, %xmm7
vpaddq %xmm7, %xmm3, %xmm3
vpaddq %xmm4, %xmm3, %xmm3
vpalignr $8, %xmm6, %xmm2, %xmm7
vpalignr $8, %xmm2, %xmm6, %xmm6
vpxor %xmm0, %xmm7, %xmm7
vpxor %xmm3, %xmm6, %xmm2
vpshufd $177, %xmm7, %xmm7
vpshufd $177, %xmm2, %xmm6
vpaddq %xmm7, %xmm5, %xmm5
vpaddq 432(%esp), %xmm6, %xmm2
vmovdqu %xmm6, 464(%esp)
vpxor %xmm2, %xmm4, %xmm4
vmovdqu %xmm5, 480(%esp)
vpxor 448(%esp), %xmm5, %xmm6
vmovdqu 1120(%esp), %xmm5
vpshufb %xmm5, %xmm6, %xmm6
vpshufb %xmm5, %xmm4, %xmm5
vmovdqu 80(%edx), %xmm4
vpunpcklqdq %xmm1, %xmm4, %xmm1
vpaddq %xmm1, %xmm0, %xmm0
vpaddq %xmm6, %xmm0, %xmm4
vmovdqu 48(%edx), %xmm0
vpalignr $8, 112(%edx), %xmm0, %xmm1
vpaddq %xmm1, %xmm3, %xmm3
vpaddq %xmm5, %xmm3, %xmm1
vmovdqu 1056(%esp), %xmm0
vpxor %xmm4, %xmm7, %xmm3
vpshufb %xmm0, %xmm3, %xmm7
vpxor 464(%esp), %xmm1, %xmm3
vpshufb %xmm0, %xmm3, %xmm3
vpaddq 480(%esp), %xmm7, %xmm0
vpaddq %xmm3, %xmm2, %xmm2
vmovdqu %xmm0, 496(%esp)
vpxor %xmm0, %xmm6, %xmm0
vpxor %xmm2, %xmm5, %xmm6
vpsrlq $63, %xmm0, %xmm5
vpaddq %xmm0, %xmm0, %xmm0
vpor %xmm0, %xmm5, %xmm0
vpsrlq $63, %xmm6, %xmm5
vpaddq %xmm6, %xmm6, %xmm6
vpor %xmm6, %xmm5, %xmm5
vpalignr $8, %xmm0, %xmm5, %xmm6
vpalignr $8, %xmm5, %xmm0, %xmm0
vpshufd $78, (%edx), %xmm5
vpaddq %xmm5, %xmm4, %xmm4
vmovdqu 80(%edx), %xmm5
vmovdqu %xmm6, 512(%esp)
vpaddq %xmm6, %xmm4, %xmm6
vpunpckhqdq 32(%edx), %xmm5, %xmm4
vpaddq %xmm4, %xmm1, %xmm1
vpaddq %xmm0, %xmm1, %xmm5
vpalignr $8, %xmm3, %xmm7, %xmm1
vpalignr $8, %xmm7, %xmm3, %xmm7
vpxor %xmm6, %xmm1, %xmm4
vpxor %xmm5, %xmm7, %xmm1
vpshufd $177, %xmm4, %xmm4
vpshufd $177, %xmm1, %xmm3
vpaddq %xmm4, %xmm2, %xmm2
vpaddq 496(%esp), %xmm3, %xmm7
vmovdqu %xmm3, 528(%esp)
vpxor %xmm7, %xmm0, %xmm0
vmovdqu %xmm2, 544(%esp)
vmovdqu %xmm7, 560(%esp)
vpxor 512(%esp), %xmm2, %xmm3
vmovdqu 16(%edx), %xmm2
vmovdqu 48(%edx), %xmm7
vmovdqu 1120(%esp), %xmm1
vpshufb %xmm1, %xmm3, %xmm3
vpshufb %xmm1, %xmm0, %xmm0
vpunpckhqdq %xmm2, %xmm7, %xmm1
vmovdqu 96(%edx), %xmm7
vpunpcklqdq %xmm2, %xmm7, %xmm2
vpaddq %xmm2, %xmm6, %xmm6
vmovdqu %xmm1, 576(%esp)
vpaddq %xmm1, %xmm5, %xmm1
vpaddq %xmm3, %xmm6, %xmm6
vpaddq %xmm0, %xmm1, %xmm5
vmovdqu 1056(%esp), %xmm1
vpxor %xmm6, %xmm4, %xmm4
vpshufb %xmm1, %xmm4, %xmm2
vpxor 528(%esp), %xmm5, %xmm4
vpshufb %xmm1, %xmm4, %xmm4
vmovdqu %xmm2, 592(%esp)
vpaddq 544(%esp), %xmm2, %xmm2
vpaddq 560(%esp), %xmm4, %xmm1
vpxor %xmm2, %xmm3, %xmm3
vmovdqu %xmm2, 608(%esp)
vpxor %xmm1, %xmm0, %xmm2
vpsrlq $63, %xmm3, %xmm0
vpaddq %xmm3, %xmm3, %xmm3
vpor %xmm3, %xmm0, %xmm0
vpsrlq $63, %xmm2, %xmm3
vpaddq %xmm2, %xmm2, %xmm2
vpalignr $8, 80(%edx), %xmm7, %xmm7
vpor %xmm2, %xmm3, %xmm3
vpaddq %xmm7, %xmm6, %xmm6
vpalignr $8, %xmm3, %xmm0, %xmm2
vpalignr $8, %xmm0, %xmm3, %xmm0
vpaddq %xmm2, %xmm6, %xmm3
vmovdqu 32(%edx), %xmm6
vpunpckhqdq 112(%edx), %xmm6, %xmm7
vpaddq %xmm7, %xmm5, %xmm5
vpaddq %xmm0, %xmm5, %xmm7
vmovdqu 592(%esp), %xmm5
vpalignr $8, %xmm5, %xmm4, %xmm6
vpalignr $8, %xmm4, %xmm5, %xmm5
vpxor %xmm3, %xmm6, %xmm6
vpxor %xmm7, %xmm5, %xmm4
vpshufd $177, %xmm6, %xmm6
vpshufd $177, %xmm4, %xmm5
vpaddq 608(%esp), %xmm5, %xmm4
vpaddq %xmm6, %xmm1, %xmm1
vmovdqu %xmm1, 624(%esp)
vpxor %xmm1, %xmm2, %xmm1
vmovdqu 1120(%esp), %xmm2
vpxor %xmm4, %xmm0, %xmm0
vpshufb %xmm2, %xmm1, %xmm1
vpshufb %xmm2, %xmm0, %xmm2
vmovdqu 64(%edx), %xmm0
vmovdqu %xmm4, 640(%esp)
vmovhpd (%edx), %xmm0, %xmm4
vpaddq %xmm4, %xmm3, %xmm3
vmovdqu 16(%edx), %xmm4
vpaddq %xmm1, %xmm3, %xmm3
vpblendw $240, 96(%edx), %xmm4, %xmm0
vpxor %xmm3, %xmm6, %xmm6
vpaddq %xmm0, %xmm7, %xmm7
vpaddq %xmm2, %xmm7, %xmm0
vmovdqu 1056(%esp), %xmm7
vpxor %xmm0, %xmm5, %xmm5
vpshufb %xmm7, %xmm6, %xmm6
vpshufb %xmm7, %xmm5, %xmm5
vpaddq 624(%esp), %xmm6, %xmm7
vmovdqu %xmm6, 656(%esp)
vpxor %xmm7, %xmm1, %xmm1
vpaddq 640(%esp), %xmm5, %xmm6
vmovdqu %xmm7, 672(%esp)
vpxor %xmm6, %xmm2, %xmm7
vpsrlq $63, %xmm1, %xmm2
vpaddq %xmm1, %xmm1, %xmm1
vpor %xmm1, %xmm2, %xmm1
vpsrlq $63, %xmm7, %xmm2
vpaddq %xmm7, %xmm7, %xmm7
vpor %xmm7, %xmm2, %xmm7
vpalignr $8, %xmm1, %xmm7, %xmm2
vpalignr $8, %xmm7, %xmm1, %xmm1
vmovdqu 80(%edx), %xmm7
vpblendw $240, %xmm4, %xmm7, %xmm4
vpaddq %xmm4, %xmm3, %xmm3
vpaddq %xmm2, %xmm3, %xmm4
vmovdqu 48(%edx), %xmm3
vpunpckhqdq 64(%edx), %xmm3, %xmm7
vpaddq %xmm7, %xmm0, %xmm0
vmovdqu 656(%esp), %xmm7
vpaddq %xmm1, %xmm0, %xmm0
vpalignr $8, %xmm5, %xmm7, %xmm3
vpalignr $8, %xmm7, %xmm5, %xmm5
vpxor %xmm4, %xmm3, %xmm3
vpxor %xmm0, %xmm5, %xmm5
vpshufd $177, %xmm3, %xmm3
vpshufd $177, %xmm5, %xmm7
vpaddq 672(%esp), %xmm7, %xmm5
vpaddq %xmm3, %xmm6, %xmm6
vmovdqu %xmm6, 688(%esp)
vpxor %xmm6, %xmm2, %xmm2
vmovdqu 1120(%esp), %xmm6
vpxor %xmm5, %xmm1, %xmm1
vpshufb %xmm6, %xmm2, %xmm2
vpshufb %xmm6, %xmm1, %xmm1
vmovdqu 112(%edx), %xmm6
vmovdqu %xmm5, 704(%esp)
vmovhpd 48(%edx), %xmm6, %xmm5
vmovdqu 32(%edx), %xmm6
vpaddq %xmm5, %xmm4, %xmm4
vpalignr $8, (%edx), %xmm6, %xmm5
vpaddq %xmm5, %xmm0, %xmm0
vpaddq %xmm2, %xmm4, %xmm4
vpaddq %xmm1, %xmm0, %xmm0
vmovdqu 1056(%esp), %xmm6
vpxor %xmm4, %xmm3, %xmm3
vpshufb %xmm6, %xmm3, %xmm3
vpxor %xmm0, %xmm7, %xmm7
vpshufb %xmm6, %xmm7, %xmm6
vpaddq 688(%esp), %xmm3, %xmm7
vpaddq 704(%esp), %xmm6, %xmm5
vpxor %xmm7, %xmm2, %xmm2
vmovdqu %xmm7, 720(%esp)
vpxor %xmm5, %xmm1, %xmm7
vpsrlq $63, %xmm2, %xmm1
vpaddq %xmm2, %xmm2, %xmm2
vpor %xmm2, %xmm1, %xmm1
vpsrlq $63, %xmm7, %xmm2
vpaddq %xmm7, %xmm7, %xmm7
vpor %xmm7, %xmm2, %xmm7
vpalignr $8, %xmm7, %xmm1, %xmm2
vpalignr $8, %xmm1, %xmm7, %xmm7
vpaddq 576(%esp), %xmm4, %xmm1
vmovdqu 96(%edx), %xmm4
vpaddq %xmm2, %xmm1, %xmm1
vmovdqu %xmm2, 736(%esp)
vpunpckhqdq 80(%edx), %xmm4, %xmm2
vpaddq %xmm2, %xmm0, %xmm0
vpaddq %xmm7, %xmm0, %xmm0
vpalignr $8, %xmm3, %xmm6, %xmm4
vpalignr $8, %xmm6, %xmm3, %xmm6
vpxor %xmm1, %xmm4, %xmm2
vpxor %xmm0, %xmm6, %xmm3
vpshufd $177, %xmm2, %xmm4
vpshufd $177, %xmm3, %xmm3
vpaddq %xmm4, %xmm5, %xmm5
vpaddq 720(%esp), %xmm3, %xmm2
vpaddq 368(%esp), %xmm0, %xmm0
vmovdqu %xmm5, 752(%esp)
vpxor %xmm2, %xmm7, %xmm7
vpxor 736(%esp), %xmm5, %xmm5
vmovdqu 1120(%esp), %xmm6
vpshufb %xmm6, %xmm5, %xmm5
vpshufb %xmm6, %xmm7, %xmm7
vmovdqu 64(%edx), %xmm6
vmovdqu %xmm2, 768(%esp)
vpunpckhqdq (%edx), %xmm6, %xmm2
vpaddq %xmm2, %xmm1, %xmm1
vpaddq %xmm7, %xmm0, %xmm2
vpaddq %xmm5, %xmm1, %xmm1
vpxor %xmm1, %xmm4, %xmm0
vpxor %xmm2, %xmm3, %xmm3
vmovdqu 1056(%esp), %xmm4
vpshufb %xmm4, %xmm0, %xmm6
vpshufb %xmm4, %xmm3, %xmm4
vpaddq 752(%esp), %xmm6, %xmm0
vpaddq 768(%esp), %xmm4, %xmm3
vmovdqu %xmm0, 784(%esp)
vpxor %xmm0, %xmm5, %xmm0
vpxor %xmm3, %xmm7, %xmm7
vpsrlq $63, %xmm0, %xmm5
vmovdqu %xmm3, 800(%esp)
vpaddq %xmm0, %xmm0, %xmm3
vpsrlq $63, %xmm7, %xmm0
vpor %xmm3, %xmm5, %xmm3
vpaddq %xmm7, %xmm7, %xmm7
vpor %xmm7, %xmm0, %xmm5
vpalignr $8, %xmm3, %xmm5, %xmm7
vpalignr $8, %xmm5, %xmm3, %xmm3
vmovdqu 16(%edx), %xmm5
vmovdqu 32(%edx), %xmm0
vpblendw $240, %xmm0, %xmm5, %xmm5
vpaddq %xmm5, %xmm1, %xmm1
vpblendw $240, 112(%edx), %xmm0, %xmm0
vpaddq %xmm0, %xmm2, %xmm2
vpaddq %xmm7, %xmm1, %xmm5
vpaddq %xmm3, %xmm2, %xmm2
vpalignr $8, %xmm4, %xmm6, %xmm1
vpalignr $8, %xmm6, %xmm4, %xmm4
vpxor %xmm5, %xmm1, %xmm0
vpshufd $177, %xmm0, %xmm1
vpxor %xmm2, %xmm4, %xmm0
vpshufd $177, %xmm0, %xmm6
vpaddq 800(%esp), %xmm1, %xmm4
vpaddq 784(%esp), %xmm6, %xmm0
vmovdqu %xmm4, 816(%esp)
vpxor %xmm4, %xmm7, %xmm7
vmovdqu 1120(%esp), %xmm4
vpxor %xmm0, %xmm3, %xmm3
vpshufb %xmm4, %xmm7, %xmm7
vpshufb %xmm4, %xmm3, %xmm3
vmovdqu 48(%edx), %xmm4
vmovhpd 80(%edx), %xmm4, %xmm4
vpaddq %xmm4, %xmm5, %xmm5
vmovdqu (%edx), %xmm4
vpaddq %xmm7, %xmm5, %xmm5
vmovhpd 64(%edx), %xmm4, %xmm4
vpxor %xmm5, %xmm1, %xmm1
vpaddq %xmm4, %xmm2, %xmm2
vpaddq %xmm3, %xmm2, %xmm2
vmovdqu 1056(%esp), %xmm4
vpxor %xmm2, %xmm6, %xmm6
vpshufb %xmm4, %xmm1, %xmm1
vpshufb %xmm4, %xmm6, %xmm6
vmovdqu %xmm5, 1088(%esp)
vpaddq 816(%esp), %xmm1, %xmm5
vpaddq %xmm6, %xmm0, %xmm0
vmovdqu %xmm2, 1104(%esp)
vpxor %xmm5, %xmm7, %xmm2
vpxor %xmm0, %xmm3, %xmm3
vpsrlq $63, %xmm2, %xmm4
vpaddq %xmm2, %xmm2, %xmm7
vpsrlq $63, %xmm3, %xmm2
vpaddq %xmm3, %xmm3, %xmm3
vmovdqu %xmm5, 1072(%esp)
vpor %xmm7, %xmm4, %xmm5
vpor %xmm3, %xmm2, %xmm4
vpalignr $8, %xmm4, %xmm5, %xmm3
vpalignr $8, %xmm5, %xmm4, %xmm4
vpalignr $8, %xmm1, %xmm6, %xmm2
vpalignr $8, %xmm6, %xmm1, %xmm1
movl 1032(%esp), %ebx
movl 1040(%esp), %ecx
movl %edi, 1028(%esp)
movl %esi, 1024(%esp)
blake2b_blocks_avx_L25:
movzbl (%ebx), %esi
movzbl 2(%ebx), %edi
vmovq (%esi,%edx), %xmm5
movzbl 4(%ebx), %esi
vmovhpd (%edi,%edx), %xmm5, %xmm7
vpaddq 1088(%esp), %xmm7, %xmm5
vmovq (%esi,%edx), %xmm6
movzbl 6(%ebx), %esi
vpaddq %xmm3, %xmm5, %xmm5
vmovhpd (%esi,%edx), %xmm6, %xmm6
vpxor %xmm5, %xmm2, %xmm2
vpaddq 1104(%esp), %xmm6, %xmm7
vpaddq %xmm4, %xmm7, %xmm6
vpxor %xmm6, %xmm1, %xmm1
vpshufd $177, %xmm2, %xmm2
vpshufd $177, %xmm1, %xmm1
vpaddq %xmm2, %xmm0, %xmm7
vpaddq 1072(%esp), %xmm1, %xmm0
movzbl 1(%ebx), %edi
vpxor %xmm7, %xmm3, %xmm3
vmovdqu %xmm7, 1136(%esp)
vpxor %xmm0, %xmm4, %xmm4
vmovdqu 1120(%esp), %xmm7
vmovdqu %xmm0, 1152(%esp)
vpshufb %xmm7, %xmm4, %xmm0
vpshufb %xmm7, %xmm3, %xmm3
vmovq (%edi,%edx), %xmm4
movzbl 5(%ebx), %edi
movzbl 3(%ebx), %esi
vmovq (%edi,%edx), %xmm7
movzbl 7(%ebx), %edi
vmovhpd (%esi,%edx), %xmm4, %xmm4
vpaddq %xmm4, %xmm5, %xmm5
vmovhpd (%edi,%edx), %xmm7, %xmm7
vpaddq %xmm7, %xmm6, %xmm6
vpaddq %xmm3, %xmm5, %xmm5
vpaddq %xmm0, %xmm6, %xmm7
vpxor %xmm5, %xmm2, %xmm4
vpxor %xmm7, %xmm1, %xmm1
vmovdqu 1056(%esp), %xmm2
vpshufb %xmm2, %xmm4, %xmm4
vpshufb %xmm2, %xmm1, %xmm1
vpaddq 1136(%esp), %xmm4, %xmm2
vpaddq 1152(%esp), %xmm1, %xmm6
vmovdqu %xmm2, 1168(%esp)
vpxor %xmm2, %xmm3, %xmm2
vmovdqu %xmm6, 1184(%esp)
vpxor %xmm6, %xmm0, %xmm6
vpsrlq $63, %xmm2, %xmm0
vpaddq %xmm2, %xmm2, %xmm2
movzbl 8(%ebx), %esi
vpor %xmm2, %xmm0, %xmm3
vpsrlq $63, %xmm6, %xmm0
vpaddq %xmm6, %xmm6, %xmm6
vpor %xmm6, %xmm0, %xmm2
vmovq (%esi,%edx), %xmm6
movzbl 12(%ebx), %esi
vpalignr $8, %xmm3, %xmm2, %xmm0
vpalignr $8, %xmm2, %xmm3, %xmm3
vmovq (%esi,%edx), %xmm2
movzbl 10(%ebx), %edi
movzbl 14(%ebx), %esi
vmovhpd (%edi,%edx), %xmm6, %xmm6
vmovhpd (%esi,%edx), %xmm2, %xmm2
vpaddq %xmm6, %xmm5, %xmm5
vpaddq %xmm2, %xmm7, %xmm7
vpaddq %xmm0, %xmm5, %xmm6
vpaddq %xmm3, %xmm7, %xmm2
vpalignr $8, %xmm1, %xmm4, %xmm5
vpalignr $8, %xmm4, %xmm1, %xmm4
vpxor %xmm6, %xmm5, %xmm7
vpxor %xmm2, %xmm4, %xmm1
vpshufd $177, %xmm7, %xmm7
vpshufd $177, %xmm1, %xmm4
vpaddq 1184(%esp), %xmm7, %xmm1
vpaddq 1168(%esp), %xmm4, %xmm5
movzbl 9(%ebx), %edi
vpxor %xmm5, %xmm3, %xmm3
vmovdqu %xmm1, 1200(%esp)
vpxor %xmm1, %xmm0, %xmm1
vmovdqu 1120(%esp), %xmm0
vpshufb %xmm0, %xmm1, %xmm1
vpshufb %xmm0, %xmm3, %xmm3
vmovq (%edi,%edx), %xmm0
movzbl 11(%ebx), %esi
movzbl 13(%ebx), %edi
vmovdqu %xmm5, 1216(%esp)
vmovhpd (%esi,%edx), %xmm0, %xmm0
vmovq (%edi,%edx), %xmm5
movzbl 15(%ebx), %edi
addl $16, %ebx
vpaddq %xmm0, %xmm6, %xmm6
vpaddq %xmm1, %xmm6, %xmm0
vmovhpd (%edi,%edx), %xmm5, %xmm6
vpxor %xmm0, %xmm7, %xmm7
vpaddq %xmm6, %xmm2, %xmm2
vmovdqu %xmm0, 1088(%esp)
vpaddq %xmm3, %xmm2, %xmm2
vmovdqu 1056(%esp), %xmm0
vpxor %xmm2, %xmm4, %xmm4
vpshufb %xmm0, %xmm7, %xmm7
vmovdqu %xmm2, 1104(%esp)
vpshufb %xmm0, %xmm4, %xmm2
vpaddq 1200(%esp), %xmm7, %xmm5
vpaddq 1216(%esp), %xmm2, %xmm0
vpxor %xmm5, %xmm1, %xmm4
vpxor %xmm0, %xmm3, %xmm6
vpaddq %xmm4, %xmm4, %xmm1
vpsrlq $63, %xmm4, %xmm3
vpor %xmm1, %xmm3, %xmm4
vpsrlq $63, %xmm6, %xmm3
vpaddq %xmm6, %xmm6, %xmm1
vmovdqu %xmm5, 1072(%esp)
vpor %xmm1, %xmm3, %xmm5
vpalignr $8, %xmm5, %xmm4, %xmm3
vpalignr $8, %xmm4, %xmm5, %xmm4
vpalignr $8, %xmm2, %xmm7, %xmm1
vpalignr $8, %xmm7, %xmm2, %xmm2
cmpl %ecx, %ebx
jb blake2b_blocks_avx_L25
blake2b_blocks_avx_L26:
vmovq (%edx), %xmm6
vmovhpd 16(%edx), %xmm6, %xmm7
vmovq 32(%edx), %xmm5
vpaddq 1088(%esp), %xmm7, %xmm6
vmovhpd 48(%edx), %xmm5, %xmm5
vpaddq %xmm3, %xmm6, %xmm7
vpaddq 1104(%esp), %xmm5, %xmm6
vpaddq %xmm4, %xmm6, %xmm6
vpxor %xmm7, %xmm2, %xmm2
vpxor %xmm6, %xmm1, %xmm1
vpshufd $177, %xmm2, %xmm5
vpshufd $177, %xmm1, %xmm2
vpaddq 1072(%esp), %xmm2, %xmm1
vpaddq %xmm5, %xmm0, %xmm0
vmovdqu %xmm0, 832(%esp)
vpxor %xmm0, %xmm3, %xmm3
vmovdqu 1120(%esp), %xmm0
vpxor %xmm1, %xmm4, %xmm4
vpshufb %xmm0, %xmm3, %xmm3
vpshufb %xmm0, %xmm4, %xmm0
vmovq 8(%edx), %xmm4
vmovhpd 24(%edx), %xmm4, %xmm4
vpaddq %xmm4, %xmm7, %xmm7
vmovdqu %xmm3, 848(%esp)
vpaddq %xmm3, %xmm7, %xmm7
vmovq 40(%edx), %xmm3
vpxor %xmm7, %xmm5, %xmm5
vmovhpd 56(%edx), %xmm3, %xmm4
vpaddq %xmm4, %xmm6, %xmm6
vpaddq %xmm0, %xmm6, %xmm3
vmovdqu 1056(%esp), %xmm6
vpxor %xmm3, %xmm2, %xmm2
vpshufb %xmm6, %xmm5, %xmm4
vpshufb %xmm6, %xmm2, %xmm5
vpaddq 832(%esp), %xmm4, %xmm2
vpaddq %xmm5, %xmm1, %xmm1
vmovdqu %xmm2, 864(%esp)
vmovdqu %xmm1, 880(%esp)
vpxor %xmm1, %xmm0, %xmm1
vpxor 848(%esp), %xmm2, %xmm2
vpsrlq $63, %xmm1, %xmm6
vpaddq %xmm1, %xmm1, %xmm1
vpsrlq $63, %xmm2, %xmm0
vpaddq %xmm2, %xmm2, %xmm2
vpor %xmm2, %xmm0, %xmm2
vpor %xmm1, %xmm6, %xmm0
vpalignr $8, %xmm2, %xmm0, %xmm6
vpalignr $8, %xmm0, %xmm2, %xmm0
vmovq 64(%edx), %xmm2
vmovhpd 80(%edx), %xmm2, %xmm1
vpaddq %xmm1, %xmm7, %xmm7
vmovq 96(%edx), %xmm2
vpaddq %xmm6, %xmm7, %xmm1
vmovhpd 112(%edx), %xmm2, %xmm7
vpaddq %xmm7, %xmm3, %xmm3
vpaddq %xmm0, %xmm3, %xmm2
vpalignr $8, %xmm5, %xmm4, %xmm7
vpalignr $8, %xmm4, %xmm5, %xmm4
vpxor %xmm1, %xmm7, %xmm3
vpxor %xmm2, %xmm4, %xmm5
vpshufd $177, %xmm3, %xmm3
vpshufd $177, %xmm5, %xmm4
vpaddq 880(%esp), %xmm3, %xmm7
vpaddq 864(%esp), %xmm4, %xmm5
vmovdqu %xmm7, 896(%esp)
vpxor %xmm7, %xmm6, %xmm6
vmovdqu 1120(%esp), %xmm7
vpxor %xmm5, %xmm0, %xmm0
vmovdqu %xmm5, 912(%esp)
vmovq 72(%edx), %xmm5
vpshufb %xmm7, %xmm6, %xmm6
vpshufb %xmm7, %xmm0, %xmm7
vmovhpd 88(%edx), %xmm5, %xmm0
vpaddq %xmm0, %xmm1, %xmm1
vpaddq %xmm6, %xmm1, %xmm0
vmovq 104(%edx), %xmm1
vmovhpd 120(%edx), %xmm1, %xmm5
vpaddq %xmm5, %xmm2, %xmm2
vpaddq %xmm7, %xmm2, %xmm2
vpxor %xmm0, %xmm3, %xmm5
vpxor %xmm2, %xmm4, %xmm4
vmovdqu 1056(%esp), %xmm3
vpshufb %xmm3, %xmm5, %xmm5
vpshufb %xmm3, %xmm4, %xmm4
vmovdqu %xmm5, 928(%esp)
vpaddq 896(%esp), %xmm5, %xmm5
vpaddq 912(%esp), %xmm4, %xmm3
vpxor %xmm5, %xmm6, %xmm6
vpxor %xmm3, %xmm7, %xmm7
vmovdqu %xmm5, 944(%esp)
vpsrlq $63, %xmm6, %xmm5
vpaddq %xmm6, %xmm6, %xmm6
vpor %xmm6, %xmm5, %xmm5
vpsrlq $63, %xmm7, %xmm6
vpaddq %xmm7, %xmm7, %xmm7
vpor %xmm7, %xmm6, %xmm7
vpalignr $8, %xmm7, %xmm5, %xmm6
vpalignr $8, %xmm5, %xmm7, %xmm5
vmovq 112(%edx), %xmm7
vmovhpd 32(%edx), %xmm7, %xmm7
vpaddq %xmm7, %xmm0, %xmm0
vpaddq %xmm6, %xmm0, %xmm7
vmovq 72(%edx), %xmm0
vpunpcklqdq %xmm1, %xmm0, %xmm1
vpaddq %xmm1, %xmm2, %xmm2
vmovdqu 928(%esp), %xmm0
vpaddq %xmm5, %xmm2, %xmm2
vpalignr $8, %xmm0, %xmm4, %xmm1
vpalignr $8, %xmm4, %xmm0, %xmm4
vpxor %xmm7, %xmm1, %xmm1
vpxor %xmm2, %xmm4, %xmm4
vpshufd $177, %xmm1, %xmm1
vpshufd $177, %xmm4, %xmm4
vpaddq 944(%esp), %xmm4, %xmm0
vpaddq %xmm1, %xmm3, %xmm3
vmovdqu %xmm3, 960(%esp)
vpxor %xmm3, %xmm6, %xmm3
vmovdqu 1120(%esp), %xmm6
vpxor %xmm0, %xmm5, %xmm5
vpshufb %xmm6, %xmm3, %xmm3
vpshufb %xmm6, %xmm5, %xmm6
vmovq 80(%edx), %xmm5
vmovhpd 64(%edx), %xmm5, %xmm5
vpaddq %xmm5, %xmm7, %xmm7
vpaddq %xmm3, %xmm7, %xmm5
vmovq 120(%edx), %xmm7
vpxor %xmm5, %xmm1, %xmm1
vmovhpd 48(%edx), %xmm7, %xmm7
vpaddq %xmm7, %xmm2, %xmm2
vpaddq %xmm6, %xmm2, %xmm2
vmovdqu 1056(%esp), %xmm7
vpxor %xmm2, %xmm4, %xmm4
vpshufb %xmm7, %xmm1, %xmm1
vpshufb %xmm7, %xmm4, %xmm7
vpaddq 960(%esp), %xmm1, %xmm4
vpaddq %xmm7, %xmm0, %xmm0
vmovdqu %xmm4, 976(%esp)
vpxor %xmm4, %xmm3, %xmm4
vpxor %xmm0, %xmm6, %xmm3
vpsrlq $63, %xmm4, %xmm6
vpaddq %xmm4, %xmm4, %xmm4
vpor %xmm4, %xmm6, %xmm4
vpsrlq $63, %xmm3, %xmm6
vpaddq %xmm3, %xmm3, %xmm3
vpor %xmm3, %xmm6, %xmm3
vpalignr $8, %xmm4, %xmm3, %xmm6
vpalignr $8, %xmm3, %xmm4, %xmm3
vmovq 8(%edx), %xmm4
vmovhpd (%edx), %xmm4, %xmm4
vpaddq %xmm4, %xmm5, %xmm5
vmovq 88(%edx), %xmm4
vmovhpd 40(%edx), %xmm4, %xmm4
vpaddq %xmm4, %xmm2, %xmm2
vpaddq %xmm6, %xmm5, %xmm5
vpaddq %xmm3, %xmm2, %xmm4
vpalignr $8, %xmm7, %xmm1, %xmm2
vpalignr $8, %xmm1, %xmm7, %xmm1
vpxor %xmm5, %xmm2, %xmm2
vpxor %xmm4, %xmm1, %xmm7
vpshufd $177, %xmm2, %xmm2
vpshufd $177, %xmm7, %xmm1
vpaddq %xmm2, %xmm0, %xmm0
vpaddq 976(%esp), %xmm1, %xmm7
vmovdqu %xmm0, 992(%esp)
vpxor %xmm0, %xmm6, %xmm0
vmovdqu 1120(%esp), %xmm6
vpxor %xmm7, %xmm3, %xmm3
vpshufb %xmm6, %xmm0, %xmm0
vpshufb %xmm6, %xmm3, %xmm3
vmovq 96(%edx), %xmm6
vmovhpd 16(%edx), %xmm6, %xmm6
vpaddq %xmm6, %xmm5, %xmm5
vmovq 56(%edx), %xmm6
vmovhpd 24(%edx), %xmm6, %xmm6
vpaddq %xmm0, %xmm5, %xmm5
vpaddq %xmm6, %xmm4, %xmm4
vpaddq %xmm3, %xmm4, %xmm4
vmovdqu 1056(%esp), %xmm6
vpxor %xmm5, %xmm2, %xmm2
vpshufb %xmm6, %xmm2, %xmm2
vpxor %xmm4, %xmm1, %xmm1
vpshufb %xmm6, %xmm1, %xmm6
vpaddq 992(%esp), %xmm2, %xmm1
vpaddq %xmm6, %xmm7, %xmm7
vpxor %xmm1, %xmm0, %xmm0
vpxor %xmm7, %xmm3, %xmm3
vmovdqu %xmm6, 1008(%esp)
vpsrlq $63, %xmm0, %xmm6
vpaddq %xmm0, %xmm0, %xmm0
vpor %xmm0, %xmm6, %xmm0
vpsrlq $63, %xmm3, %xmm6
vpaddq %xmm3, %xmm3, %xmm3
vpxor %xmm1, %xmm4, %xmm4
vpor %xmm3, %xmm6, %xmm6
vpxor 176(%esp), %xmm4, %xmm1
vpxor %xmm7, %xmm5, %xmm5
vmovdqu 1008(%esp), %xmm4
vpxor 192(%esp), %xmm5, %xmm7
vpalignr $8, %xmm6, %xmm0, %xmm3
vpalignr $8, %xmm2, %xmm4, %xmm5
vpalignr $8, %xmm0, %xmm6, %xmm0
vpalignr $8, %xmm4, %xmm2, %xmm2
vmovdqu %xmm7, 192(%esp)
vpxor %xmm5, %xmm3, %xmm7
vpxor %xmm2, %xmm0, %xmm6
vmovdqu %xmm1, 176(%esp)
vpxor 224(%esp), %xmm7, %xmm1
vpxor 208(%esp), %xmm6, %xmm0
movl 1024(%esp), %esi
movl 1028(%esp), %edi
vmovdqu %xmm1, 224(%esp)
vmovdqu %xmm0, 208(%esp)
cmpl $128, %esi
ja blake2b_blocks_avx_L27
blake2b_blocks_avx_L28:
movl 8(%ebp), %eax
vmovdqu 208(%esp), %xmm2
vmovdqu 224(%esp), %xmm1
vmovdqu 176(%esp), %xmm0
vmovdqu 192(%esp), %xmm3
vmovdqu %xmm3, (%eax)
vmovdqu %xmm0, 16(%eax)
vmovdqu %xmm1, 32(%eax)
vmovdqu %xmm2, 48(%eax)
addl $1268, %esp
popl %ebx
popl %edi
popl %esi
movl %ebp, %esp
popl %ebp
ret

.align 16,0x90
.globl blake2b_blocks_xop
.globl _blake2b_blocks_xop
blake2b_blocks_xop:
_blake2b_blocks_xop:
pushl %ebp
movl $128, %eax
movl %esp, %ebp
pushl %edi
pushl %esi
pushl %ebx
andl $-64, %esp
subl $832, %esp
movl 8(%ebp), %edx
movl 16(%ebp), %ecx
call blake2b_blocks_xop_GOT
blake2b_blocks_xop_GOT:
popl %ebx
leal _GLOBAL_OFFSET_TABLE_+1(%ebx), %ebx
movl 84(%edx), %esi
vmovdqa 80(%edx), %xmm0
cmpl $128, %ecx
cmovbe %ecx, %eax
orl 80(%edx), %esi
vpxor 48+blake2b_constants@GOTOFF(%ebx), %xmm0, %xmm0
movl %eax, 672(%esp)
vmovdqa %xmm0, 16(%esp)
je blake2b_blocks_xop_L2
cmpl $128, %ecx
je blake2b_blocks_xop_L2
testb $64, %cl
jne blake2b_blocks_xop_L17
leal 704(%esp), %esi
vpxor %xmm0, %xmm0, %xmm0
vmovdqa %xmm0, 768(%esp)
movl %esi, 688(%esp)
movl %esi, %edi
vmovdqa %xmm0, 784(%esp)
movl %esi, 656(%esp)
vmovdqa %xmm0, 800(%esp)
vmovdqa %xmm0, 816(%esp)
blake2b_blocks_xop_L4:
testb $32, %cl
vpxor %xmm0, %xmm0, %xmm0
vmovdqa %xmm0, (%edi)
vmovdqa %xmm0, 16(%edi)
vmovdqa %xmm0, 32(%edi)
vmovdqa %xmm0, 48(%edi)
jne blake2b_blocks_xop_L18
blake2b_blocks_xop_L5:
testb $16, %cl
jne blake2b_blocks_xop_L19
blake2b_blocks_xop_L6:
testb $8, %cl
je blake2b_blocks_xop_L7
movl 12(%ebp), %edi
movl 656(%esp), %eax
addl $8, 12(%ebp)
movl (%edi), %esi
movl 4(%edi), %edi
movl %esi, (%eax)
movl %edi, 4(%eax)
addl $8, %eax
movl %eax, 656(%esp)
blake2b_blocks_xop_L7:
testb $4, %cl
je blake2b_blocks_xop_L8
movl 12(%ebp), %esi
movl 656(%esp), %eax
movl (%esi), %edi
addl $4, %esi
movl %esi, 12(%ebp)
movl %edi, (%eax)
addl $4, %eax
movl %eax, 656(%esp)
blake2b_blocks_xop_L8:
testb $2, %cl
je blake2b_blocks_xop_L9
movl 12(%ebp), %esi
movl 656(%esp), %eax
movzwl (%esi), %edi
addl $2, %esi
movl %esi, 12(%ebp)
movw %di, (%eax)
addl $2, %eax
movl %eax, 656(%esp)
blake2b_blocks_xop_L9:
testb $1, %cl
je blake2b_blocks_xop_L14
movl 12(%ebp), %esi
movl 656(%esp), %edi
movzbl (%esi), %eax
movb %al, (%edi)
movl 688(%esp), %eax
movl %eax, 12(%ebp)
.align 16,0x90
blake2b_blocks_xop_L2:
vmovdqa (%edx), %xmm0
vmovdqa 16(%edx), %xmm1
vmovdqa 32(%edx), %xmm2
vmovdqa 48(%edx), %xmm3
vmovd 672(%esp), %xmm4
vmovdqa %xmm0, 272(%esp)
vmovdqa %xmm1, 256(%esp)
vmovdqa %xmm2, 352(%esp)
vmovdqa %xmm3, 336(%esp)
vmovq %xmm4, 40(%esp)
movl 12(%ebp), %eax
jmp blake2b_blocks_xop_L13
.align 16,0x90
blake2b_blocks_xop_L20:
addl 20(%ebp), %eax
addl $-128, %ecx
blake2b_blocks_xop_L13:
movl 40(%esp), %esi
vmovdqu (%eax), %xmm3
vmovdqa %xmm3, 688(%esp)
movl 44(%esp), %edi
vmovdqu 16(%eax), %xmm3
vmovdqa %xmm3, 480(%esp)
addl 64(%edx), %esi
vmovdqu 32(%eax), %xmm7
vmovdqa %xmm7, 464(%esp)
adcl 68(%edx), %edi
vmovdqu 48(%eax), %xmm5
vmovdqa %xmm5, 528(%esp)
cmpl 44(%esp), %edi
vmovdqu 64(%eax), %xmm7
vmovdqa %xmm7, 672(%esp)
vmovdqu 80(%eax), %xmm0
vmovdqa %xmm0, 640(%esp)
vmovdqu 96(%eax), %xmm3
vmovdqa %xmm3, 576(%esp)
vmovdqu 112(%eax), %xmm6
movl %esi, 64(%edx)
vmovdqa %xmm6, 560(%esp)
movl %edi, 68(%edx)
ja blake2b_blocks_xop_L10
jb blake2b_blocks_xop_L15
cmpl 40(%esp), %esi
jae blake2b_blocks_xop_L10
blake2b_blocks_xop_L15:
addl $1, 72(%edx)
adcl $0, 76(%edx)
blake2b_blocks_xop_L10:
vmovdqa 32+blake2b_constants@GOTOFF(%ebx), %xmm5
vmovdqa 256(%esp), %xmm1
vpxor 64(%edx), %xmm5, %xmm4
vmovdqa 464(%esp), %xmm7
vpunpcklqdq 528(%esp), %xmm7, %xmm7
vpaddq %xmm7, %xmm1, %xmm5
vpaddq 336(%esp), %xmm5, %xmm5
vmovdqa 272(%esp), %xmm0
vmovdqa 688(%esp), %xmm6
vpunpcklqdq 480(%esp), %xmm6, %xmm6
vmovdqa %xmm6, 224(%esp)
vpaddq %xmm6, %xmm0, %xmm6
vpaddq 352(%esp), %xmm6, %xmm6
vmovdqa %xmm7, 208(%esp)
cmpl $128, %ecx
vpxor 16(%esp), %xmm5, %xmm3
vprotq $32, %xmm3, %xmm3
vpaddq 16+blake2b_constants@GOTOFF(%ebx), %xmm3, %xmm2
vpxor %xmm6, %xmm4, %xmm4
vprotq $32, %xmm4, %xmm4
vpaddq blake2b_constants@GOTOFF(%ebx), %xmm4, %xmm7
vmovdqa %xmm2, 656(%esp)
vpxor 336(%esp), %xmm2, %xmm0
vmovdqa 688(%esp), %xmm2
vprotq $40, %xmm0, %xmm0
vpunpckhqdq 480(%esp), %xmm2, %xmm2
vmovdqa %xmm2, 192(%esp)
vmovdqa 464(%esp), %xmm2
vpaddq 192(%esp), %xmm6, %xmm6
vpunpckhqdq 528(%esp), %xmm2, %xmm2
vpaddq %xmm2, %xmm5, %xmm5
vpxor 352(%esp), %xmm7, %xmm1
vprotq $40, %xmm1, %xmm1
vpaddq %xmm0, %xmm5, %xmm5
vmovdqa %xmm2, 176(%esp)
vpxor %xmm5, %xmm3, %xmm3
vprotq $48, %xmm3, %xmm3
vpaddq %xmm1, %xmm6, %xmm6
vpaddq 656(%esp), %xmm3, %xmm2
vpxor %xmm6, %xmm4, %xmm4
vprotq $48, %xmm4, %xmm4
vpaddq %xmm4, %xmm7, %xmm7
vpxor %xmm7, %xmm1, %xmm1
vprotq $1, %xmm1, %xmm1
vmovdqa %xmm7, 624(%esp)
vpxor %xmm2, %xmm0, %xmm0
vprotq $1, %xmm0, %xmm0
vpalignr $8, %xmm1, %xmm0, %xmm7
vpalignr $8, %xmm0, %xmm1, %xmm0
vpalignr $8, %xmm4, %xmm3, %xmm1
vpalignr $8, %xmm3, %xmm4, %xmm4
vmovdqa 672(%esp), %xmm3
vpunpcklqdq 640(%esp), %xmm3, %xmm3
vpaddq %xmm3, %xmm6, %xmm6
vmovdqa %xmm7, 608(%esp)
vmovdqa %xmm3, 160(%esp)
vmovdqa 576(%esp), %xmm7
vpunpcklqdq 560(%esp), %xmm7, %xmm7
vmovdqa %xmm7, 320(%esp)
vpaddq 608(%esp), %xmm6, %xmm6
vpaddq %xmm7, %xmm5, %xmm5
vpaddq %xmm0, %xmm5, %xmm5
vpxor %xmm5, %xmm1, %xmm1
vprotq $32, %xmm1, %xmm1
vpxor %xmm6, %xmm4, %xmm3
vprotq $32, %xmm3, %xmm3
vpaddq %xmm3, %xmm2, %xmm2
vmovdqa %xmm2, 656(%esp)
vpxor 608(%esp), %xmm2, %xmm4
vmovdqa 672(%esp), %xmm2
vpunpckhqdq 640(%esp), %xmm2, %xmm2
vmovdqa %xmm2, 144(%esp)
vpaddq 144(%esp), %xmm6, %xmm6
vpaddq 624(%esp), %xmm1, %xmm7
vprotq $40, %xmm4, %xmm4
vmovdqa 576(%esp), %xmm2
vpunpckhqdq 560(%esp), %xmm2, %xmm2
vpaddq %xmm2, %xmm5, %xmm5
vmovdqa %xmm2, 128(%esp)
vpaddq %xmm4, %xmm6, %xmm6
vpxor %xmm7, %xmm0, %xmm0
vpxor %xmm6, %xmm3, %xmm3
vprotq $40, %xmm0, %xmm0
vprotq $48, %xmm3, %xmm3
vpaddq %xmm0, %xmm5, %xmm5
vpaddq 656(%esp), %xmm3, %xmm2
vpxor %xmm5, %xmm1, %xmm1
vprotq $48, %xmm1, %xmm1
vpaddq %xmm1, %xmm7, %xmm7
vpxor %xmm7, %xmm0, %xmm0
vmovdqa %xmm2, 608(%esp)
vpxor %xmm2, %xmm4, %xmm4
vprotq $1, %xmm0, %xmm2
vprotq $1, %xmm4, %xmm4
vpalignr $8, %xmm2, %xmm4, %xmm0
vpalignr $8, %xmm4, %xmm2, %xmm4
vpalignr $8, %xmm1, %xmm3, %xmm2
vpalignr $8, %xmm3, %xmm1, %xmm1
vmovdqa 560(%esp), %xmm3
vpunpcklqdq 464(%esp), %xmm3, %xmm3
vmovdqa %xmm3, 304(%esp)
vmovdqa 672(%esp), %xmm3
vpunpckhqdq 576(%esp), %xmm3, %xmm3
vpaddq %xmm3, %xmm5, %xmm5
vmovdqa %xmm3, 112(%esp)
vpaddq %xmm4, %xmm5, %xmm5
vpxor %xmm5, %xmm2, %xmm2
vprotq $32, %xmm2, %xmm2
vpaddq 608(%esp), %xmm2, %xmm3
vpaddq 304(%esp), %xmm6, %xmm6
vmovdqa %xmm3, 656(%esp)
vpxor %xmm3, %xmm4, %xmm4
vmovdqa 640(%esp), %xmm3
vpunpcklqdq 672(%esp), %xmm3, %xmm3
vmovdqa %xmm3, 288(%esp)
vmovdqa 528(%esp), %xmm3
vpalignr $8, 560(%esp), %xmm3, %xmm3
vpaddq %xmm0, %xmm6, %xmm6
vpxor %xmm6, %xmm1, %xmm1
vprotq $40, %xmm4, %xmm4
vprotq $32, %xmm1, %xmm1
vpaddq 288(%esp), %xmm6, %xmm6
vpaddq %xmm1, %xmm7, %xmm7
vmovdqa %xmm3, 96(%esp)
vpaddq 96(%esp), %xmm5, %xmm5
vpxor %xmm7, %xmm0, %xmm0
vprotq $40, %xmm0, %xmm0
vpaddq %xmm0, %xmm6, %xmm6
vpaddq %xmm4, %xmm5, %xmm5
vpxor %xmm6, %xmm1, %xmm1
vprotq $48, %xmm1, %xmm1
vpxor %xmm5, %xmm2, %xmm2
vprotq $48, %xmm2, %xmm2
vpaddq %xmm1, %xmm7, %xmm7
vpaddq 656(%esp), %xmm2, %xmm3
vpxor %xmm7, %xmm0, %xmm0
vprotq $1, %xmm0, %xmm0
vmovdqa %xmm7, 608(%esp)
vpxor %xmm3, %xmm4, %xmm4
vprotq $1, %xmm4, %xmm4
vpalignr $8, %xmm0, %xmm4, %xmm7
vpalignr $8, %xmm4, %xmm0, %xmm0
vpalignr $8, %xmm1, %xmm2, %xmm4
vpalignr $8, %xmm2, %xmm1, %xmm1
vpshufd $78, 688(%esp), %xmm2
vmovdqa %xmm2, 240(%esp)
vmovdqa 640(%esp), %xmm2
vpunpckhqdq 464(%esp), %xmm2, %xmm2
vpaddq %xmm2, %xmm5, %xmm5
vmovdqa %xmm2, 80(%esp)
vpaddq %xmm0, %xmm5, %xmm5
vpaddq 240(%esp), %xmm6, %xmm6
vpxor %xmm5, %xmm4, %xmm4
vprotq $32, %xmm4, %xmm4
vpaddq 608(%esp), %xmm4, %xmm2
vpaddq %xmm7, %xmm6, %xmm6
vmovdqa %xmm2, 656(%esp)
vpxor %xmm6, %xmm1, %xmm1
vpxor %xmm2, %xmm0, %xmm0
vprotq $32, %xmm1, %xmm1
vprotq $40, %xmm0, %xmm0
vmovdqa 576(%esp), %xmm2
vpunpcklqdq 480(%esp), %xmm2, %xmm2
vmovdqa %xmm2, 64(%esp)
vmovdqa 528(%esp), %xmm2
vpaddq 64(%esp), %xmm6, %xmm6
vpunpckhqdq 480(%esp), %xmm2, %xmm2
vpaddq %xmm2, %xmm5, %xmm5
vpaddq %xmm1, %xmm3, %xmm3
vpaddq %xmm0, %xmm5, %xmm5
vmovdqa %xmm2, 368(%esp)
vpxor %xmm3, %xmm7, %xmm7
vpxor %xmm5, %xmm4, %xmm4
vprotq $40, %xmm7, %xmm7
vprotq $48, %xmm4, %xmm4
vpaddq %xmm7, %xmm6, %xmm6
vpaddq 656(%esp), %xmm4, %xmm2
vpxor %xmm6, %xmm1, %xmm1
vprotq $48, %xmm1, %xmm1
vpaddq %xmm1, %xmm3, %xmm3
vmovdqa %xmm3, 608(%esp)
vpxor %xmm3, %xmm7, %xmm7
vprotq $1, %xmm7, %xmm7
vpxor %xmm2, %xmm0, %xmm0
vprotq $1, %xmm0, %xmm3
vpalignr $8, %xmm3, %xmm7, %xmm0
vpalignr $8, %xmm7, %xmm3, %xmm7
vpalignr $8, %xmm4, %xmm1, %xmm3
vpalignr $8, %xmm1, %xmm4, %xmm4
vmovdqa %xmm3, 656(%esp)
vmovdqa 576(%esp), %xmm3
vpalignr $8, 640(%esp), %xmm3, %xmm1
vmovdqa 464(%esp), %xmm3
vpunpckhqdq 560(%esp), %xmm3, %xmm3
vpaddq %xmm3, %xmm5, %xmm5
vpaddq %xmm7, %xmm5, %xmm5
vmovdqa %xmm3, 384(%esp)
vpxor 656(%esp), %xmm5, %xmm3
vprotq $32, %xmm3, %xmm3
vpaddq %xmm1, %xmm6, %xmm6
vpaddq 608(%esp), %xmm3, %xmm1
vpaddq %xmm0, %xmm6, %xmm6
vpxor %xmm6, %xmm4, %xmm4
vprotq $32, %xmm4, %xmm4
vpaddq %xmm4, %xmm2, %xmm2
vpxor %xmm1, %xmm7, %xmm7
vprotq $40, %xmm7, %xmm7
vpxor %xmm2, %xmm0, %xmm0
vmovdqa %xmm7, 624(%esp)
vmovdqa 672(%esp), %xmm7
vpunpcklqdq 688(%esp), %xmm7, %xmm7
vmovdqa %xmm7, 656(%esp)
vpaddq 656(%esp), %xmm6, %xmm6
vprotq $40, %xmm0, %xmm0
vmovdqa 576(%esp), %xmm7
vmovdqa %xmm7, 512(%esp)
vmovdqa 480(%esp), %xmm7
vmovdqa %xmm7, 608(%esp)
vpblendw $240, 512(%esp), %xmm7, %xmm7
vpaddq %xmm7, %xmm5, %xmm5
vpaddq %xmm0, %xmm6, %xmm6
vmovdqa %xmm6, 496(%esp)
vpaddq 624(%esp), %xmm5, %xmm5
vpxor %xmm6, %xmm4, %xmm4
vprotq $48, %xmm4, %xmm4
vpaddq %xmm4, %xmm2, %xmm2
vpxor %xmm5, %xmm3, %xmm3
vprotq $48, %xmm3, %xmm3
vmovdqa %xmm2, 656(%esp)
vpaddq %xmm3, %xmm1, %xmm1
vpxor %xmm2, %xmm0, %xmm0
vprotq $1, %xmm0, %xmm0
vpxor 624(%esp), %xmm1, %xmm2
vprotq $1, %xmm2, %xmm2
vpalignr $8, %xmm0, %xmm2, %xmm7
vpalignr $8, %xmm2, %xmm0, %xmm0
vpalignr $8, %xmm4, %xmm3, %xmm2
vpalignr $8, %xmm3, %xmm4, %xmm3
vmovdqa 640(%esp), %xmm4
vmovdqa %xmm2, 624(%esp)
vpblendw $240, 608(%esp), %xmm4, %xmm6
vmovdqa 528(%esp), %xmm2
vpaddq 496(%esp), %xmm6, %xmm6
vmovdqa %xmm4, 448(%esp)
vpunpckhqdq 672(%esp), %xmm2, %xmm4
vpaddq %xmm4, %xmm5, %xmm5
vpaddq %xmm0, %xmm5, %xmm5
vpxor 624(%esp), %xmm5, %xmm2
vprotq $32, %xmm2, %xmm2
vpaddq %xmm7, %xmm6, %xmm6
vpaddq 656(%esp), %xmm2, %xmm4
vpxor %xmm6, %xmm3, %xmm3
vprotq $32, %xmm3, %xmm3
vpaddq %xmm3, %xmm1, %xmm1
vmovdqa %xmm1, 624(%esp)
vpxor %xmm1, %xmm7, %xmm7
vprotq $40, %xmm7, %xmm7
vmovdqa %xmm4, 496(%esp)
vpxor %xmm4, %xmm0, %xmm0
vprotq $40, %xmm0, %xmm1
vmovdqa 560(%esp), %xmm0
vpunpcklqdq 528(%esp), %xmm0, %xmm4
vmovdqa 464(%esp), %xmm0
vpalignr $8, 688(%esp), %xmm0, %xmm0
vpaddq %xmm4, %xmm6, %xmm6
vpaddq %xmm7, %xmm6, %xmm6
vmovdqa %xmm6, 656(%esp)
vpxor %xmm6, %xmm3, %xmm3
vprotq $48, %xmm3, %xmm3
vmovdqa %xmm0, 592(%esp)
vpaddq 592(%esp), %xmm5, %xmm5
vpaddq %xmm1, %xmm5, %xmm5
vpxor %xmm5, %xmm2, %xmm2
vprotq $48, %xmm2, %xmm6
vpaddq 496(%esp), %xmm6, %xmm4
vpaddq 624(%esp), %xmm3, %xmm2
vpxor %xmm4, %xmm1, %xmm1
vprotq $1, %xmm1, %xmm1
vpxor %xmm2, %xmm7, %xmm0
vpalignr $8, %xmm6, %xmm3, %xmm7
vprotq $1, %xmm0, %xmm0
vmovdqa %xmm2, 624(%esp)
vmovdqa %xmm7, 592(%esp)
vpalignr $8, %xmm1, %xmm0, %xmm2
vpalignr $8, %xmm3, %xmm6, %xmm3
vpalignr $8, %xmm0, %xmm1, %xmm0
vmovdqa 576(%esp), %xmm1
vpunpckhqdq 640(%esp), %xmm1, %xmm6
vmovdqa 656(%esp), %xmm1
vpaddq 368(%esp), %xmm1, %xmm7
vpaddq %xmm6, %xmm5, %xmm6
vmovdqa 672(%esp), %xmm5
vpunpckhqdq 688(%esp), %xmm5, %xmm5
vpaddq %xmm0, %xmm6, %xmm6
vpaddq %xmm2, %xmm7, %xmm7
vpxor 592(%esp), %xmm6, %xmm1
vprotq $32, %xmm1, %xmm1
vmovdqa %xmm7, 496(%esp)
vpxor %xmm7, %xmm3, %xmm3
vpaddq 624(%esp), %xmm1, %xmm7
vprotq $32, %xmm3, %xmm3
vpaddq 496(%esp), %xmm5, %xmm5
vpaddq %xmm3, %xmm4, %xmm4
vpaddq 320(%esp), %xmm6, %xmm6
vpxor %xmm4, %xmm2, %xmm2
vpxor %xmm7, %xmm0, %xmm0
vprotq $40, %xmm2, %xmm2
vprotq $40, %xmm0, %xmm0
vpaddq %xmm5, %xmm2, %xmm5
vpaddq %xmm0, %xmm6, %xmm6
vpxor %xmm5, %xmm3, %xmm3
vprotq $48, %xmm3, %xmm3
vpxor %xmm6, %xmm1, %xmm1
vprotq $48, %xmm1, %xmm1
vpaddq %xmm3, %xmm4, %xmm4
vpaddq %xmm1, %xmm7, %xmm7
vmovdqa %xmm6, 624(%esp)
vpxor %xmm4, %xmm2, %xmm2
vpxor %xmm7, %xmm0, %xmm0
vprotq $1, %xmm2, %xmm6
vprotq $1, %xmm0, %xmm2
vmovdqa %xmm4, 432(%esp)
vpalignr $8, %xmm6, %xmm2, %xmm4
vpalignr $8, %xmm2, %xmm6, %xmm2
vpalignr $8, %xmm3, %xmm1, %xmm6
vmovdqa 464(%esp), %xmm0
vpalignr $8, %xmm1, %xmm3, %xmm1
vmovdqa %xmm6, 544(%esp)
vmovdqa %xmm0, 496(%esp)
vmovdqa 608(%esp), %xmm6
vpblendw $240, %xmm0, %xmm6, %xmm3
vmovdqa 560(%esp), %xmm0
vpaddq %xmm3, %xmm5, %xmm5
vmovdqa %xmm0, 656(%esp)
vmovdqa 624(%esp), %xmm3
vmovdqa 496(%esp), %xmm0
vpblendw $240, 656(%esp), %xmm0, %xmm6
vmovdqa %xmm6, 592(%esp)
vpaddq %xmm6, %xmm3, %xmm6
vpaddq %xmm2, %xmm6, %xmm6
vpaddq %xmm4, %xmm5, %xmm5
vpxor 544(%esp), %xmm6, %xmm0
vprotq $32, %xmm0, %xmm0
vpxor %xmm5, %xmm1, %xmm1
vpaddq 432(%esp), %xmm0, %xmm3
vprotq $32, %xmm1, %xmm1
vpaddq %xmm1, %xmm7, %xmm7
vpxor %xmm7, %xmm4, %xmm4
vprotq $40, %xmm4, %xmm4
vmovdqa %xmm3, 544(%esp)
vpxor %xmm3, %xmm2, %xmm2
vmovdqa 528(%esp), %xmm3
vpunpcklqdq 640(%esp), %xmm3, %xmm3
vmovdqa %xmm3, 48(%esp)
vpaddq 48(%esp), %xmm5, %xmm5
vprotq $40, %xmm2, %xmm2
vmovdqa 688(%esp), %xmm3
vpunpcklqdq 672(%esp), %xmm3, %xmm3
vpaddq %xmm3, %xmm6, %xmm6
vmovdqa %xmm3, 416(%esp)
vpaddq %xmm4, %xmm5, %xmm5
vpaddq %xmm2, %xmm6, %xmm6
vpxor %xmm5, %xmm1, %xmm1
vprotq $48, %xmm1, %xmm1
vpxor %xmm6, %xmm0, %xmm0
vpaddq %xmm1, %xmm7, %xmm7
vprotq $48, %xmm0, %xmm0
vmovdqa %xmm6, 624(%esp)
vmovdqa %xmm7, 432(%esp)
vpaddq 544(%esp), %xmm0, %xmm7
vpalignr $8, %xmm0, %xmm1, %xmm6
vpxor 432(%esp), %xmm4, %xmm3
vprotq $1, %xmm3, %xmm3
vmovdqa %xmm6, 544(%esp)
vpalignr $8, %xmm1, %xmm0, %xmm1
vpxor %xmm7, %xmm2, %xmm2
vprotq $1, %xmm2, %xmm2
vpalignr $8, %xmm2, %xmm3, %xmm4
vpalignr $8, %xmm3, %xmm2, %xmm3
vmovdqa 672(%esp), %xmm2
vpunpckhqdq 464(%esp), %xmm2, %xmm0
vmovdqa 480(%esp), %xmm2
vpunpcklqdq 640(%esp), %xmm2, %xmm6
vpaddq 624(%esp), %xmm6, %xmm6
vpaddq %xmm0, %xmm5, %xmm5
vpaddq %xmm4, %xmm5, %xmm5
vpxor %xmm5, %xmm1, %xmm1
vprotq $32, %xmm1, %xmm1
vpaddq %xmm3, %xmm6, %xmm6
vpaddq %xmm1, %xmm7, %xmm7
vpxor 544(%esp), %xmm6, %xmm2
vprotq $32, %xmm2, %xmm2
vpxor %xmm7, %xmm4, %xmm4
vpaddq 432(%esp), %xmm2, %xmm0
vprotq $40, %xmm4, %xmm4
vmovdqa %xmm0, 544(%esp)
vpaddq 592(%esp), %xmm6, %xmm6
vpxor %xmm0, %xmm3, %xmm3
vmovdqa 528(%esp), %xmm0
vmovdqa %xmm0, 624(%esp)
vmovdqa 688(%esp), %xmm0
vmovdqa %xmm0, 432(%esp)
vpblendw $240, 624(%esp), %xmm0, %xmm0
vpaddq %xmm0, %xmm5, %xmm5
vpaddq %xmm4, %xmm5, %xmm5
vprotq $40, %xmm3, %xmm3
vpaddq %xmm3, %xmm6, %xmm6
vpxor %xmm5, %xmm1, %xmm1
vprotq $48, %xmm1, %xmm1
vpaddq %xmm1, %xmm7, %xmm7
vpxor %xmm6, %xmm2, %xmm2
vprotq $48, %xmm2, %xmm2
vmovdqa %xmm7, 400(%esp)
vpaddq 544(%esp), %xmm2, %xmm7
vpxor 400(%esp), %xmm4, %xmm4
vmovdqa %xmm6, 592(%esp)
vprotq $1, %xmm4, %xmm0
vpalignr $8, %xmm1, %xmm2, %xmm6
vmovdqa %xmm6, 544(%esp)
vpalignr $8, %xmm2, %xmm1, %xmm1
vpxor %xmm7, %xmm3, %xmm3
vprotq $1, %xmm3, %xmm4
vpalignr $8, %xmm0, %xmm4, %xmm3
vpalignr $8, %xmm4, %xmm0, %xmm4
vmovdqa 656(%esp), %xmm0
vpblendw $240, 448(%esp), %xmm0, %xmm6
vmovdqa 624(%esp), %xmm0
vpblendw $240, 608(%esp), %xmm0, %xmm2
vpaddq 592(%esp), %xmm2, %xmm2
vpaddq %xmm6, %xmm5, %xmm5
vpaddq %xmm3, %xmm5, %xmm5
vpxor %xmm5, %xmm1, %xmm1
vprotq $32, %xmm1, %xmm1
vpaddq %xmm4, %xmm2, %xmm2
vpaddq %xmm1, %xmm7, %xmm7
vpxor 544(%esp), %xmm2, %xmm0
vprotq $32, %xmm0, %xmm0
vmovdqa %xmm7, 544(%esp)
vpaddq 400(%esp), %xmm0, %xmm6
vpxor %xmm7, %xmm3, %xmm3
vprotq $40, %xmm3, %xmm3
vmovdqa %xmm6, 400(%esp)
vpxor %xmm6, %xmm4, %xmm4
vmovdqa 576(%esp), %xmm6
vpalignr $8, 688(%esp), %xmm6, %xmm7
vprotq $40, %xmm4, %xmm4
vmovdqa 672(%esp), %xmm6
vmovdqa %xmm6, 592(%esp)
vpblendw $240, 512(%esp), %xmm6, %xmm6
vpaddq %xmm6, %xmm2, %xmm2
vpaddq %xmm4, %xmm2, %xmm2
vpaddq %xmm7, %xmm5, %xmm5
vpxor %xmm2, %xmm0, %xmm0
vprotq $48, %xmm0, %xmm0
vpaddq %xmm3, %xmm5, %xmm5
vpxor %xmm5, %xmm1, %xmm1
vprotq $48, %xmm1, %xmm1
vpaddq 544(%esp), %xmm1, %xmm7
vpaddq 416(%esp), %xmm2, %xmm2
vmovdqa %xmm7, 544(%esp)
vpaddq 400(%esp), %xmm0, %xmm7
vpxor 544(%esp), %xmm3, %xmm3
vprotq $1, %xmm3, %xmm3
vpxor %xmm7, %xmm4, %xmm4
vprotq $1, %xmm4, %xmm6
vpalignr $8, %xmm6, %xmm3, %xmm4
vpalignr $8, %xmm3, %xmm6, %xmm3
vpalignr $8, %xmm0, %xmm1, %xmm6
vpalignr $8, %xmm1, %xmm0, %xmm1
vmovdqa %xmm6, 400(%esp)
vmovdqa 480(%esp), %xmm6
vpunpcklqdq 528(%esp), %xmm6, %xmm0
vpaddq %xmm0, %xmm5, %xmm5
vpaddq %xmm3, %xmm2, %xmm2
vpaddq %xmm4, %xmm5, %xmm5
vpxor 400(%esp), %xmm2, %xmm6
vprotq $32, %xmm6, %xmm6
vpxor %xmm5, %xmm1, %xmm1
vprotq $32, %xmm1, %xmm1
vpaddq %xmm1, %xmm7, %xmm7
vmovdqa %xmm7, 416(%esp)
vpaddq 544(%esp), %xmm6, %xmm7
vpxor 416(%esp), %xmm4, %xmm4
vmovdqa 576(%esp), %xmm0
vprotq $40, %xmm4, %xmm4
vmovdqa %xmm7, 544(%esp)
vpxor %xmm7, %xmm3, %xmm3
vpunpcklqdq 640(%esp), %xmm0, %xmm7
vprotq $40, %xmm3, %xmm3
vmovdqa 640(%esp), %xmm0
vpaddq %xmm7, %xmm5, %xmm5
vpunpckhqdq 480(%esp), %xmm0, %xmm0
vpaddq %xmm0, %xmm2, %xmm2
vpaddq %xmm4, %xmm5, %xmm5
vpaddq %xmm3, %xmm2, %xmm2
vpxor %xmm5, %xmm1, %xmm1
vprotq $48, %xmm1, %xmm1
vpxor %xmm2, %xmm6, %xmm6
vprotq $48, %xmm6, %xmm6
vmovdqa %xmm5, 400(%esp)
vpaddq 544(%esp), %xmm6, %xmm7
vmovdqa %xmm0, (%esp)
vpaddq 416(%esp), %xmm1, %xmm5
vpxor %xmm7, %xmm3, %xmm3
vpxor %xmm5, %xmm4, %xmm4
vprotq $1, %xmm4, %xmm0
vprotq $1, %xmm3, %xmm4
vpalignr $8, %xmm0, %xmm4, %xmm3
vpalignr $8, %xmm4, %xmm0, %xmm4
vmovdqa %xmm5, 416(%esp)
vpalignr $8, %xmm1, %xmm6, %xmm0
vmovdqa 496(%esp), %xmm5
vpalignr $8, %xmm6, %xmm1, %xmm1
vmovdqa %xmm0, 544(%esp)
vpblendw $240, 624(%esp), %xmm5, %xmm6
vmovdqa 560(%esp), %xmm0
vpaddq 400(%esp), %xmm6, %xmm6
vpunpckhqdq 688(%esp), %xmm0, %xmm5
vpaddq %xmm5, %xmm2, %xmm2
vpaddq %xmm4, %xmm2, %xmm2
vpxor 544(%esp), %xmm2, %xmm0
vprotq $32, %xmm0, %xmm0
vpaddq 416(%esp), %xmm0, %xmm5
vpaddq %xmm3, %xmm6, %xmm6
vpxor %xmm6, %xmm1, %xmm1
vprotq $32, %xmm1, %xmm1
vpaddq %xmm1, %xmm7, %xmm7
vmovdqa %xmm7, 544(%esp)
vmovdqa %xmm5, 416(%esp)
vpxor %xmm7, %xmm3, %xmm3
vpxor %xmm5, %xmm4, %xmm4
vmovdqa 576(%esp), %xmm5
vpunpckhqdq 464(%esp), %xmm5, %xmm7
vmovdqa 656(%esp), %xmm5
vpblendw $240, 592(%esp), %xmm5, %xmm5
vmovdqa %xmm5, 656(%esp)
vpaddq 656(%esp), %xmm2, %xmm5
vprotq $40, %xmm3, %xmm3
vprotq $40, %xmm4, %xmm4
vpaddq %xmm7, %xmm6, %xmm6
vpaddq %xmm3, %xmm6, %xmm6
vpaddq %xmm4, %xmm5, %xmm5
vpxor %xmm6, %xmm1, %xmm1
vprotq $48, %xmm1, %xmm1
vpxor %xmm5, %xmm0, %xmm0
vprotq $48, %xmm0, %xmm0
vpaddq 544(%esp), %xmm1, %xmm7
vpaddq 416(%esp), %xmm0, %xmm2
vpaddq 304(%esp), %xmm5, %xmm5
vmovdqa %xmm7, 656(%esp)
vpxor %xmm7, %xmm3, %xmm3
vprotq $1, %xmm3, %xmm3
vpxor %xmm2, %xmm4, %xmm4
vprotq $1, %xmm4, %xmm7
vpalignr $8, %xmm7, %xmm3, %xmm4
vpalignr $8, %xmm3, %xmm7, %xmm3
vpaddq %xmm3, %xmm5, %xmm5
vpalignr $8, %xmm0, %xmm1, %xmm7
vmovdqa %xmm7, 592(%esp)
vpalignr $8, %xmm1, %xmm0, %xmm1
vmovdqa 512(%esp), %xmm0
vpblendw $240, 432(%esp), %xmm0, %xmm7
vpaddq %xmm7, %xmm6, %xmm7
vpxor 592(%esp), %xmm5, %xmm6
vprotq $32, %xmm6, %xmm6
vpaddq %xmm4, %xmm7, %xmm7
vpaddq 656(%esp), %xmm6, %xmm0
vpxor %xmm7, %xmm1, %xmm1
vprotq $32, %xmm1, %xmm1
vpaddq %xmm1, %xmm2, %xmm2
vpxor %xmm2, %xmm4, %xmm4
vprotq $40, %xmm4, %xmm4
vmovdqa %xmm0, 656(%esp)
vpxor %xmm0, %xmm3, %xmm3
vmovdqa 640(%esp), %xmm0
vpalignr $8, 576(%esp), %xmm0, %xmm0
vprotq $40, %xmm3, %xmm3
vpaddq 384(%esp), %xmm7, %xmm7
vmovdqa %xmm0, 544(%esp)
vpaddq 544(%esp), %xmm5, %xmm5
vpaddq %xmm4, %xmm7, %xmm7
vpxor %xmm7, %xmm1, %xmm1
vprotq $48, %xmm1, %xmm1
vmovdqa %xmm7, 592(%esp)
vpaddq %xmm3, %xmm5, %xmm5
vpaddq %xmm1, %xmm2, %xmm2
vmovdqa 688(%esp), %xmm7
vpxor %xmm5, %xmm6, %xmm6
vprotq $48, %xmm6, %xmm6
vmovdqa %xmm2, 432(%esp)
vpaddq 656(%esp), %xmm6, %xmm2
vpxor 432(%esp), %xmm4, %xmm4
vprotq $1, %xmm4, %xmm0
vpxor %xmm2, %xmm3, %xmm3
vprotq $1, %xmm3, %xmm4
vpalignr $8, %xmm0, %xmm4, %xmm3
vpalignr $8, %xmm4, %xmm0, %xmm4
vpalignr $8, %xmm1, %xmm6, %xmm0
vpalignr $8, %xmm6, %xmm1, %xmm1
vpunpcklqdq 528(%esp), %xmm7, %xmm6
vpshufd $78, 672(%esp), %xmm7
vpaddq %xmm7, %xmm5, %xmm5
vpaddq 592(%esp), %xmm6, %xmm6
vpaddq %xmm4, %xmm5, %xmm5
vpxor %xmm5, %xmm0, %xmm0
vprotq $32, %xmm0, %xmm0
vpaddq 432(%esp), %xmm0, %xmm7
vpaddq %xmm3, %xmm6, %xmm6
vpxor %xmm6, %xmm1, %xmm1
vpaddq 368(%esp), %xmm6, %xmm6
vprotq $32, %xmm1, %xmm1
vmovdqa %xmm7, 656(%esp)
vpaddq %xmm1, %xmm2, %xmm2
vpxor %xmm7, %xmm4, %xmm4
vmovdqa 608(%esp), %xmm7
vpblendw $240, 448(%esp), %xmm7, %xmm7
vmovdqa %xmm7, 592(%esp)
vpaddq 592(%esp), %xmm5, %xmm7
vpxor %xmm2, %xmm3, %xmm3
vprotq $40, %xmm3, %xmm3
vpaddq %xmm3, %xmm6, %xmm6
vprotq $40, %xmm4, %xmm4
vpxor %xmm6, %xmm1, %xmm1
vprotq $48, %xmm1, %xmm1
vmovdqa %xmm6, 448(%esp)
vpaddq %xmm4, %xmm7, %xmm7
vpaddq %xmm1, %xmm2, %xmm2
vpxor %xmm7, %xmm0, %xmm0
vprotq $48, %xmm0, %xmm0
vmovdqa %xmm2, 592(%esp)
vpaddq 656(%esp), %xmm0, %xmm2
vpxor 592(%esp), %xmm3, %xmm3
vprotq $1, %xmm3, %xmm3
vpxor %xmm2, %xmm4, %xmm4
vprotq $1, %xmm4, %xmm4
vpalignr $8, %xmm4, %xmm3, %xmm5
vpalignr $8, %xmm3, %xmm4, %xmm3
vpalignr $8, %xmm0, %xmm1, %xmm4
vpalignr $8, %xmm1, %xmm0, %xmm1
vmovdqa 576(%esp), %xmm0
vmovdqa %xmm4, 656(%esp)
vpunpckhqdq 528(%esp), %xmm0, %xmm6
vmovdqa 512(%esp), %xmm4
vpblendw $240, 608(%esp), %xmm4, %xmm0
vpaddq %xmm0, %xmm7, %xmm7
vpaddq %xmm3, %xmm7, %xmm7
vpxor 656(%esp), %xmm7, %xmm4
vprotq $32, %xmm4, %xmm4
vpaddq 592(%esp), %xmm4, %xmm0
vpaddq 448(%esp), %xmm6, %xmm6
vmovdqa %xmm0, 512(%esp)
vpxor %xmm0, %xmm3, %xmm3
vmovdqa 560(%esp), %xmm0
vpalignr $8, 640(%esp), %xmm0, %xmm0
vpaddq %xmm5, %xmm6, %xmm6
vpxor %xmm6, %xmm1, %xmm1
vprotq $32, %xmm1, %xmm1
vprotq $40, %xmm3, %xmm3
vpaddq %xmm1, %xmm2, %xmm2
vmovdqa %xmm0, 448(%esp)
vpaddq 448(%esp), %xmm6, %xmm6
vpxor %xmm2, %xmm5, %xmm5
vprotq $40, %xmm5, %xmm5
vmovdqa 688(%esp), %xmm0
vpunpckhqdq 672(%esp), %xmm0, %xmm0
vpaddq %xmm0, %xmm7, %xmm7
vpaddq %xmm5, %xmm6, %xmm6
vpaddq %xmm3, %xmm7, %xmm7
vpxor %xmm6, %xmm1, %xmm1
vprotq $48, %xmm1, %xmm1
vpxor %xmm7, %xmm4, %xmm4
vpaddq %xmm1, %xmm2, %xmm2
vprotq $48, %xmm4, %xmm4
vmovdqa %xmm2, 656(%esp)
vpaddq 512(%esp), %xmm4, %xmm2
vpxor 656(%esp), %xmm5, %xmm5
vprotq $1, %xmm5, %xmm0
vpaddq 384(%esp), %xmm6, %xmm6
vpxor %xmm2, %xmm3, %xmm3
vprotq $1, %xmm3, %xmm5
vpalignr $8, %xmm0, %xmm5, %xmm3
vpalignr $8, %xmm5, %xmm0, %xmm5
vpalignr $8, %xmm1, %xmm4, %xmm0
vpalignr $8, %xmm4, %xmm1, %xmm4
vmovdqa %xmm0, 592(%esp)
vmovdqa 672(%esp), %xmm0
vpunpcklqdq 480(%esp), %xmm0, %xmm1
vpaddq %xmm1, %xmm7, %xmm7
vpaddq %xmm3, %xmm6, %xmm6
vpaddq %xmm5, %xmm7, %xmm7
vpxor %xmm6, %xmm4, %xmm4
vprotq $32, %xmm4, %xmm4
vpxor 592(%esp), %xmm7, %xmm0
vprotq $32, %xmm0, %xmm0
vpaddq %xmm4, %xmm2, %xmm2
vpaddq 656(%esp), %xmm0, %xmm1
vpxor %xmm2, %xmm3, %xmm3
vprotq $40, %xmm3, %xmm3
vpaddq 48(%esp), %xmm7, %xmm7
vmovdqa %xmm1, 512(%esp)
vpxor %xmm1, %xmm5, %xmm5
vmovdqa 688(%esp), %xmm1
vpunpcklqdq 464(%esp), %xmm1, %xmm1
vpaddq %xmm1, %xmm6, %xmm6
vprotq $40, %xmm5, %xmm5
vpaddq %xmm3, %xmm6, %xmm6
vpaddq %xmm5, %xmm7, %xmm7
vpxor %xmm6, %xmm4, %xmm4
vprotq $48, %xmm4, %xmm4
vpxor %xmm7, %xmm0, %xmm0
vpaddq %xmm4, %xmm2, %xmm2
vprotq $48, %xmm0, %xmm0
vmovdqa %xmm7, 656(%esp)
vmovdqa %xmm2, 384(%esp)
vpaddq 512(%esp), %xmm0, %xmm2
vpxor 384(%esp), %xmm3, %xmm3
vprotq $1, %xmm3, %xmm3
vpxor %xmm2, %xmm5, %xmm5
vprotq $1, %xmm5, %xmm5
vpalignr $8, %xmm5, %xmm3, %xmm1
vpalignr $8, %xmm3, %xmm5, %xmm3
vpalignr $8, %xmm0, %xmm4, %xmm5
vpalignr $8, %xmm4, %xmm0, %xmm0
vmovdqa 528(%esp), %xmm4
vmovdqa %xmm5, 592(%esp)
vpunpcklqdq 560(%esp), %xmm4, %xmm7
vmovdqa 688(%esp), %xmm5
vpalignr $8, 640(%esp), %xmm5, %xmm4
vpaddq %xmm7, %xmm6, %xmm6
vpaddq %xmm1, %xmm6, %xmm6
vpxor %xmm6, %xmm0, %xmm0
vprotq $32, %xmm0, %xmm0
vpaddq 656(%esp), %xmm4, %xmm4
vpaddq %xmm0, %xmm2, %xmm2
vpxor %xmm2, %xmm1, %xmm1
vprotq $40, %xmm1, %xmm1
vpaddq %xmm3, %xmm4, %xmm4
vpxor 592(%esp), %xmm4, %xmm5
vprotq $32, %xmm5, %xmm5
vpaddq 384(%esp), %xmm5, %xmm7
vmovdqa %xmm7, 512(%esp)
vpxor %xmm7, %xmm3, %xmm3
vmovdqa 560(%esp), %xmm7
vpunpckhqdq 672(%esp), %xmm7, %xmm7
vmovdqa %xmm7, 560(%esp)
vmovdqa 672(%esp), %xmm7
vpalignr $8, 480(%esp), %xmm7, %xmm7
vprotq $40, %xmm3, %xmm3
vmovdqa %xmm7, 672(%esp)
vpaddq 560(%esp), %xmm6, %xmm6
vpaddq 672(%esp), %xmm4, %xmm7
vpaddq %xmm1, %xmm6, %xmm6
vpaddq %xmm3, %xmm7, %xmm7
vpxor %xmm6, %xmm0, %xmm0
vprotq $48, %xmm0, %xmm0
vpaddq %xmm0, %xmm2, %xmm2
vpxor %xmm7, %xmm5, %xmm5
vprotq $48, %xmm5, %xmm5
vmovdqa %xmm2, 672(%esp)
vpaddq 512(%esp), %xmm5, %xmm2
vpxor 672(%esp), %xmm1, %xmm1
vprotq $1, %xmm1, %xmm4
vpaddq 576(%esp), %xmm6, %xmm6
vpxor %xmm2, %xmm3, %xmm3
vprotq $1, %xmm3, %xmm1
vpalignr $8, %xmm4, %xmm1, %xmm3
vpalignr $8, %xmm1, %xmm4, %xmm1
vpalignr $8, %xmm0, %xmm5, %xmm4
vpalignr $8, %xmm5, %xmm0, %xmm5
vmovdqa %xmm4, 656(%esp)
vmovdqa 640(%esp), %xmm4
vpalignr $8, 688(%esp), %xmm4, %xmm0
vpaddq %xmm3, %xmm6, %xmm6
vpxor %xmm6, %xmm5, %xmm5
vprotq $32, %xmm5, %xmm5
vpaddq %xmm0, %xmm7, %xmm7
vpaddq %xmm5, %xmm2, %xmm2
vpaddq %xmm1, %xmm7, %xmm7
vpxor %xmm2, %xmm3, %xmm3
vprotq $40, %xmm3, %xmm3
vpxor 656(%esp), %xmm7, %xmm4
vprotq $32, %xmm4, %xmm4
vpaddq 672(%esp), %xmm4, %xmm0
vpaddq 464(%esp), %xmm7, %xmm7
vmovdqa %xmm0, 672(%esp)
vpxor %xmm0, %xmm1, %xmm1
vmovdqa 608(%esp), %xmm0
vpblendw $240, 624(%esp), %xmm0, %xmm0
vpaddq %xmm0, %xmm6, %xmm6
vprotq $40, %xmm1, %xmm1
vpaddq %xmm3, %xmm6, %xmm6
vpaddq %xmm1, %xmm7, %xmm7
vpxor %xmm6, %xmm5, %xmm5
vprotq $48, %xmm5, %xmm5
vpxor %xmm7, %xmm4, %xmm4
vpaddq %xmm5, %xmm2, %xmm2
vprotq $48, %xmm4, %xmm4
vmovdqa %xmm2, 640(%esp)
vpaddq 672(%esp), %xmm4, %xmm2
vpxor 640(%esp), %xmm3, %xmm3
vprotq $1, %xmm3, %xmm3
vpaddq 288(%esp), %xmm6, %xmm6
vpxor %xmm2, %xmm1, %xmm1
vprotq $1, %xmm1, %xmm0
vpalignr $8, %xmm0, %xmm3, %xmm1
vpalignr $8, %xmm3, %xmm0, %xmm0
vpalignr $8, %xmm4, %xmm5, %xmm3
vpalignr $8, %xmm5, %xmm4, %xmm4
vmovdqa %xmm3, 672(%esp)
vmovdqa 528(%esp), %xmm3
vpunpckhqdq 688(%esp), %xmm3, %xmm5
vpaddq %xmm5, %xmm7, %xmm5
vpaddq %xmm1, %xmm6, %xmm6
vpaddq %xmm0, %xmm5, %xmm5
vpxor %xmm6, %xmm4, %xmm4
vprotq $32, %xmm4, %xmm4
vpxor 672(%esp), %xmm5, %xmm3
vprotq $32, %xmm3, %xmm3
vpaddq %xmm4, %xmm2, %xmm2
vpaddq 640(%esp), %xmm3, %xmm7
vpxor %xmm2, %xmm1, %xmm1
vprotq $40, %xmm1, %xmm1
vmovdqa %xmm7, 672(%esp)
vpxor %xmm7, %xmm0, %xmm0
vmovdqa 480(%esp), %xmm7
vpunpcklqdq 464(%esp), %xmm7, %xmm7
vmovdqa %xmm7, 656(%esp)
vpaddq 656(%esp), %xmm6, %xmm6
vprotq $40, %xmm0, %xmm0
vmovdqa 624(%esp), %xmm7
vpblendw $240, 496(%esp), %xmm7, %xmm7
vpaddq %xmm7, %xmm5, %xmm5
vpaddq %xmm1, %xmm6, %xmm6
vpaddq %xmm0, %xmm5, %xmm5
vpxor %xmm6, %xmm4, %xmm4
vprotq $48, %xmm4, %xmm4
vpxor %xmm5, %xmm3, %xmm3
vpaddq %xmm4, %xmm2, %xmm2
vprotq $48, %xmm3, %xmm3
vmovdqa %xmm2, 640(%esp)
vpaddq 672(%esp), %xmm3, %xmm2
vpxor 640(%esp), %xmm1, %xmm1
vprotq $1, %xmm1, %xmm1
vpxor %xmm2, %xmm0, %xmm0
vprotq $1, %xmm0, %xmm0
vpalignr $8, %xmm1, %xmm0, %xmm7
vpalignr $8, %xmm0, %xmm1, %xmm0
vpalignr $8, %xmm4, %xmm3, %xmm1
vpalignr $8, %xmm3, %xmm4, %xmm4
vmovdqa %xmm1, 656(%esp)
vmovdqa 480(%esp), %xmm1
vpaddq 560(%esp), %xmm6, %xmm6
vpunpckhqdq 576(%esp), %xmm1, %xmm3
vpaddq %xmm3, %xmm5, %xmm5
vmovdqa 656(%esp), %xmm3
vpaddq %xmm0, %xmm5, %xmm5
vpxor %xmm5, %xmm3, %xmm1
vprotq $32, %xmm1, %xmm1
vpaddq %xmm7, %xmm6, %xmm6
vmovdqa %xmm5, 672(%esp)
vpaddq 640(%esp), %xmm1, %xmm5
vpxor %xmm6, %xmm4, %xmm4
vmovdqa 576(%esp), %xmm3
vprotq $32, %xmm4, %xmm4
vpunpcklqdq 688(%esp), %xmm3, %xmm3
vpaddq 448(%esp), %xmm6, %xmm6
vpaddq %xmm4, %xmm2, %xmm2
vpaddq 672(%esp), %xmm3, %xmm3
vpxor %xmm2, %xmm7, %xmm7
vpxor %xmm5, %xmm0, %xmm0
vprotq $40, %xmm7, %xmm7
vprotq $40, %xmm0, %xmm0
vpaddq %xmm7, %xmm6, %xmm6
vpaddq %xmm3, %xmm0, %xmm3
vpxor %xmm6, %xmm4, %xmm4
vprotq $48, %xmm4, %xmm4
vpxor %xmm3, %xmm1, %xmm1
vprotq $48, %xmm1, %xmm1
vpaddq %xmm4, %xmm2, %xmm2
vpaddq %xmm1, %xmm5, %xmm5
vmovdqa %xmm2, 688(%esp)
vpxor %xmm2, %xmm7, %xmm7
vpaddq 208(%esp), %xmm3, %xmm3
vprotq $1, %xmm7, %xmm2
vpxor %xmm5, %xmm0, %xmm0
vprotq $1, %xmm0, %xmm0
vpalignr $8, %xmm0, %xmm2, %xmm7
vpalignr $8, %xmm2, %xmm0, %xmm0
vpaddq 224(%esp), %xmm6, %xmm6
vpalignr $8, %xmm1, %xmm4, %xmm2
vpaddq %xmm0, %xmm3, %xmm3
vpalignr $8, %xmm4, %xmm1, %xmm4
vpxor %xmm3, %xmm2, %xmm2
vprotq $32, %xmm2, %xmm1
vpaddq 688(%esp), %xmm1, %xmm2
vpaddq %xmm7, %xmm6, %xmm6
vpxor %xmm6, %xmm4, %xmm4
vpaddq 176(%esp), %xmm3, %xmm3
vprotq $32, %xmm4, %xmm4
vpaddq 192(%esp), %xmm6, %xmm6
vpaddq %xmm4, %xmm5, %xmm5
vpxor %xmm5, %xmm7, %xmm7
vpxor %xmm2, %xmm0, %xmm0
vprotq $40, %xmm7, %xmm7
vprotq $40, %xmm0, %xmm0
vpaddq %xmm7, %xmm6, %xmm6
vpaddq %xmm0, %xmm3, %xmm3
vpxor %xmm6, %xmm4, %xmm4
vpxor %xmm3, %xmm1, %xmm1
vprotq $48, %xmm4, %xmm4
vprotq $48, %xmm1, %xmm1
vpaddq %xmm4, %xmm5, %xmm5
vpaddq %xmm1, %xmm2, %xmm2
vmovdqa %xmm5, 688(%esp)
vpxor %xmm5, %xmm7, %xmm7
vpaddq 320(%esp), %xmm3, %xmm3
vprotq $1, %xmm7, %xmm5
vpxor %xmm2, %xmm0, %xmm0
vprotq $1, %xmm0, %xmm0
vpalignr $8, %xmm5, %xmm0, %xmm7
vpalignr $8, %xmm0, %xmm5, %xmm0
vpaddq 160(%esp), %xmm6, %xmm6
vpalignr $8, %xmm4, %xmm1, %xmm5
vpaddq %xmm0, %xmm3, %xmm3
vpalignr $8, %xmm1, %xmm4, %xmm4
vpxor %xmm3, %xmm5, %xmm5
vprotq $32, %xmm5, %xmm1
vpaddq 688(%esp), %xmm1, %xmm5
vpaddq %xmm7, %xmm6, %xmm6
vpxor %xmm6, %xmm4, %xmm4
vpaddq 128(%esp), %xmm3, %xmm3
vprotq $32, %xmm4, %xmm4
vpaddq 144(%esp), %xmm6, %xmm6
vpaddq %xmm4, %xmm2, %xmm2
vpxor %xmm2, %xmm7, %xmm7
vpxor %xmm5, %xmm0, %xmm0
vprotq $40, %xmm7, %xmm7
vprotq $40, %xmm0, %xmm0
vpaddq %xmm7, %xmm6, %xmm6
vpaddq %xmm0, %xmm3, %xmm3
vpxor %xmm6, %xmm4, %xmm4
vpxor %xmm3, %xmm1, %xmm1
vprotq $48, %xmm4, %xmm4
vprotq $48, %xmm1, %xmm1
vpaddq %xmm4, %xmm2, %xmm2
vpaddq %xmm1, %xmm5, %xmm5
vmovdqa %xmm2, 688(%esp)
vpxor %xmm2, %xmm7, %xmm7
vpaddq 112(%esp), %xmm3, %xmm3
vprotq $1, %xmm7, %xmm2
vpxor %xmm5, %xmm0, %xmm0
vprotq $1, %xmm0, %xmm0
vpalignr $8, %xmm0, %xmm2, %xmm7
vpalignr $8, %xmm2, %xmm0, %xmm0
vpaddq 304(%esp), %xmm6, %xmm6
vpalignr $8, %xmm1, %xmm4, %xmm2
vpaddq %xmm0, %xmm3, %xmm3
vpalignr $8, %xmm4, %xmm1, %xmm4
vpxor %xmm3, %xmm2, %xmm2
vprotq $32, %xmm2, %xmm1
vpaddq 688(%esp), %xmm1, %xmm2
vpaddq %xmm7, %xmm6, %xmm6
vpxor %xmm6, %xmm4, %xmm4
vpaddq 96(%esp), %xmm3, %xmm3
vprotq $32, %xmm4, %xmm4
vpaddq 288(%esp), %xmm6, %xmm6
vpaddq %xmm4, %xmm5, %xmm5
vpxor %xmm5, %xmm7, %xmm7
vpxor %xmm2, %xmm0, %xmm0
vprotq $40, %xmm7, %xmm7
vprotq $40, %xmm0, %xmm0
vpaddq %xmm7, %xmm6, %xmm6
vpaddq %xmm0, %xmm3, %xmm3
vpxor %xmm6, %xmm4, %xmm4
vpxor %xmm3, %xmm1, %xmm1
vprotq $48, %xmm4, %xmm4
vprotq $48, %xmm1, %xmm1
vpaddq %xmm4, %xmm5, %xmm5
vpaddq %xmm1, %xmm2, %xmm2
vmovdqa %xmm5, 688(%esp)
vpxor %xmm5, %xmm7, %xmm7
vpaddq 240(%esp), %xmm6, %xmm6
vprotq $1, %xmm7, %xmm5
vpxor %xmm2, %xmm0, %xmm0
vprotq $1, %xmm0, %xmm0
vpalignr $8, %xmm5, %xmm0, %xmm7
vpalignr $8, %xmm0, %xmm5, %xmm0
vpaddq 80(%esp), %xmm3, %xmm3
vpalignr $8, %xmm4, %xmm1, %xmm5
vpaddq %xmm7, %xmm6, %xmm6
vpalignr $8, %xmm1, %xmm4, %xmm4
vpxor %xmm6, %xmm4, %xmm4
vpaddq 64(%esp), %xmm6, %xmm6
vprotq $32, %xmm4, %xmm4
vpaddq %xmm0, %xmm3, %xmm3
vpaddq %xmm4, %xmm2, %xmm2
vpxor %xmm3, %xmm5, %xmm5
vpxor %xmm2, %xmm7, %xmm7
vprotq $32, %xmm5, %xmm1
vprotq $40, %xmm7, %xmm7
vpaddq 688(%esp), %xmm1, %xmm5
vpaddq %xmm7, %xmm6, %xmm6
vmovdqa %xmm6, 688(%esp)
vpaddq 368(%esp), %xmm3, %xmm3
vpxor %xmm6, %xmm4, %xmm4
vprotq $48, %xmm4, %xmm4
vpxor %xmm5, %xmm0, %xmm0
vprotq $40, %xmm0, %xmm0
vpaddq %xmm4, %xmm2, %xmm2
vpaddq %xmm0, %xmm3, %xmm3
vpxor %xmm2, %xmm7, %xmm7
vprotq $1, %xmm7, %xmm7
vpxor %xmm3, %xmm1, %xmm1
vprotq $48, %xmm1, %xmm1
vpxor %xmm2, %xmm3, %xmm2
vpaddq %xmm1, %xmm5, %xmm5
vpxor 256(%esp), %xmm2, %xmm2
vmovdqa %xmm2, 256(%esp)
vpxor %xmm5, %xmm0, %xmm0
vprotq $1, %xmm0, %xmm0
vpxor 688(%esp), %xmm5, %xmm5
vpalignr $8, %xmm0, %xmm7, %xmm6
vpalignr $8, %xmm7, %xmm0, %xmm0
vpxor 272(%esp), %xmm5, %xmm5
vpalignr $8, %xmm1, %xmm4, %xmm7
vpalignr $8, %xmm4, %xmm1, %xmm1
vmovdqa %xmm5, 272(%esp)
vpxor %xmm1, %xmm6, %xmm1
vpxor %xmm7, %xmm0, %xmm7
vpxor 352(%esp), %xmm1, %xmm1
vpxor 336(%esp), %xmm7, %xmm7
vmovdqa %xmm1, 352(%esp)
vmovdqa %xmm7, 336(%esp)
ja blake2b_blocks_xop_L20
vmovdqa %xmm5, (%edx)
vmovdqa %xmm1, 32(%edx)
vmovdqa %xmm7, 48(%edx)
vmovdqa 256(%esp), %xmm5
vmovdqa %xmm5, 16(%edx)
leal -12(%ebp), %esp
popl %ebx
popl %esi
popl %edi
popl %ebp
ret
.align 16,0x90
blake2b_blocks_xop_L14:
movl 688(%esp), %esi
movl %esi, 12(%ebp)
jmp blake2b_blocks_xop_L2
blake2b_blocks_xop_L19:
movl 12(%ebp), %esi
movl 656(%esp), %edi
vmovdqu (%esi), %xmm0
addl $16, %esi
vmovdqa %xmm0, (%edi)
addl $16, %edi
movl %esi, 12(%ebp)
movl %edi, 656(%esp)
jmp blake2b_blocks_xop_L6
blake2b_blocks_xop_L18:
movl 12(%ebp), %eax
vmovdqu (%eax), %xmm0
vmovdqa %xmm0, (%edi)
vmovdqu 16(%eax), %xmm0
addl $32, %eax
vmovdqa %xmm0, 16(%edi)
addl $32, %edi
movl %eax, 12(%ebp)
movl %edi, 656(%esp)
jmp blake2b_blocks_xop_L5
blake2b_blocks_xop_L17:
movl 12(%ebp), %esi
leal 768(%esp), %edi
leal 704(%esp), %eax
vmovdqu (%esi), %xmm0
vmovdqa %xmm0, 704(%esp)
vmovdqu 16(%esi), %xmm0
vmovdqa %xmm0, 720(%esp)
vmovdqu 32(%esi), %xmm0
vmovdqa %xmm0, 736(%esp)
vmovdqu 48(%esi), %xmm0
addl $64, %esi
vmovdqa %xmm0, 752(%esp)
movl %esi, 12(%ebp)
movl %edi, 656(%esp)
movl %eax, 688(%esp)
jmp blake2b_blocks_xop_L4


.align 16,0x90
.globl blake2b_blocks_ssse3
.globl _blake2b_blocks_ssse3
blake2b_blocks_ssse3:
_blake2b_blocks_ssse3:
pushl %ebp
movl %esp, %ebp
andl $-64, %esp
pushl %esi
pushl %edi
pushl %ebx
subl $1204, %esp
movl 8(%ebp), %eax
call blake2b_blocks_ssse3_LL2
blake2b_blocks_ssse3_LL2:
popl %ebx
leal _GLOBAL_OFFSET_TABLE_+1(%ebx), %ebx
movl 80(%eax), %edx
movl 12(%ebp), %esi
movdqa ssse3_rotr16_64@GOTOFF(%ebx), %xmm0
movdqa 48+blake2b_constants@GOTOFF(%ebx), %xmm3
movl 16(%ebp), %ecx
movdqa %xmm0, 864(%esp)
movdqa ssse3_rotr24_64@GOTOFF(%ebx), %xmm4
pxor 80(%eax), %xmm3
orl 84(%eax), %edx
jne blake2b_blocks_ssse3_L2
blake2b_blocks_ssse3_L33:
cmpl $128, %ecx
jmp blake2b_blocks_ssse3_L23
blake2b_blocks_ssse3_L2:
cmpl $128, %ecx
je blake2b_blocks_ssse3_L23
blake2b_blocks_ssse3_L3:
lea (%esp), %eax
testb $64, %cl
jne blake2b_blocks_ssse3_L5
blake2b_blocks_ssse3_L4:
pxor %xmm0, %xmm0
movdqa %xmm0, 64(%esp)
movdqa %xmm0, 80(%esp)
movdqa %xmm0, 96(%esp)
movdqa %xmm0, 112(%esp)
jmp blake2b_blocks_ssse3_L8
blake2b_blocks_ssse3_L5:
xorl %eax, %eax
blake2b_blocks_ssse3_L6:
movl %eax, %edx
incl %eax
shll $4, %edx
cmpl $4, %eax
movdqu (%esi,%edx), %xmm0
movdqa %xmm0, (%esp,%edx)
jl blake2b_blocks_ssse3_L6
blake2b_blocks_ssse3_L7:
addl $64, %esi
lea 64(%esp), %eax
pxor %xmm0, %xmm0
blake2b_blocks_ssse3_L8:
movdqa %xmm0, (%eax)
movdqa %xmm0, 16(%eax)
movdqa %xmm0, 32(%eax)
movdqa %xmm0, 48(%eax)
testb $32, %cl
je blake2b_blocks_ssse3_L10
blake2b_blocks_ssse3_L9:
movdqu (%esi), %xmm0
movdqa %xmm0, (%eax)
movdqu 16(%esi), %xmm1
movdqa %xmm1, 16(%eax)
addl $32, %esi
addl $32, %eax
blake2b_blocks_ssse3_L10:
testb $16, %cl
je blake2b_blocks_ssse3_L12
blake2b_blocks_ssse3_L11:
movdqu (%esi), %xmm0
movdqa %xmm0, (%eax)
addl $16, %esi
addl $16, %eax
blake2b_blocks_ssse3_L12:
testb $8, %cl
je blake2b_blocks_ssse3_L14
blake2b_blocks_ssse3_L13:
movl (%esi), %edx
movl 4(%esi), %edi
addl $8, %esi
movl %edx, (%eax)
movl %edi, 4(%eax)
addl $8, %eax
blake2b_blocks_ssse3_L14:
testb $4, %cl
je blake2b_blocks_ssse3_L16
blake2b_blocks_ssse3_L15:
movl (%esi), %edx
addl $4, %esi
movl %edx, (%eax)
addl $4, %eax
blake2b_blocks_ssse3_L16:
testb $2, %cl
je blake2b_blocks_ssse3_L18
blake2b_blocks_ssse3_L17:
movzwl (%esi), %edx
addl $2, %esi
movw %dx, (%eax)
addl $2, %eax
blake2b_blocks_ssse3_L18:
testb $1, %cl
je blake2b_blocks_ssse3_L20
blake2b_blocks_ssse3_L19:
movzbl (%esi), %edx
movb %dl, (%eax)
blake2b_blocks_ssse3_L20:
cmpl $128, %ecx
lea (%esp), %esi
blake2b_blocks_ssse3_L23:
movl 8(%ebp), %eax
movl $128, %edi
movdqa 32+blake2b_constants@GOTOFF(%ebx), %xmm7
cmovbe %ecx, %edi
movdqa 16+blake2b_constants@GOTOFF(%ebx), %xmm6
movdqa 48(%eax), %xmm5
movdqa %xmm5, 448(%esp)
movdqa (%eax), %xmm1
movdqa 16(%eax), %xmm0
movdqa 32(%eax), %xmm2
movdqa blake2b_constants@GOTOFF(%ebx), %xmm5
movl 64(%eax), %edx
movl 68(%eax), %eax
movdqa %xmm6, 848(%esp)
movdqa %xmm5, 128(%esp)
movdqa %xmm7, 144(%esp)
movdqa %xmm2, 464(%esp)
movdqa %xmm0, 432(%esp)
movdqa %xmm1, 416(%esp)
movdqa %xmm3, 160(%esp)
movdqa %xmm4, 800(%esp)
movl %edi, 1168(%esp)
jmp blake2b_blocks_ssse3_L24
blake2b_blocks_ssse3_L27:
addl 20(%ebp), %esi
addl $-128, %ecx
blake2b_blocks_ssse3_L24:
movl 8(%ebp), %edi
movl 1168(%esp), %ebx
addl %ebx, %edx
adcl $0, %eax
movl %edx, 64(%edi)
movl %eax, 68(%edi)
movl %edx, %edi
subl %ebx, %edi
movl $0, %ebx
movl %eax, %edi
sbbl %ebx, %edi
jae blake2b_blocks_ssse3_L26
blake2b_blocks_ssse3_L25:
movl 8(%ebp), %ebx
addl $1, 72(%ebx)
adcl $0, 76(%ebx)
blake2b_blocks_ssse3_L26:
movq 16(%esi), %xmm3
movq (%esi), %xmm4
movq 48(%esi), %xmm2
movdqa %xmm3, 720(%esp)
movl 8(%ebp), %ebx
movq 32(%esi), %xmm6
movdqa %xmm4, 560(%esp)
punpcklqdq %xmm3, %xmm4
movdqa 416(%esp), %xmm3
movdqa %xmm2, 672(%esp)
movdqa %xmm6, 528(%esp)
paddq %xmm4, %xmm3
punpcklqdq %xmm2, %xmm6
movdqa 432(%esp), %xmm2
movdqa 464(%esp), %xmm1
paddq %xmm6, %xmm2
paddq %xmm1, %xmm3
movdqa 64(%ebx), %xmm0
movdqa %xmm4, 352(%esp)
movdqa 448(%esp), %xmm4
pxor 144(%esp), %xmm0
paddq %xmm4, %xmm2
movdqa 160(%esp), %xmm5
pxor %xmm3, %xmm0
movdqa 128(%esp), %xmm7
pxor %xmm2, %xmm5
pshufd $177, %xmm0, %xmm0
movdqa %xmm0, 880(%esp)
movdqa %xmm6, 336(%esp)
pshufd $177, %xmm5, %xmm6
paddq %xmm0, %xmm7
movdqa 848(%esp), %xmm0
pxor %xmm7, %xmm1
paddq %xmm6, %xmm0
movdqa 800(%esp), %xmm5
pxor %xmm0, %xmm4
movdqa %xmm7, 912(%esp)
pshufb %xmm5, %xmm1
pshufb %xmm5, %xmm4
movq 8(%esi), %xmm7
movq 24(%esi), %xmm5
movdqa %xmm7, 688(%esp)
punpcklqdq %xmm5, %xmm7
movdqa %xmm6, 896(%esp)
movdqa %xmm0, 928(%esp)
movq 40(%esi), %xmm6
movq 56(%esi), %xmm0
paddq %xmm7, %xmm3
movdqa %xmm6, 544(%esp)
punpcklqdq %xmm0, %xmm6
paddq %xmm1, %xmm3
paddq %xmm6, %xmm2
movdqa %xmm5, 592(%esp)
movdqa 880(%esp), %xmm5
movdqa %xmm0, 624(%esp)
pxor %xmm3, %xmm5
movdqa 864(%esp), %xmm0
paddq %xmm4, %xmm2
pshufb %xmm0, %xmm5
movdqa %xmm6, 208(%esp)
movdqa 896(%esp), %xmm6
pxor %xmm2, %xmm6
pshufb %xmm0, %xmm6
movdqa 912(%esp), %xmm0
paddq %xmm5, %xmm0
movdqa %xmm7, 288(%esp)
pxor %xmm0, %xmm1
movdqa 928(%esp), %xmm7
paddq %xmm6, %xmm7
movdqa %xmm6, 896(%esp)
movdqa %xmm1, %xmm6
pxor %xmm7, %xmm4
psrlq $63, %xmm6
psllq $1, %xmm1
pxor %xmm1, %xmm6
movdqa %xmm4, %xmm1
psrlq $63, %xmm1
psllq $1, %xmm4
pxor %xmm4, %xmm1
movdqa %xmm7, 928(%esp)
movq 64(%esi), %xmm7
movq 80(%esi), %xmm4
movdqa %xmm5, 880(%esp)
movdqa %xmm1, %xmm5
movdqa %xmm7, 640(%esp)
punpcklqdq %xmm4, %xmm7
movdqa %xmm0, 912(%esp)
palignr $8, %xmm6, %xmm5
palignr $8, %xmm1, %xmm6
movq 112(%esi), %xmm1
movq 96(%esi), %xmm0
paddq %xmm7, %xmm3
movdqa %xmm1, 576(%esp)
movdqa %xmm0, 656(%esp)
punpcklqdq %xmm1, %xmm0
movdqa 880(%esp), %xmm1
movdqa %xmm7, 176(%esp)
movdqa %xmm4, 608(%esp)
movdqa %xmm1, %xmm4
paddq %xmm0, %xmm2
paddq %xmm5, %xmm3
paddq %xmm6, %xmm2
movdqa 896(%esp), %xmm7
palignr $8, %xmm7, %xmm4
pxor %xmm3, %xmm4
palignr $8, %xmm1, %xmm7
movdqa 928(%esp), %xmm1
pxor %xmm2, %xmm7
movdqa %xmm0, 384(%esp)
pshufd $177, %xmm4, %xmm0
paddq %xmm0, %xmm1
movdqa %xmm0, 944(%esp)
pxor %xmm1, %xmm5
pshufd $177, %xmm7, %xmm4
movdqa 912(%esp), %xmm0
movdqa %xmm4, 960(%esp)
paddq %xmm4, %xmm0
movdqa 800(%esp), %xmm4
pxor %xmm0, %xmm6
movdqa %xmm1, 928(%esp)
movq 72(%esi), %xmm7
movq 88(%esi), %xmm1
pshufb %xmm4, %xmm5
pshufb %xmm4, %xmm6
movdqa %xmm0, 912(%esp)
movdqa %xmm7, 736(%esp)
movq 104(%esi), %xmm0
punpcklqdq %xmm1, %xmm7
movq 120(%esi), %xmm4
movdqa %xmm1, 752(%esp)
movdqa %xmm0, %xmm1
paddq %xmm7, %xmm3
punpcklqdq %xmm4, %xmm1
paddq %xmm5, %xmm3
paddq %xmm1, %xmm2
movdqa %xmm7, 304(%esp)
movdqa 944(%esp), %xmm7
movdqa %xmm4, 768(%esp)
pxor %xmm3, %xmm7
movdqa 864(%esp), %xmm4
paddq %xmm6, %xmm2
pshufb %xmm4, %xmm7
movdqa %xmm1, 320(%esp)
movdqa 960(%esp), %xmm1
pxor %xmm2, %xmm1
pshufb %xmm4, %xmm1
movdqa 928(%esp), %xmm4
paddq %xmm7, %xmm4
movdqa %xmm7, 944(%esp)
pxor %xmm4, %xmm5
movdqa 912(%esp), %xmm7
paddq %xmm1, %xmm7
movdqa %xmm4, 928(%esp)
movdqa %xmm5, %xmm4
pxor %xmm7, %xmm6
psrlq $63, %xmm4
psllq $1, %xmm5
pxor %xmm5, %xmm4
movdqa %xmm6, %xmm5
psrlq $63, %xmm5
psllq $1, %xmm6
movdqa %xmm7, 912(%esp)
pxor %xmm6, %xmm5
movdqa %xmm4, %xmm7
palignr $8, %xmm5, %xmm7
palignr $8, %xmm4, %xmm5
movq 112(%esi), %xmm6
movq 72(%esi), %xmm4
movhpd 32(%esi), %xmm6
punpcklqdq %xmm0, %xmm4
paddq %xmm6, %xmm3
paddq %xmm4, %xmm2
paddq %xmm7, %xmm3
paddq %xmm5, %xmm2
movdqa %xmm6, 400(%esp)
movdqa %xmm0, 704(%esp)
movdqa %xmm1, %xmm0
movdqa 944(%esp), %xmm6
palignr $8, %xmm6, %xmm0
palignr $8, %xmm1, %xmm6
pxor %xmm3, %xmm0
pxor %xmm2, %xmm6
movdqa %xmm4, 192(%esp)
pshufd $177, %xmm0, %xmm0
pshufd $177, %xmm6, %xmm4
movdqa 912(%esp), %xmm6
movdqa 928(%esp), %xmm1
paddq %xmm0, %xmm6
paddq %xmm4, %xmm1
movdqa %xmm6, 912(%esp)
pxor %xmm6, %xmm7
movdqa 800(%esp), %xmm6
pxor %xmm1, %xmm5
movdqa %xmm1, 928(%esp)
movq 80(%esi), %xmm1
pshufb %xmm6, %xmm7
pshufb %xmm6, %xmm5
movhpd 64(%esi), %xmm1
movq 120(%esi), %xmm6
paddq %xmm1, %xmm3
movhpd 48(%esi), %xmm6
paddq %xmm7, %xmm3
paddq %xmm6, %xmm2
movdqa %xmm1, 368(%esp)
pxor %xmm3, %xmm0
movdqa 864(%esp), %xmm1
paddq %xmm5, %xmm2
pshufb %xmm1, %xmm0
pxor %xmm2, %xmm4
pshufb %xmm1, %xmm4
movdqa %xmm6, 224(%esp)
movdqa 912(%esp), %xmm6
paddq %xmm0, %xmm6
movdqa 928(%esp), %xmm1
pxor %xmm6, %xmm7
paddq %xmm4, %xmm1
movdqa %xmm6, 912(%esp)
movdqa %xmm7, %xmm6
pxor %xmm1, %xmm5
psrlq $63, %xmm6
psllq $1, %xmm7
pxor %xmm7, %xmm6
movdqa %xmm5, %xmm7
psrlq $63, %xmm7
psllq $1, %xmm5
pxor %xmm5, %xmm7
movdqa %xmm7, %xmm5
movdqa %xmm1, 928(%esp)
movq 8(%esi), %xmm1
palignr $8, %xmm6, %xmm5
palignr $8, %xmm7, %xmm6
movq 88(%esi), %xmm7
movhpd (%esi), %xmm1
movhpd 40(%esi), %xmm7
paddq %xmm1, %xmm3
paddq %xmm7, %xmm2
paddq %xmm5, %xmm3
paddq %xmm6, %xmm2
movdqa %xmm1, 240(%esp)
movdqa %xmm0, %xmm1
palignr $8, %xmm4, %xmm1
palignr $8, %xmm0, %xmm4
pxor %xmm3, %xmm1
pxor %xmm2, %xmm4
pshufd $177, %xmm1, %xmm1
movdqa 928(%esp), %xmm0
movdqa %xmm7, 256(%esp)
pshufd $177, %xmm4, %xmm4
movdqa 912(%esp), %xmm7
paddq %xmm1, %xmm0
paddq %xmm4, %xmm7
movdqa %xmm0, 928(%esp)
pxor %xmm0, %xmm5
movdqa 800(%esp), %xmm0
pxor %xmm7, %xmm6
movdqa %xmm7, 912(%esp)
movq 96(%esi), %xmm7
pshufb %xmm0, %xmm5
pshufb %xmm0, %xmm6
movhpd 16(%esi), %xmm7
movq 56(%esi), %xmm0
paddq %xmm7, %xmm3
movhpd 24(%esi), %xmm0
paddq %xmm5, %xmm3
paddq %xmm0, %xmm2
movdqa %xmm7, 272(%esp)
pxor %xmm3, %xmm1
movdqa 864(%esp), %xmm7
paddq %xmm6, %xmm2
pshufb %xmm7, %xmm1
pxor %xmm2, %xmm4
pshufb %xmm7, %xmm4
movdqa 928(%esp), %xmm7
paddq %xmm1, %xmm7
movdqa %xmm0, 480(%esp)
pxor %xmm7, %xmm5
movdqa 912(%esp), %xmm0
paddq %xmm4, %xmm0
movdqa %xmm7, 928(%esp)
movdqa %xmm5, %xmm7
pxor %xmm0, %xmm6
psrlq $63, %xmm7
psllq $1, %xmm5
pxor %xmm5, %xmm7
movdqa %xmm6, %xmm5
psrlq $63, %xmm5
psllq $1, %xmm6
pxor %xmm6, %xmm5
movdqa %xmm7, %xmm6
palignr $8, %xmm5, %xmm6
palignr $8, %xmm7, %xmm5
movq 88(%esi), %xmm7
movhpd 96(%esi), %xmm7
paddq %xmm7, %xmm3
movdqa %xmm6, 976(%esp)
movdqa %xmm4, %xmm7
paddq %xmm6, %xmm3
movq 40(%esi), %xmm6
movhpd 120(%esi), %xmm6
paddq %xmm6, %xmm2
paddq %xmm5, %xmm2
palignr $8, %xmm1, %xmm7
palignr $8, %xmm4, %xmm1
pxor %xmm3, %xmm7
pxor %xmm2, %xmm1
movdqa %xmm6, 496(%esp)
pshufd $177, %xmm7, %xmm6
pshufd $177, %xmm1, %xmm1
movdqa 928(%esp), %xmm4
paddq %xmm6, %xmm0
paddq %xmm1, %xmm4
movdqa 976(%esp), %xmm7
pxor %xmm4, %xmm5
movdqa %xmm0, 912(%esp)
pxor %xmm0, %xmm7
movdqa 800(%esp), %xmm0
movdqa %xmm4, 928(%esp)
movq 64(%esi), %xmm4
pshufb %xmm0, %xmm7
pshufb %xmm0, %xmm5
movhpd (%esi), %xmm4
movq 16(%esi), %xmm0
paddq %xmm4, %xmm3
movhpd 104(%esi), %xmm0
paddq %xmm7, %xmm3
paddq %xmm0, %xmm2
movdqa 864(%esp), %xmm4
pxor %xmm3, %xmm6
paddq %xmm5, %xmm2
pshufb %xmm4, %xmm6
pxor %xmm2, %xmm1
pshufb %xmm4, %xmm1
movdqa 912(%esp), %xmm0
paddq %xmm6, %xmm0
movdqa 928(%esp), %xmm4
pxor %xmm0, %xmm7
paddq %xmm1, %xmm4
movdqa %xmm0, 912(%esp)
movdqa %xmm7, %xmm0
pxor %xmm4, %xmm5
psrlq $63, %xmm0
psllq $1, %xmm7
pxor %xmm7, %xmm0
movdqa %xmm5, %xmm7
psrlq $63, %xmm7
psllq $1, %xmm5
pxor %xmm5, %xmm7
movdqa %xmm4, 928(%esp)
movdqa %xmm7, %xmm4
palignr $8, %xmm0, %xmm4
palignr $8, %xmm7, %xmm0
movq 80(%esi), %xmm5
movq 56(%esi), %xmm7
movhpd 24(%esi), %xmm5
movhpd 72(%esi), %xmm7
paddq %xmm5, %xmm3
paddq %xmm7, %xmm2
paddq %xmm4, %xmm3
paddq %xmm0, %xmm2
movdqa %xmm6, %xmm5
palignr $8, %xmm1, %xmm5
palignr $8, %xmm6, %xmm1
pxor %xmm3, %xmm5
pxor %xmm2, %xmm1
pshufd $177, %xmm5, %xmm5
pshufd $177, %xmm1, %xmm7
movdqa 928(%esp), %xmm1
movdqa 912(%esp), %xmm6
paddq %xmm5, %xmm1
paddq %xmm7, %xmm6
movdqa %xmm1, 928(%esp)
pxor %xmm1, %xmm4
movdqa 800(%esp), %xmm1
pxor %xmm6, %xmm0
movdqa %xmm6, 912(%esp)
movq 112(%esi), %xmm6
pshufb %xmm1, %xmm4
pshufb %xmm1, %xmm0
movhpd 48(%esi), %xmm6
movq 8(%esi), %xmm1
paddq %xmm6, %xmm3
movhpd 32(%esi), %xmm1
paddq %xmm4, %xmm3
paddq %xmm1, %xmm2
movdqa 864(%esp), %xmm6
pxor %xmm3, %xmm5
paddq %xmm0, %xmm2
paddq 480(%esp), %xmm3
pshufb %xmm6, %xmm5
pxor %xmm2, %xmm7
pshufb %xmm6, %xmm7
movdqa 928(%esp), %xmm1
paddq %xmm5, %xmm1
movdqa 912(%esp), %xmm6
pxor %xmm1, %xmm4
paddq %xmm7, %xmm6
movdqa %xmm1, 928(%esp)
movdqa %xmm4, %xmm1
pxor %xmm6, %xmm0
psrlq $63, %xmm1
psllq $1, %xmm4
pxor %xmm4, %xmm1
movdqa %xmm0, %xmm4
psrlq $63, %xmm4
psllq $1, %xmm0
pxor %xmm0, %xmm4
movdqa %xmm1, %xmm0
palignr $8, %xmm4, %xmm0
palignr $8, %xmm1, %xmm4
movq 104(%esi), %xmm1
movhpd 88(%esi), %xmm1
paddq %xmm1, %xmm2
paddq %xmm0, %xmm3
paddq %xmm4, %xmm2
movdqa %xmm0, 992(%esp)
movdqa %xmm7, %xmm0
palignr $8, %xmm5, %xmm0
palignr $8, %xmm7, %xmm5
pxor %xmm3, %xmm0
pxor %xmm2, %xmm5
pshufd $177, %xmm0, %xmm0
pshufd $177, %xmm5, %xmm1
movdqa 928(%esp), %xmm5
paddq %xmm0, %xmm6
paddq %xmm1, %xmm5
paddq 384(%esp), %xmm2
movdqa 992(%esp), %xmm7
pxor %xmm5, %xmm4
movdqa %xmm6, 912(%esp)
pxor %xmm6, %xmm7
movdqa 800(%esp), %xmm6
pshufb %xmm6, %xmm7
pshufb %xmm6, %xmm4
movq 72(%esi), %xmm6
movhpd 8(%esi), %xmm6
paddq %xmm6, %xmm3
paddq %xmm4, %xmm2
paddq %xmm7, %xmm3
movdqa 864(%esp), %xmm6
pxor %xmm3, %xmm0
pshufb %xmm6, %xmm0
pxor %xmm2, %xmm1
pshufb %xmm6, %xmm1
movdqa 912(%esp), %xmm6
paddq %xmm0, %xmm6
paddq %xmm1, %xmm5
pxor %xmm6, %xmm7
pxor %xmm5, %xmm4
movdqa %xmm5, 928(%esp)
movdqa %xmm7, %xmm5
psrlq $63, %xmm5
psllq $1, %xmm7
pxor %xmm7, %xmm5
movdqa %xmm4, %xmm7
psrlq $63, %xmm7
psllq $1, %xmm4
pxor %xmm4, %xmm7
movdqa %xmm7, %xmm4
movdqa %xmm6, 912(%esp)
palignr $8, %xmm5, %xmm4
palignr $8, %xmm7, %xmm5
movq 16(%esi), %xmm6
movq 32(%esi), %xmm7
movhpd 40(%esi), %xmm6
movhpd 120(%esi), %xmm7
paddq %xmm6, %xmm3
paddq %xmm7, %xmm2
paddq %xmm4, %xmm3
paddq %xmm5, %xmm2
movdqa %xmm0, %xmm6
palignr $8, %xmm1, %xmm6
palignr $8, %xmm0, %xmm1
pxor %xmm3, %xmm6
pxor %xmm2, %xmm1
movdqa %xmm7, 1008(%esp)
pshufd $177, %xmm6, %xmm6
pshufd $177, %xmm1, %xmm1
movdqa 928(%esp), %xmm7
movdqa 912(%esp), %xmm0
paddq %xmm6, %xmm7
paddq %xmm1, %xmm0
movdqa %xmm7, 928(%esp)
pxor %xmm7, %xmm4
movdqa 800(%esp), %xmm7
pxor %xmm0, %xmm5
movdqa %xmm0, 912(%esp)
pshufb %xmm7, %xmm4
pshufb %xmm7, %xmm5
movq 48(%esi), %xmm7
movq 80(%esi), %xmm0
punpcklqdq %xmm0, %xmm7
movdqa %xmm7, 512(%esp)
paddq %xmm7, %xmm3
movq (%esi), %xmm7
movhpd 64(%esi), %xmm7
paddq %xmm4, %xmm3
paddq %xmm7, %xmm2
movdqa %xmm7, 784(%esp)
pxor %xmm3, %xmm6
movdqa 864(%esp), %xmm7
paddq %xmm5, %xmm2
pshufb %xmm7, %xmm6
pxor %xmm2, %xmm1
pshufb %xmm7, %xmm1
movdqa 928(%esp), %xmm7
paddq %xmm6, %xmm7
movdqa %xmm6, 1024(%esp)
pxor %xmm7, %xmm4
movdqa 912(%esp), %xmm6
paddq %xmm1, %xmm6
movdqa %xmm7, 928(%esp)
movdqa %xmm4, %xmm7
pxor %xmm6, %xmm5
psrlq $63, %xmm7
psllq $1, %xmm4
pxor %xmm4, %xmm7
movdqa %xmm5, %xmm4
psrlq $63, %xmm4
psllq $1, %xmm5
pxor %xmm5, %xmm4
movdqa %xmm7, %xmm5
palignr $8, %xmm4, %xmm5
palignr $8, %xmm7, %xmm4
movq 72(%esi), %xmm7
movhpd 40(%esi), %xmm7
paddq %xmm7, %xmm3
movq 16(%esi), %xmm7
punpcklqdq %xmm0, %xmm7
movdqa %xmm1, %xmm0
paddq %xmm7, %xmm2
paddq %xmm5, %xmm3
paddq %xmm4, %xmm2
movdqa 1024(%esp), %xmm7
palignr $8, %xmm7, %xmm0
palignr $8, %xmm1, %xmm7
pxor %xmm3, %xmm0
pxor %xmm2, %xmm7
movdqa 928(%esp), %xmm1
pshufd $177, %xmm0, %xmm0
pshufd $177, %xmm7, %xmm7
paddq %xmm0, %xmm6
paddq %xmm7, %xmm1
paddq 1008(%esp), %xmm2
movdqa %xmm6, 912(%esp)
pxor %xmm6, %xmm5
movdqa 800(%esp), %xmm6
pxor %xmm1, %xmm4
pshufb %xmm6, %xmm5
pshufb %xmm6, %xmm4
movq (%esi), %xmm6
movhpd 56(%esi), %xmm6
paddq %xmm6, %xmm3
paddq %xmm4, %xmm2
paddq %xmm5, %xmm3
movdqa 864(%esp), %xmm6
pxor %xmm3, %xmm0
pshufb %xmm6, %xmm0
pxor %xmm2, %xmm7
pshufb %xmm6, %xmm7
movdqa 912(%esp), %xmm6
paddq %xmm0, %xmm6
paddq %xmm7, %xmm1
pxor %xmm6, %xmm5
pxor %xmm1, %xmm4
movdqa %xmm6, 912(%esp)
movdqa %xmm5, %xmm6
psrlq $63, %xmm6
psllq $1, %xmm5
pxor %xmm5, %xmm6
movdqa %xmm4, %xmm5
psrlq $63, %xmm5
psllq $1, %xmm4
pxor %xmm4, %xmm5
movdqa %xmm5, %xmm4
palignr $8, %xmm6, %xmm4
palignr $8, %xmm5, %xmm6
movq 112(%esi), %xmm5
movhpd 88(%esi), %xmm5
paddq %xmm5, %xmm3
movq 48(%esi), %xmm5
movhpd 24(%esi), %xmm5
paddq %xmm5, %xmm2
paddq %xmm4, %xmm3
paddq %xmm6, %xmm2
movdqa %xmm0, %xmm5
palignr $8, %xmm7, %xmm5
pxor %xmm3, %xmm5
pshufd $177, %xmm5, %xmm5
palignr $8, %xmm0, %xmm7
paddq %xmm5, %xmm1
pxor %xmm2, %xmm7
pxor %xmm1, %xmm4
pshufd $177, %xmm7, %xmm7
movdqa 912(%esp), %xmm0
pshufb 800(%esp), %xmm4
paddq %xmm7, %xmm0
movdqa %xmm7, 816(%esp)
blake2b_blocks_ssse3_L32:
movdqa 688(%esp), %xmm7
pxor %xmm0, %xmm6
movdqa %xmm0, 912(%esp)
movhpd 656(%esp), %xmm7
movdqa 640(%esp), %xmm0
pshufb 800(%esp), %xmm6
paddq %xmm7, %xmm3
movhpd 704(%esp), %xmm0
paddq %xmm0, %xmm2
paddq %xmm4, %xmm3
paddq %xmm6, %xmm2
movdqa 864(%esp), %xmm7
pxor %xmm3, %xmm5
movdqa 816(%esp), %xmm0
pshufb %xmm7, %xmm5
pxor %xmm2, %xmm0
pshufb %xmm7, %xmm0
paddq %xmm5, %xmm1
paddq 784(%esp), %xmm2
movdqa 912(%esp), %xmm7
pxor %xmm1, %xmm4
paddq %xmm0, %xmm7
movdqa %xmm7, 912(%esp)
pxor %xmm7, %xmm6
movdqa %xmm4, %xmm7
psllq $1, %xmm4
psrlq $63, %xmm7
movdqa %xmm1, 928(%esp)
movdqa %xmm6, %xmm1
pxor %xmm4, %xmm7
psrlq $63, %xmm1
movdqa 720(%esp), %xmm4
psllq $1, %xmm6
movhpd 672(%esp), %xmm4
pxor %xmm6, %xmm1
movdqa %xmm7, %xmm6
paddq %xmm4, %xmm3
palignr $8, %xmm1, %xmm6
palignr $8, %xmm7, %xmm1
movdqa %xmm0, %xmm7
paddq %xmm6, %xmm3
paddq %xmm1, %xmm2
palignr $8, %xmm5, %xmm7
palignr $8, %xmm0, %xmm5
pxor %xmm3, %xmm7
pxor %xmm2, %xmm5
pshufd $177, %xmm7, %xmm4
movdqa 912(%esp), %xmm7
movdqa 928(%esp), %xmm0
pshufd $177, %xmm5, %xmm5
paddq %xmm4, %xmm7
paddq %xmm5, %xmm0
movdqa %xmm7, 912(%esp)
pxor %xmm7, %xmm6
movdqa 800(%esp), %xmm7
pxor %xmm0, %xmm1
movdqa %xmm0, 928(%esp)
movdqa 656(%esp), %xmm0
pshufb %xmm7, %xmm6
pshufb %xmm7, %xmm1
movhpd 608(%esp), %xmm0
movdqa 752(%esp), %xmm7
movhpd 592(%esp), %xmm7
paddq %xmm0, %xmm3
paddq %xmm7, %xmm2
paddq %xmm6, %xmm3
paddq %xmm1, %xmm2
movdqa 864(%esp), %xmm0
pxor %xmm3, %xmm4
pshufb %xmm0, %xmm4
pxor %xmm2, %xmm5
pshufb %xmm0, %xmm5
movdqa 912(%esp), %xmm7
movdqa 928(%esp), %xmm0
paddq %xmm4, %xmm7
paddq %xmm5, %xmm0
pxor %xmm7, %xmm6
pxor %xmm0, %xmm1
movdqa %xmm0, 928(%esp)
movdqa %xmm6, %xmm0
psrlq $63, %xmm0
psllq $1, %xmm6
pxor %xmm6, %xmm0
movdqa %xmm1, %xmm6
psrlq $63, %xmm6
psllq $1, %xmm1
pxor %xmm1, %xmm6
movdqa %xmm7, 912(%esp)
movdqa %xmm6, %xmm7
palignr $8, %xmm0, %xmm7
palignr $8, %xmm6, %xmm0
movdqa 528(%esp), %xmm1
movdqa 768(%esp), %xmm6
movhpd 624(%esp), %xmm1
movhpd 688(%esp), %xmm6
paddq %xmm1, %xmm3
paddq %xmm6, %xmm2
paddq %xmm7, %xmm3
paddq %xmm0, %xmm2
movdqa %xmm4, %xmm1
palignr $8, %xmm5, %xmm1
palignr $8, %xmm4, %xmm5
pxor %xmm3, %xmm1
pxor %xmm2, %xmm5
movdqa 928(%esp), %xmm4
pshufd $177, %xmm1, %xmm6
pshufd $177, %xmm5, %xmm1
movdqa 912(%esp), %xmm5
paddq %xmm6, %xmm4
paddq %xmm1, %xmm5
movdqa %xmm4, 928(%esp)
pxor %xmm4, %xmm7
movdqa 800(%esp), %xmm4
pxor %xmm5, %xmm0
pshufb %xmm4, %xmm7
pshufb %xmm4, %xmm0
movdqa 576(%esp), %xmm4
movdqa %xmm5, 912(%esp)
movdqa 704(%esp), %xmm5
movhpd 736(%esp), %xmm4
movhpd 544(%esp), %xmm5
paddq %xmm4, %xmm2
paddq %xmm5, %xmm3
paddq %xmm0, %xmm2
paddq %xmm7, %xmm3
movdqa 864(%esp), %xmm5
pxor %xmm2, %xmm1
pxor %xmm3, %xmm6
pshufb %xmm5, %xmm1
paddq 400(%esp), %xmm2
pshufb %xmm5, %xmm6
movdqa 912(%esp), %xmm5
movdqa 928(%esp), %xmm4
paddq %xmm1, %xmm5
paddq %xmm6, %xmm4
pxor %xmm5, %xmm0
pxor %xmm4, %xmm7
movdqa %xmm5, 912(%esp)
movdqa %xmm0, %xmm5
movdqa %xmm4, 928(%esp)
movdqa %xmm7, %xmm4
psrlq $63, %xmm5
psllq $1, %xmm0
psrlq $63, %xmm4
psllq $1, %xmm7
pxor %xmm0, %xmm5
pxor %xmm7, %xmm4
movdqa 656(%esp), %xmm0
movdqa %xmm4, %xmm7
movhpd 688(%esp), %xmm0
paddq %xmm0, %xmm3
palignr $8, %xmm5, %xmm7
palignr $8, %xmm4, %xmm5
movdqa %xmm1, %xmm4
paddq %xmm7, %xmm3
paddq %xmm5, %xmm2
palignr $8, %xmm6, %xmm4
pxor %xmm3, %xmm4
pshufd $177, %xmm4, %xmm0
movdqa 912(%esp), %xmm4
paddq %xmm0, %xmm4
paddq 496(%esp), %xmm3
palignr $8, %xmm1, %xmm6
pxor %xmm4, %xmm7
movdqa %xmm4, 912(%esp)
pxor %xmm2, %xmm6
movdqa 800(%esp), %xmm4
pshufd $177, %xmm6, %xmm1
movdqa 928(%esp), %xmm6
pshufb %xmm4, %xmm7
paddq %xmm1, %xmm6
paddq %xmm7, %xmm3
pxor %xmm6, %xmm5
pxor %xmm3, %xmm0
movdqa %xmm7, 1040(%esp)
movdqa 704(%esp), %xmm7
pshufb %xmm4, %xmm5
movhpd 608(%esp), %xmm7
paddq %xmm7, %xmm2
paddq %xmm5, %xmm2
movdqa 864(%esp), %xmm4
pxor %xmm2, %xmm1
pshufb %xmm4, %xmm0
pshufb %xmm4, %xmm1
movdqa 912(%esp), %xmm4
paddq %xmm0, %xmm4
paddq %xmm1, %xmm6
movdqa 1040(%esp), %xmm7
pxor %xmm6, %xmm5
pxor %xmm4, %xmm7
movdqa %xmm6, 928(%esp)
movdqa %xmm7, %xmm6
psrlq $63, %xmm6
psllq $1, %xmm7
pxor %xmm7, %xmm6
movdqa %xmm5, %xmm7
psrlq $63, %xmm7
psllq $1, %xmm5
pxor %xmm5, %xmm7
movdqa %xmm7, %xmm5
movdqa %xmm4, 912(%esp)
palignr $8, %xmm6, %xmm5
palignr $8, %xmm7, %xmm6
movdqa 560(%esp), %xmm4
movdqa 736(%esp), %xmm7
movhpd 672(%esp), %xmm4
movhpd 640(%esp), %xmm7
paddq %xmm4, %xmm3
paddq %xmm7, %xmm2
paddq %xmm5, %xmm3
paddq %xmm6, %xmm2
movdqa %xmm0, %xmm4
palignr $8, %xmm1, %xmm4
palignr $8, %xmm0, %xmm1
pxor %xmm3, %xmm4
pxor %xmm2, %xmm1
pshufd $177, %xmm4, %xmm4
pshufd $177, %xmm1, %xmm7
movdqa 928(%esp), %xmm1
paddq %xmm4, %xmm1
paddq 480(%esp), %xmm3
movdqa %xmm1, 928(%esp)
pxor %xmm1, %xmm5
movdqa 800(%esp), %xmm1
movdqa 912(%esp), %xmm0
pshufb %xmm1, %xmm5
paddq %xmm7, %xmm0
paddq %xmm5, %xmm3
pxor %xmm0, %xmm6
pxor %xmm3, %xmm4
movdqa %xmm5, 1056(%esp)
movdqa 720(%esp), %xmm5
pshufb %xmm1, %xmm6
movhpd 752(%esp), %xmm5
paddq %xmm5, %xmm2
paddq %xmm6, %xmm2
movdqa 864(%esp), %xmm5
pxor %xmm2, %xmm7
pshufb %xmm5, %xmm4
pshufb %xmm5, %xmm7
movdqa 928(%esp), %xmm5
paddq %xmm4, %xmm5
paddq %xmm7, %xmm0
movdqa 1056(%esp), %xmm1
pxor %xmm0, %xmm6
pxor %xmm5, %xmm1
movdqa %xmm0, 912(%esp)
movdqa %xmm1, %xmm0
psrlq $63, %xmm0
psllq $1, %xmm1
pxor %xmm1, %xmm0
movdqa %xmm6, %xmm1
psrlq $63, %xmm1
psllq $1, %xmm6
movdqa %xmm5, 928(%esp)
pxor %xmm6, %xmm1
movdqa %xmm0, %xmm5
movdqa 704(%esp), %xmm6
palignr $8, %xmm1, %xmm5
palignr $8, %xmm0, %xmm1
movdqa 656(%esp), %xmm0
movhpd 624(%esp), %xmm6
movhpd 592(%esp), %xmm0
paddq %xmm6, %xmm3
paddq %xmm0, %xmm2
paddq %xmm5, %xmm3
paddq %xmm1, %xmm2
movdqa %xmm7, %xmm6
palignr $8, %xmm4, %xmm6
palignr $8, %xmm7, %xmm4
pxor %xmm3, %xmm6
pxor %xmm2, %xmm4
movdqa 912(%esp), %xmm7
pshufd $177, %xmm6, %xmm0
pshufd $177, %xmm4, %xmm6
movdqa 928(%esp), %xmm4
paddq %xmm0, %xmm7
paddq %xmm6, %xmm4
movdqa %xmm7, 912(%esp)
pxor %xmm7, %xmm5
movdqa 800(%esp), %xmm7
pxor %xmm4, %xmm1
movdqa %xmm4, 928(%esp)
movdqa 752(%esp), %xmm4
pshufb %xmm7, %xmm5
pshufb %xmm7, %xmm1
movhpd 576(%esp), %xmm4
movdqa 688(%esp), %xmm7
paddq %xmm4, %xmm3
movhpd 736(%esp), %xmm7
paddq %xmm5, %xmm3
paddq %xmm7, %xmm2
movdqa %xmm4, 1072(%esp)
pxor %xmm3, %xmm0
movdqa 864(%esp), %xmm4
paddq %xmm1, %xmm2
paddq 496(%esp), %xmm3
pshufb %xmm4, %xmm0
pxor %xmm2, %xmm6
pshufb %xmm4, %xmm6
movdqa 912(%esp), %xmm7
paddq %xmm0, %xmm7
movdqa 928(%esp), %xmm4
pxor %xmm7, %xmm5
paddq %xmm6, %xmm4
movdqa %xmm7, 912(%esp)
movdqa %xmm5, %xmm7
pxor %xmm4, %xmm1
psrlq $63, %xmm7
psllq $1, %xmm5
pxor %xmm5, %xmm7
movdqa %xmm1, %xmm5
psrlq $63, %xmm5
psllq $1, %xmm1
pxor %xmm1, %xmm5
movdqa %xmm5, %xmm1
palignr $8, %xmm7, %xmm1
palignr $8, %xmm5, %xmm7
movdqa 640(%esp), %xmm5
movhpd 720(%esp), %xmm5
paddq %xmm5, %xmm2
paddq %xmm1, %xmm3
paddq %xmm7, %xmm2
movdqa %xmm1, 1088(%esp)
movdqa %xmm0, %xmm1
palignr $8, %xmm6, %xmm1
palignr $8, %xmm0, %xmm6
pxor %xmm3, %xmm1
pxor %xmm2, %xmm6
pshufd $177, %xmm1, %xmm1
pshufd $177, %xmm6, %xmm5
movdqa 912(%esp), %xmm0
paddq %xmm1, %xmm4
paddq %xmm5, %xmm0
paddq 512(%esp), %xmm2
movdqa 1088(%esp), %xmm6
pxor %xmm0, %xmm7
movdqa %xmm4, 928(%esp)
pxor %xmm4, %xmm6
movdqa 800(%esp), %xmm4
movdqa %xmm0, 912(%esp)
movdqa 560(%esp), %xmm0
pshufb %xmm4, %xmm6
pshufb %xmm4, %xmm7
movhpd 528(%esp), %xmm0
paddq %xmm0, %xmm3
paddq %xmm7, %xmm2
paddq %xmm6, %xmm3
movdqa 864(%esp), %xmm0
pxor %xmm3, %xmm1
pshufb %xmm0, %xmm1
pxor %xmm2, %xmm5
pshufb %xmm0, %xmm5
movdqa 928(%esp), %xmm0
paddq %xmm1, %xmm0
movdqa 912(%esp), %xmm4
pxor %xmm0, %xmm6
paddq %xmm5, %xmm4
movdqa %xmm0, 928(%esp)
movdqa %xmm6, %xmm0
pxor %xmm4, %xmm7
psrlq $63, %xmm0
psllq $1, %xmm6
pxor %xmm6, %xmm0
movdqa %xmm7, %xmm6
psrlq $63, %xmm6
psllq $1, %xmm7
pxor %xmm7, %xmm6
movdqa %xmm0, %xmm7
palignr $8, %xmm6, %xmm7
palignr $8, %xmm0, %xmm6
movdqa 672(%esp), %xmm0
movhpd 576(%esp), %xmm0
paddq %xmm0, %xmm3
movdqa %xmm7, 1104(%esp)
movdqa %xmm5, %xmm0
paddq %xmm7, %xmm3
movdqa 752(%esp), %xmm7
movhpd 560(%esp), %xmm7
paddq %xmm7, %xmm2
paddq %xmm6, %xmm2
palignr $8, %xmm1, %xmm0
palignr $8, %xmm5, %xmm1
pxor %xmm3, %xmm0
pxor %xmm2, %xmm1
movdqa 928(%esp), %xmm5
pshufd $177, %xmm0, %xmm7
pshufd $177, %xmm1, %xmm0
paddq %xmm7, %xmm4
paddq %xmm0, %xmm5
movdqa 1104(%esp), %xmm1
pxor %xmm5, %xmm6
movdqa %xmm4, 912(%esp)
pxor %xmm4, %xmm1
movdqa 800(%esp), %xmm4
pshufb %xmm4, %xmm1
pshufb %xmm4, %xmm6
movdqa 768(%esp), %xmm4
movhpd 736(%esp), %xmm4
movdqa %xmm4, 768(%esp)
paddq %xmm4, %xmm3
movdqa 592(%esp), %xmm4
movhpd 640(%esp), %xmm4
paddq %xmm1, %xmm3
paddq %xmm4, %xmm2
movdqa 864(%esp), %xmm4
pxor %xmm3, %xmm7
paddq %xmm6, %xmm2
pshufb %xmm4, %xmm7
pxor %xmm2, %xmm0
pshufb %xmm4, %xmm0
movdqa 912(%esp), %xmm4
paddq %xmm7, %xmm4
paddq %xmm0, %xmm5
pxor %xmm4, %xmm1
pxor %xmm5, %xmm6
movdqa %xmm4, 912(%esp)
movdqa %xmm1, %xmm4
psrlq $63, %xmm4
psllq $1, %xmm1
pxor %xmm1, %xmm4
movdqa %xmm6, %xmm1
psrlq $63, %xmm1
psllq $1, %xmm6
pxor %xmm6, %xmm1
movdqa %xmm5, 928(%esp)
movdqa %xmm1, %xmm5
movdqa 656(%esp), %xmm6
palignr $8, %xmm4, %xmm5
palignr $8, %xmm1, %xmm4
movdqa 688(%esp), %xmm1
movhpd 704(%esp), %xmm6
movhpd 608(%esp), %xmm1
paddq %xmm6, %xmm3
paddq %xmm1, %xmm2
paddq %xmm5, %xmm3
paddq %xmm4, %xmm2
movdqa %xmm7, %xmm6
palignr $8, %xmm0, %xmm6
palignr $8, %xmm7, %xmm0
pxor %xmm3, %xmm6
pxor %xmm2, %xmm0
movdqa 928(%esp), %xmm7
pshufd $177, %xmm6, %xmm1
movdqa 912(%esp), %xmm6
pshufd $177, %xmm0, %xmm0
paddq %xmm1, %xmm7
paddq %xmm0, %xmm6
movdqa %xmm7, 928(%esp)
pxor %xmm7, %xmm5
movdqa 800(%esp), %xmm7
pxor %xmm6, %xmm4
movdqa %xmm6, 912(%esp)
movdqa 720(%esp), %xmm6
pshufb %xmm7, %xmm5
pshufb %xmm7, %xmm4
movhpd 624(%esp), %xmm6
movdqa 528(%esp), %xmm7
paddq %xmm6, %xmm3
movhpd 544(%esp), %xmm7
paddq %xmm5, %xmm3
paddq %xmm7, %xmm2
movdqa 864(%esp), %xmm6
pxor %xmm3, %xmm1
paddq %xmm4, %xmm2
paddq 368(%esp), %xmm3
pshufb %xmm6, %xmm1
pxor %xmm2, %xmm0
pshufb %xmm6, %xmm0
movdqa 928(%esp), %xmm7
paddq %xmm1, %xmm7
movdqa 912(%esp), %xmm6
pxor %xmm7, %xmm5
paddq %xmm0, %xmm6
movdqa %xmm7, 928(%esp)
movdqa %xmm5, %xmm7
pxor %xmm6, %xmm4
psrlq $63, %xmm7
psllq $1, %xmm5
pxor %xmm5, %xmm7
movdqa %xmm4, %xmm5
psrlq $63, %xmm5
psllq $1, %xmm4
pxor %xmm4, %xmm5
movdqa %xmm7, %xmm4
palignr $8, %xmm5, %xmm4
palignr $8, %xmm7, %xmm5
movdqa 624(%esp), %xmm7
movhpd 688(%esp), %xmm7
paddq %xmm7, %xmm2
paddq %xmm4, %xmm3
paddq %xmm5, %xmm2
movdqa %xmm0, %xmm7
palignr $8, %xmm1, %xmm7
palignr $8, %xmm0, %xmm1
pxor %xmm3, %xmm7
pxor %xmm2, %xmm1
pshufd $177, %xmm7, %xmm7
pshufd $177, %xmm1, %xmm0
movdqa 928(%esp), %xmm1
paddq %xmm7, %xmm6
paddq %xmm0, %xmm1
movdqa %xmm6, 912(%esp)
pxor %xmm6, %xmm4
movdqa 800(%esp), %xmm6
pxor %xmm1, %xmm5
pshufb %xmm6, %xmm4
pshufb %xmm6, %xmm5
movdqa 720(%esp), %xmm6
movhpd 528(%esp), %xmm6
paddq %xmm6, %xmm3
movdqa 672(%esp), %xmm6
movhpd 544(%esp), %xmm6
paddq %xmm4, %xmm3
paddq %xmm6, %xmm2
movdqa 864(%esp), %xmm6
pxor %xmm3, %xmm7
paddq %xmm5, %xmm2
paddq 768(%esp), %xmm3
pshufb %xmm6, %xmm7
pxor %xmm2, %xmm0
pshufb %xmm6, %xmm0
movdqa 912(%esp), %xmm6
paddq %xmm7, %xmm6
paddq %xmm0, %xmm1
pxor %xmm6, %xmm4
pxor %xmm1, %xmm5
movdqa %xmm6, 912(%esp)
movdqa %xmm4, %xmm6
psrlq $63, %xmm6
psllq $1, %xmm4
pxor %xmm4, %xmm6
movdqa %xmm5, %xmm4
psrlq $63, %xmm4
psllq $1, %xmm5
pxor %xmm5, %xmm4
movdqa %xmm4, %xmm5
palignr $8, %xmm6, %xmm5
palignr $8, %xmm4, %xmm6
movdqa 592(%esp), %xmm4
movhpd 704(%esp), %xmm4
paddq %xmm4, %xmm2
paddq %xmm5, %xmm3
paddq %xmm6, %xmm2
movdqa %xmm7, %xmm4
palignr $8, %xmm0, %xmm4
pxor %xmm3, %xmm4
palignr $8, %xmm7, %xmm0
pshufd $177, %xmm4, %xmm4
pxor %xmm2, %xmm0
paddq %xmm4, %xmm1
paddq 1072(%esp), %xmm3
pshufd $177, %xmm0, %xmm7
pxor %xmm1, %xmm5
movdqa 912(%esp), %xmm0
paddq %xmm7, %xmm0
movdqa %xmm7, 832(%esp)
pxor %xmm0, %xmm6
movdqa 800(%esp), %xmm7
pshufb %xmm7, %xmm5
pshufb %xmm7, %xmm6
paddq %xmm5, %xmm3
movdqa 656(%esp), %xmm7
pxor %xmm3, %xmm4
movhpd 560(%esp), %xmm7
paddq %xmm7, %xmm2
paddq %xmm6, %xmm2
blake2b_blocks_ssse3_L31:
movdqa %xmm3, 1120(%esp)
movdqa 864(%esp), %xmm3
movdqa 832(%esp), %xmm7
pshufb %xmm3, %xmm4
pxor %xmm2, %xmm7
pshufb %xmm3, %xmm7
paddq %xmm4, %xmm1
paddq %xmm7, %xmm0
paddq 336(%esp), %xmm2
pxor %xmm1, %xmm5
pxor %xmm0, %xmm6
movdqa %xmm5, %xmm3
psllq $1, %xmm5
psrlq $63, %xmm3
pxor %xmm5, %xmm3
movdqa %xmm6, %xmm5
psrlq $63, %xmm5
psllq $1, %xmm6
pxor %xmm6, %xmm5
movdqa %xmm3, %xmm6
palignr $8, %xmm5, %xmm6
palignr $8, %xmm3, %xmm5
movdqa 1120(%esp), %xmm3
paddq 352(%esp), %xmm3
paddq %xmm5, %xmm2
paddq %xmm6, %xmm3
movdqa %xmm5, 1136(%esp)
movdqa %xmm7, %xmm5
palignr $8, %xmm4, %xmm5
pxor %xmm3, %xmm5
pshufd $177, %xmm5, %xmm5
palignr $8, %xmm7, %xmm4
paddq %xmm5, %xmm0
paddq 288(%esp), %xmm3
pxor %xmm2, %xmm4
pxor %xmm0, %xmm6
pshufd $177, %xmm4, %xmm4
movdqa 800(%esp), %xmm7
paddq %xmm4, %xmm1
paddq 208(%esp), %xmm2
pshufb %xmm7, %xmm6
movdqa %xmm0, 912(%esp)
movdqa 1136(%esp), %xmm0
pxor %xmm1, %xmm0
pshufb %xmm7, %xmm0
paddq %xmm6, %xmm3
paddq %xmm0, %xmm2
movdqa 864(%esp), %xmm7
pxor %xmm3, %xmm5
pshufb %xmm7, %xmm5
paddq 176(%esp), %xmm3
pxor %xmm2, %xmm4
pshufb %xmm7, %xmm4
paddq 384(%esp), %xmm2
paddq %xmm4, %xmm1
movdqa 912(%esp), %xmm7
pxor %xmm1, %xmm0
paddq %xmm5, %xmm7
pxor %xmm7, %xmm6
movdqa %xmm7, 912(%esp)
movdqa %xmm6, %xmm7
psrlq $63, %xmm7
psllq $1, %xmm6
pxor %xmm6, %xmm7
movdqa %xmm0, %xmm6
psrlq $63, %xmm6
psllq $1, %xmm0
pxor %xmm0, %xmm6
movdqa %xmm6, %xmm0
palignr $8, %xmm7, %xmm0
palignr $8, %xmm6, %xmm7
movdqa %xmm5, %xmm6
paddq %xmm0, %xmm3
paddq %xmm7, %xmm2
palignr $8, %xmm4, %xmm6
pxor %xmm3, %xmm6
pshufd $177, %xmm6, %xmm6
palignr $8, %xmm5, %xmm4
paddq %xmm6, %xmm1
paddq 304(%esp), %xmm3
pxor %xmm2, %xmm4
pxor %xmm1, %xmm0
pshufd $177, %xmm4, %xmm5
movdqa 912(%esp), %xmm4
movdqa %xmm1, 928(%esp)
movdqa 800(%esp), %xmm1
paddq %xmm5, %xmm4
paddq 320(%esp), %xmm2
pshufb %xmm1, %xmm0
pxor %xmm4, %xmm7
pshufb %xmm1, %xmm7
paddq %xmm0, %xmm3
paddq %xmm7, %xmm2
movdqa 864(%esp), %xmm1
pxor %xmm3, %xmm6
pshufb %xmm1, %xmm6
paddq 400(%esp), %xmm3
pxor %xmm2, %xmm5
pshufb %xmm1, %xmm5
paddq 192(%esp), %xmm2
paddq %xmm5, %xmm4
movdqa 928(%esp), %xmm1
pxor %xmm4, %xmm7
paddq %xmm6, %xmm1
pxor %xmm1, %xmm0
movdqa %xmm1, 928(%esp)
movdqa %xmm0, %xmm1
psrlq $63, %xmm1
psllq $1, %xmm0
pxor %xmm0, %xmm1
movdqa %xmm7, %xmm0
psrlq $63, %xmm0
psllq $1, %xmm7
pxor %xmm7, %xmm0
movdqa %xmm1, %xmm7
palignr $8, %xmm0, %xmm7
palignr $8, %xmm1, %xmm0
movdqa %xmm5, %xmm1
paddq %xmm7, %xmm3
paddq %xmm0, %xmm2
palignr $8, %xmm6, %xmm1
pxor %xmm3, %xmm1
pshufd $177, %xmm1, %xmm1
palignr $8, %xmm5, %xmm6
paddq %xmm1, %xmm4
paddq 368(%esp), %xmm3
pxor %xmm2, %xmm6
pxor %xmm4, %xmm7
pshufd $177, %xmm6, %xmm5
movdqa 928(%esp), %xmm6
movdqa %xmm4, 912(%esp)
movdqa 800(%esp), %xmm4
paddq %xmm5, %xmm6
paddq 224(%esp), %xmm2
pshufb %xmm4, %xmm7
pxor %xmm6, %xmm0
pshufb %xmm4, %xmm0
paddq %xmm7, %xmm3
paddq %xmm0, %xmm2
movdqa 864(%esp), %xmm4
pxor %xmm3, %xmm1
pshufb %xmm4, %xmm1
paddq 240(%esp), %xmm3
pxor %xmm2, %xmm5
pshufb %xmm4, %xmm5
paddq 256(%esp), %xmm2
paddq %xmm5, %xmm6
movdqa 912(%esp), %xmm4
pxor %xmm6, %xmm0
paddq %xmm1, %xmm4
pxor %xmm4, %xmm7
movdqa %xmm4, 912(%esp)
movdqa %xmm7, %xmm4
psrlq $63, %xmm4
psllq $1, %xmm7
pxor %xmm7, %xmm4
movdqa %xmm0, %xmm7
psrlq $63, %xmm7
psllq $1, %xmm0
pxor %xmm0, %xmm7
movdqa %xmm7, %xmm0
palignr $8, %xmm4, %xmm0
palignr $8, %xmm7, %xmm4
movdqa %xmm1, %xmm7
paddq %xmm0, %xmm3
paddq %xmm4, %xmm2
palignr $8, %xmm5, %xmm7
pxor %xmm3, %xmm7
pshufd $177, %xmm7, %xmm7
palignr $8, %xmm1, %xmm5
paddq %xmm7, %xmm6
paddq 272(%esp), %xmm3
pxor %xmm2, %xmm5
pxor %xmm6, %xmm0
pshufd $177, %xmm5, %xmm1
movdqa 912(%esp), %xmm5
movdqa %xmm6, 928(%esp)
movdqa 800(%esp), %xmm6
paddq %xmm1, %xmm5
paddq 480(%esp), %xmm2
pshufb %xmm6, %xmm0
pxor %xmm5, %xmm4
pshufb %xmm6, %xmm4
paddq %xmm0, %xmm3
paddq %xmm4, %xmm2
movdqa 864(%esp), %xmm6
pxor %xmm3, %xmm7
pshufb %xmm6, %xmm7
pxor %xmm2, %xmm1
pshufb %xmm6, %xmm1
movdqa 928(%esp), %xmm6
paddq %xmm7, %xmm6
paddq %xmm1, %xmm5
pxor %xmm6, %xmm0
pxor %xmm5, %xmm4
movdqa %xmm7, 1152(%esp)
movdqa %xmm0, %xmm7
psrlq $63, %xmm7
psllq $1, %xmm0
pxor %xmm0, %xmm7
movdqa %xmm4, %xmm0
pxor %xmm3, %xmm5
psrlq $63, %xmm0
movdqa 416(%esp), %xmm3
psllq $1, %xmm4
pxor %xmm2, %xmm6
pxor %xmm5, %xmm3
movdqa 432(%esp), %xmm2
pxor %xmm4, %xmm0
movdqa %xmm3, 416(%esp)
pxor %xmm6, %xmm2
movdqa 1152(%esp), %xmm6
movdqa %xmm1, %xmm4
movdqa %xmm7, %xmm3
palignr $8, %xmm6, %xmm4
palignr $8, %xmm0, %xmm3
palignr $8, %xmm1, %xmm6
pxor %xmm3, %xmm4
palignr $8, %xmm7, %xmm0
movdqa 464(%esp), %xmm5
pxor %xmm0, %xmm6
movdqa 448(%esp), %xmm0
pxor %xmm4, %xmm5
pxor %xmm6, %xmm0
movdqa %xmm2, 432(%esp)
movdqa %xmm5, 464(%esp)
movdqa %xmm0, 448(%esp)
cmpl $128, %ecx
ja blake2b_blocks_ssse3_L27
blake2b_blocks_ssse3_L28:
movl 8(%ebp), %eax
movdqa 432(%esp), %xmm0
movdqa 464(%esp), %xmm2
movdqa %xmm0, 16(%eax)
movdqa 416(%esp), %xmm1
movdqa 448(%esp), %xmm0
movdqa %xmm1, (%eax)
movdqa %xmm2, 32(%eax)
movdqa %xmm0, 48(%eax)
addl $1204, %esp
popl %ebx
popl %edi
popl %esi
movl %ebp, %esp
popl %ebp
ret

.align 16,0x90
.globl blake2b_blocks_sse2
.globl _blake2b_blocks_sse2
blake2b_blocks_sse2:
_blake2b_blocks_sse2:
pushl %ebp
movl %esp, %ebp
andl $-64, %esp
pushl %esi
pushl %edi
pushl %ebx
subl $1204, %esp
movl 8(%ebp), %eax
call blake2b_blocks_sse2_LL2
blake2b_blocks_sse2_LL2:
popl %esi
leal _GLOBAL_OFFSET_TABLE_+1(%esi), %esi
movl 80(%eax), %edx
movl 12(%ebp), %ebx
movdqa 48+blake2b_constants@GOTOFF(%esi), %xmm0
movl 16(%ebp), %ecx
pxor 80(%eax), %xmm0
orl 84(%eax), %edx
jne blake2b_blocks_sse2_L2
blake2b_blocks_sse2_L32:
cmpl $128, %ecx
jmp blake2b_blocks_sse2_L21
blake2b_blocks_sse2_L2:
cmpl $128, %ecx
je blake2b_blocks_sse2_L21
blake2b_blocks_sse2_L3:
testb $64, %cl
lea (%esp), %eax
je blake2b_blocks_sse2_L5
blake2b_blocks_sse2_L4:
movdqu (%ebx), %xmm1
movdqa %xmm1, (%esp)
lea 64(%esp), %eax
movdqu 16(%ebx), %xmm2
movdqa %xmm2, 16(%esp)
pxor %xmm1, %xmm1
movdqu 32(%ebx), %xmm3
movdqa %xmm3, 32(%esp)
movdqu 48(%ebx), %xmm4
movdqa %xmm4, 48(%esp)
addl $64, %ebx
jmp blake2b_blocks_sse2_L6
blake2b_blocks_sse2_L5:
pxor %xmm1, %xmm1
movdqa %xmm1, 64(%esp)
movdqa %xmm1, 80(%esp)
movdqa %xmm1, 96(%esp)
movdqa %xmm1, 112(%esp)
blake2b_blocks_sse2_L6:
movdqa %xmm1, (%eax)
testb $32, %cl
movdqa %xmm1, 16(%eax)
movdqa %xmm1, 32(%eax)
movdqa %xmm1, 48(%eax)
je blake2b_blocks_sse2_L8
blake2b_blocks_sse2_L7:
movdqu (%ebx), %xmm1
movdqa %xmm1, (%eax)
movdqu 16(%ebx), %xmm2
movdqa %xmm2, 16(%eax)
addl $32, %ebx
addl $32, %eax
blake2b_blocks_sse2_L8:
testb $16, %cl
je blake2b_blocks_sse2_L10
blake2b_blocks_sse2_L9:
movdqu (%ebx), %xmm1
movdqa %xmm1, (%eax)
addl $16, %ebx
addl $16, %eax
blake2b_blocks_sse2_L10:
testb $8, %cl
je blake2b_blocks_sse2_L12
blake2b_blocks_sse2_L11:
movl (%ebx), %edx
movl 4(%ebx), %edi
addl $8, %ebx
movl %edx, (%eax)
movl %edi, 4(%eax)
addl $8, %eax
blake2b_blocks_sse2_L12:
testb $4, %cl
je blake2b_blocks_sse2_L14
blake2b_blocks_sse2_L13:
movl (%ebx), %edx
addl $4, %ebx
movl %edx, (%eax)
addl $4, %eax
blake2b_blocks_sse2_L14:
testb $2, %cl
je blake2b_blocks_sse2_L16
blake2b_blocks_sse2_L15:
movzwl (%ebx), %edx
addl $2, %ebx
movw %dx, (%eax)
addl $2, %eax
blake2b_blocks_sse2_L16:
testb $1, %cl
je blake2b_blocks_sse2_L18
blake2b_blocks_sse2_L17:
movzbl (%ebx), %edx
movb %dl, (%eax)
blake2b_blocks_sse2_L18:
cmpl $128, %ecx
lea (%esp), %ebx
blake2b_blocks_sse2_L21:
movl 8(%ebp), %eax
movl $128, %edi
movdqa 32+blake2b_constants@GOTOFF(%esi), %xmm3
cmovbe %ecx, %edi
movdqa blake2b_constants@GOTOFF(%esi), %xmm2
movdqa 16+blake2b_constants@GOTOFF(%esi), %xmm1
movdqa (%eax), %xmm4
movdqa 16(%eax), %xmm5
movdqa 32(%eax), %xmm6
movdqa 48(%eax), %xmm7
movl 64(%eax), %edx
movl 68(%eax), %eax
movdqa %xmm1, 160(%esp)
movdqa %xmm2, 144(%esp)
movdqa %xmm3, 128(%esp)
movdqa %xmm7, 464(%esp)
movdqa %xmm6, 480(%esp)
movdqa %xmm5, 384(%esp)
movdqa %xmm4, 400(%esp)
movdqa %xmm0, 176(%esp)
movl %edi, 1200(%esp)
jmp blake2b_blocks_sse2_L22
blake2b_blocks_sse2_L25:
addl 20(%ebp), %ebx
addl $-128, %ecx
blake2b_blocks_sse2_L22:
movl 8(%ebp), %edi
movl 1200(%esp), %esi
addl %esi, %edx
adcl $0, %eax
movl %edx, 64(%edi)
movl %eax, 68(%edi)
movl %edx, %edi
subl %esi, %edi
movl $0, %esi
movl %eax, %edi
sbbl %esi, %edi
jae blake2b_blocks_sse2_L24
blake2b_blocks_sse2_L23:
movl 8(%ebp), %esi
addl $1, 72(%esi)
adcl $0, 76(%esi)
blake2b_blocks_sse2_L24:
movq 16(%ebx), %xmm4
movq 48(%ebx), %xmm3
movq 32(%ebx), %xmm2
movq (%ebx), %xmm5
movdqa %xmm4, 736(%esp)
movdqa %xmm3, 688(%esp)
movl 8(%ebp), %esi
movdqa %xmm2, 544(%esp)
movdqa %xmm5, 576(%esp)
punpcklqdq %xmm4, %xmm5
movdqa 400(%esp), %xmm4
punpcklqdq %xmm3, %xmm2
movdqa 384(%esp), %xmm3
paddq %xmm5, %xmm4
paddq %xmm2, %xmm3
movdqa %xmm5, 352(%esp)
movdqa 480(%esp), %xmm5
movdqa 464(%esp), %xmm7
movdqa 64(%esi), %xmm0
paddq %xmm5, %xmm4
paddq %xmm7, %xmm3
pxor 128(%esp), %xmm0
movdqa 176(%esp), %xmm1
pxor %xmm4, %xmm0
pxor %xmm3, %xmm1
movdqa %xmm2, 368(%esp)
pshufd $177, %xmm0, %xmm6
pshufd $177, %xmm1, %xmm1
movdqa 144(%esp), %xmm2
movdqa 160(%esp), %xmm0
paddq %xmm6, %xmm2
paddq %xmm1, %xmm0
pxor %xmm2, %xmm5
pxor %xmm0, %xmm7
movdqa %xmm2, 960(%esp)
movdqa %xmm7, %xmm2
movdqa %xmm0, 976(%esp)
movdqa %xmm5, %xmm0
psrlq $24, %xmm0
psllq $40, %xmm5
psrlq $24, %xmm2
psllq $40, %xmm7
pxor %xmm5, %xmm0
pxor %xmm7, %xmm2
movq 8(%ebx), %xmm7
movq 24(%ebx), %xmm5
movdqa %xmm6, 928(%esp)
movdqa %xmm1, 944(%esp)
movdqa %xmm7, 704(%esp)
movq 40(%ebx), %xmm6
movq 56(%ebx), %xmm1
punpcklqdq %xmm5, %xmm7
movdqa %xmm6, 560(%esp)
paddq %xmm7, %xmm4
punpcklqdq %xmm1, %xmm6
paddq %xmm6, %xmm3
paddq %xmm0, %xmm4
paddq %xmm2, %xmm3
movdqa %xmm1, 640(%esp)
movdqa 928(%esp), %xmm1
movdqa %xmm5, 592(%esp)
pxor %xmm4, %xmm1
movdqa 944(%esp), %xmm5
movdqa %xmm7, 336(%esp)
pxor %xmm3, %xmm5
movdqa %xmm1, %xmm7
psllq $48, %xmm1
movdqa %xmm6, 320(%esp)
psrlq $16, %xmm7
movdqa %xmm5, %xmm6
pxor %xmm1, %xmm7
movdqa 960(%esp), %xmm1
psrlq $16, %xmm6
psllq $48, %xmm5
movdqa %xmm7, 992(%esp)
pxor %xmm5, %xmm6
paddq %xmm7, %xmm1
movdqa 976(%esp), %xmm7
pxor %xmm1, %xmm0
paddq %xmm6, %xmm7
pxor %xmm7, %xmm2
movdqa %xmm0, %xmm5
movdqa %xmm7, 976(%esp)
movdqa %xmm2, %xmm7
psrlq $63, %xmm7
psllq $1, %xmm2
psrlq $63, %xmm5
psllq $1, %xmm0
pxor %xmm2, %xmm7
pxor %xmm0, %xmm5
movdqa %xmm7, %xmm0
movdqa %xmm6, 1008(%esp)
movdqa %xmm5, %xmm6
punpcklqdq %xmm7, %xmm0
punpcklqdq %xmm5, %xmm5
movdqa %xmm1, 960(%esp)
punpckhqdq %xmm0, %xmm6
movq 96(%ebx), %xmm0
movq 112(%ebx), %xmm1
movq 64(%ebx), %xmm2
punpckhqdq %xmm5, %xmm7
movq 80(%ebx), %xmm5
movdqa %xmm0, 672(%esp)
punpcklqdq %xmm1, %xmm0
movdqa %xmm2, 656(%esp)
punpcklqdq %xmm5, %xmm2
movdqa %xmm0, 432(%esp)
paddq %xmm0, %xmm3
paddq %xmm2, %xmm4
paddq %xmm7, %xmm3
paddq %xmm6, %xmm4
movdqa 992(%esp), %xmm0
movdqa %xmm2, 304(%esp)
movdqa %xmm1, 608(%esp)
movdqa %xmm0, %xmm1
movdqa 1008(%esp), %xmm2
movdqa %xmm5, 624(%esp)
movdqa %xmm2, %xmm5
punpcklqdq %xmm0, %xmm1
punpckhqdq %xmm1, %xmm5
punpcklqdq %xmm2, %xmm2
pxor %xmm4, %xmm5
punpckhqdq %xmm2, %xmm0
pshufd $177, %xmm5, %xmm5
pxor %xmm3, %xmm0
movdqa 976(%esp), %xmm2
movdqa 960(%esp), %xmm1
pshufd $177, %xmm0, %xmm0
paddq %xmm5, %xmm2
paddq %xmm0, %xmm1
pxor %xmm2, %xmm6
pxor %xmm1, %xmm7
movdqa %xmm1, 960(%esp)
movdqa %xmm6, %xmm1
movdqa %xmm5, 1024(%esp)
psrlq $24, %xmm1
psllq $40, %xmm6
movdqa %xmm7, %xmm5
movdqa %xmm2, 976(%esp)
pxor %xmm6, %xmm1
movq 72(%ebx), %xmm6
psrlq $24, %xmm5
movq 88(%ebx), %xmm2
psllq $40, %xmm7
movdqa %xmm6, 752(%esp)
pxor %xmm7, %xmm5
movq 104(%ebx), %xmm7
punpcklqdq %xmm2, %xmm6
movdqa %xmm0, 1040(%esp)
movdqa %xmm2, 768(%esp)
movdqa %xmm7, %xmm2
movq 120(%ebx), %xmm0
paddq %xmm6, %xmm4
punpcklqdq %xmm0, %xmm2
paddq %xmm1, %xmm4
paddq %xmm2, %xmm3
movdqa %xmm2, 272(%esp)
movdqa 1024(%esp), %xmm2
pxor %xmm4, %xmm2
paddq %xmm5, %xmm3
movdqa %xmm6, 288(%esp)
movdqa %xmm0, 784(%esp)
movdqa %xmm2, %xmm0
movdqa 1040(%esp), %xmm6
psrlq $16, %xmm0
pxor %xmm3, %xmm6
psllq $48, %xmm2
pxor %xmm2, %xmm0
movdqa %xmm6, %xmm2
psrlq $16, %xmm2
psllq $48, %xmm6
pxor %xmm6, %xmm2
movdqa 976(%esp), %xmm6
movdqa %xmm0, 1056(%esp)
paddq %xmm0, %xmm6
movdqa 960(%esp), %xmm0
pxor %xmm6, %xmm1
paddq %xmm2, %xmm0
movdqa %xmm0, 960(%esp)
pxor %xmm0, %xmm5
movdqa %xmm1, %xmm0
psllq $1, %xmm1
psrlq $63, %xmm0
pxor %xmm1, %xmm0
movdqa %xmm5, %xmm1
psrlq $63, %xmm1
psllq $1, %xmm5
pxor %xmm5, %xmm1
movdqa %xmm1, %xmm5
movdqa %xmm6, 976(%esp)
movdqa %xmm0, %xmm6
punpcklqdq %xmm1, %xmm5
punpcklqdq %xmm0, %xmm0
punpckhqdq %xmm5, %xmm6
punpckhqdq %xmm0, %xmm1
movq 112(%ebx), %xmm0
movq 72(%ebx), %xmm5
movhpd 32(%ebx), %xmm0
punpcklqdq %xmm7, %xmm5
paddq %xmm0, %xmm4
paddq %xmm5, %xmm3
paddq %xmm1, %xmm4
paddq %xmm6, %xmm3
movdqa %xmm7, 720(%esp)
movdqa %xmm0, 448(%esp)
movdqa %xmm2, %xmm0
movdqa 1056(%esp), %xmm7
movdqa %xmm5, 256(%esp)
movdqa %xmm7, %xmm5
punpcklqdq %xmm2, %xmm0
punpcklqdq %xmm7, %xmm7
punpckhqdq %xmm0, %xmm5
punpckhqdq %xmm7, %xmm2
pxor %xmm4, %xmm5
pxor %xmm3, %xmm2
pshufd $177, %xmm5, %xmm5
pshufd $177, %xmm2, %xmm2
movdqa 960(%esp), %xmm7
movdqa 976(%esp), %xmm0
paddq %xmm5, %xmm7
paddq %xmm2, %xmm0
pxor %xmm7, %xmm1
pxor %xmm0, %xmm6
movdqa %xmm7, 960(%esp)
movdqa %xmm6, %xmm7
movdqa %xmm0, 976(%esp)
movdqa %xmm1, %xmm0
psrlq $24, %xmm0
psllq $40, %xmm1
psrlq $24, %xmm7
psllq $40, %xmm6
pxor %xmm1, %xmm0
pxor %xmm6, %xmm7
movq 80(%ebx), %xmm1
movq 120(%ebx), %xmm6
movhpd 64(%ebx), %xmm1
movhpd 48(%ebx), %xmm6
paddq %xmm1, %xmm4
paddq %xmm6, %xmm3
paddq %xmm0, %xmm4
paddq %xmm7, %xmm3
pxor %xmm4, %xmm5
pxor %xmm3, %xmm2
movdqa %xmm1, 416(%esp)
movdqa %xmm5, %xmm1
movdqa %xmm6, 240(%esp)
movdqa %xmm2, %xmm6
psrlq $16, %xmm1
psllq $48, %xmm5
psrlq $16, %xmm6
psllq $48, %xmm2
pxor %xmm5, %xmm1
pxor %xmm2, %xmm6
movdqa 976(%esp), %xmm5
movdqa 960(%esp), %xmm2
paddq %xmm6, %xmm5
paddq %xmm1, %xmm2
pxor %xmm5, %xmm7
pxor %xmm2, %xmm0
movdqa %xmm2, 960(%esp)
movdqa %xmm7, %xmm2
movdqa %xmm5, 976(%esp)
movdqa %xmm0, %xmm5
psrlq $63, %xmm2
psllq $1, %xmm7
psrlq $63, %xmm5
psllq $1, %xmm0
pxor %xmm7, %xmm2
pxor %xmm0, %xmm5
movdqa %xmm2, %xmm7
movdqa %xmm5, %xmm0
punpcklqdq %xmm2, %xmm7
punpcklqdq %xmm5, %xmm5
punpckhqdq %xmm7, %xmm0
punpckhqdq %xmm5, %xmm2
movq 8(%ebx), %xmm5
movq 88(%ebx), %xmm7
movhpd 40(%ebx), %xmm7
movhpd (%ebx), %xmm5
paddq %xmm5, %xmm4
paddq %xmm7, %xmm3
paddq %xmm0, %xmm4
paddq %xmm2, %xmm3
movdqa %xmm5, 224(%esp)
movdqa %xmm1, %xmm5
movdqa %xmm7, 208(%esp)
movdqa %xmm6, %xmm7
punpcklqdq %xmm1, %xmm5
punpcklqdq %xmm6, %xmm6
punpckhqdq %xmm5, %xmm7
punpckhqdq %xmm6, %xmm1
pxor %xmm4, %xmm7
pxor %xmm3, %xmm1
pshufd $177, %xmm7, %xmm7
pshufd $177, %xmm1, %xmm6
movdqa 976(%esp), %xmm1
movdqa 960(%esp), %xmm5
paddq %xmm7, %xmm1
paddq %xmm6, %xmm5
pxor %xmm1, %xmm0
pxor %xmm5, %xmm2
movdqa %xmm1, 976(%esp)
movdqa %xmm2, %xmm1
movdqa %xmm5, 960(%esp)
movdqa %xmm0, %xmm5
psrlq $24, %xmm5
psllq $40, %xmm0
psrlq $24, %xmm1
psllq $40, %xmm2
pxor %xmm0, %xmm5
pxor %xmm2, %xmm1
movq 96(%ebx), %xmm0
movq 56(%ebx), %xmm2
movhpd 16(%ebx), %xmm0
movhpd 24(%ebx), %xmm2
paddq %xmm0, %xmm4
paddq %xmm2, %xmm3
paddq %xmm5, %xmm4
paddq %xmm1, %xmm3
pxor %xmm4, %xmm7
pxor %xmm3, %xmm6
movdqa %xmm0, 192(%esp)
movdqa %xmm7, %xmm0
movdqa %xmm2, 496(%esp)
movdqa %xmm6, %xmm2
psrlq $16, %xmm0
psllq $48, %xmm7
psrlq $16, %xmm2
psllq $48, %xmm6
pxor %xmm7, %xmm0
pxor %xmm6, %xmm2
movdqa 976(%esp), %xmm6
paddq %xmm0, %xmm6
movdqa 960(%esp), %xmm7
pxor %xmm6, %xmm5
paddq %xmm2, %xmm7
movdqa %xmm6, 976(%esp)
movdqa %xmm5, %xmm6
pxor %xmm7, %xmm1
psrlq $63, %xmm6
psllq $1, %xmm5
pxor %xmm5, %xmm6
movdqa %xmm1, %xmm5
psrlq $63, %xmm5
psllq $1, %xmm1
pxor %xmm1, %xmm5
movdqa %xmm6, %xmm1
movdqa %xmm7, 960(%esp)
movdqa %xmm5, %xmm7
punpcklqdq %xmm6, %xmm6
punpcklqdq %xmm5, %xmm7
punpckhqdq %xmm6, %xmm5
movq 88(%ebx), %xmm6
movhpd 96(%ebx), %xmm6
punpckhqdq %xmm7, %xmm1
movq 40(%ebx), %xmm7
paddq %xmm6, %xmm4
movhpd 120(%ebx), %xmm7
movdqa %xmm2, %xmm6
paddq %xmm7, %xmm3
paddq %xmm5, %xmm4
paddq %xmm1, %xmm3
movdqa %xmm7, 512(%esp)
movdqa %xmm0, %xmm7
punpcklqdq %xmm2, %xmm6
punpckhqdq %xmm6, %xmm7
punpcklqdq %xmm0, %xmm0
pxor %xmm4, %xmm7
punpckhqdq %xmm0, %xmm2
pshufd $177, %xmm7, %xmm6
pxor %xmm3, %xmm2
movdqa 960(%esp), %xmm7
pshufd $177, %xmm2, %xmm0
movdqa 976(%esp), %xmm2
paddq %xmm6, %xmm7
paddq %xmm0, %xmm2
pxor %xmm7, %xmm5
pxor %xmm2, %xmm1
movdqa %xmm2, 976(%esp)
movdqa %xmm5, %xmm2
psrlq $24, %xmm2
psllq $40, %xmm5
pxor %xmm5, %xmm2
movdqa %xmm1, %xmm5
psrlq $24, %xmm5
psllq $40, %xmm1
pxor %xmm1, %xmm5
movq 64(%ebx), %xmm1
movhpd (%ebx), %xmm1
paddq %xmm1, %xmm4
movdqa %xmm2, 1072(%esp)
paddq %xmm2, %xmm4
movq 16(%ebx), %xmm2
pxor %xmm4, %xmm6
movhpd 104(%ebx), %xmm2
movdqa %xmm6, %xmm1
paddq %xmm2, %xmm3
paddq %xmm5, %xmm3
pxor %xmm3, %xmm0
psrlq $16, %xmm1
movdqa %xmm0, %xmm2
psllq $48, %xmm6
psrlq $16, %xmm2
psllq $48, %xmm0
pxor %xmm6, %xmm1
pxor %xmm0, %xmm2
movdqa 976(%esp), %xmm6
paddq %xmm2, %xmm6
paddq %xmm1, %xmm7
movdqa 1072(%esp), %xmm0
pxor %xmm6, %xmm5
movdqa %xmm6, 976(%esp)
pxor %xmm7, %xmm0
movdqa %xmm5, %xmm6
psllq $1, %xmm5
movdqa %xmm7, 960(%esp)
movdqa %xmm0, %xmm7
psrlq $63, %xmm6
psrlq $63, %xmm7
psllq $1, %xmm0
pxor %xmm5, %xmm6
pxor %xmm0, %xmm7
movdqa %xmm6, %xmm5
punpcklqdq %xmm6, %xmm5
movdqa %xmm7, %xmm0
punpcklqdq %xmm7, %xmm7
punpckhqdq %xmm5, %xmm0
punpckhqdq %xmm7, %xmm6
movq 80(%ebx), %xmm5
movq 56(%ebx), %xmm7
movhpd 24(%ebx), %xmm5
movhpd 72(%ebx), %xmm7
paddq %xmm5, %xmm4
paddq %xmm7, %xmm3
paddq %xmm0, %xmm4
paddq %xmm6, %xmm3
movdqa %xmm1, %xmm5
movdqa %xmm2, %xmm7
punpcklqdq %xmm1, %xmm5
punpcklqdq %xmm2, %xmm2
punpckhqdq %xmm5, %xmm7
punpckhqdq %xmm2, %xmm1
pxor %xmm4, %xmm7
pxor %xmm3, %xmm1
pshufd $177, %xmm7, %xmm7
pshufd $177, %xmm1, %xmm2
movdqa 976(%esp), %xmm1
movdqa 960(%esp), %xmm5
paddq %xmm7, %xmm1
paddq %xmm2, %xmm5
pxor %xmm1, %xmm0
pxor %xmm5, %xmm6
movdqa %xmm5, 960(%esp)
movdqa %xmm0, %xmm5
psrlq $24, %xmm5
psllq $40, %xmm0
pxor %xmm0, %xmm5
movdqa %xmm6, %xmm0
psrlq $24, %xmm0
psllq $40, %xmm6
pxor %xmm6, %xmm0
movq 112(%ebx), %xmm6
movhpd 48(%ebx), %xmm6
paddq %xmm6, %xmm4
movdqa %xmm5, 1088(%esp)
paddq %xmm5, %xmm4
movq 8(%ebx), %xmm5
pxor %xmm4, %xmm7
movhpd 32(%ebx), %xmm5
movdqa %xmm7, %xmm6
paddq %xmm5, %xmm3
paddq 496(%esp), %xmm4
paddq %xmm0, %xmm3
pxor %xmm3, %xmm2
psrlq $16, %xmm6
movdqa %xmm2, %xmm5
psllq $48, %xmm7
psrlq $16, %xmm5
psllq $48, %xmm2
pxor %xmm7, %xmm6
pxor %xmm2, %xmm5
movdqa 960(%esp), %xmm7
paddq %xmm5, %xmm7
paddq %xmm6, %xmm1
movdqa 1088(%esp), %xmm2
pxor %xmm7, %xmm0
movdqa %xmm1, 976(%esp)
pxor %xmm1, %xmm2
movdqa %xmm0, %xmm1
psllq $1, %xmm0
movdqa %xmm7, 960(%esp)
movdqa %xmm2, %xmm7
psrlq $63, %xmm1
psrlq $63, %xmm7
psllq $1, %xmm2
pxor %xmm0, %xmm1
pxor %xmm2, %xmm7
movdqa %xmm1, %xmm0
punpcklqdq %xmm1, %xmm0
movdqa %xmm7, %xmm2
punpckhqdq %xmm0, %xmm2
movq 104(%ebx), %xmm0
punpcklqdq %xmm7, %xmm7
movhpd 88(%ebx), %xmm0
punpckhqdq %xmm7, %xmm1
movdqa %xmm5, %xmm7
paddq %xmm0, %xmm3
paddq %xmm1, %xmm4
paddq %xmm2, %xmm3
punpcklqdq %xmm5, %xmm7
movdqa %xmm6, %xmm0
punpckhqdq %xmm7, %xmm0
punpcklqdq %xmm6, %xmm6
pxor %xmm4, %xmm0
punpckhqdq %xmm6, %xmm5
pshufd $177, %xmm0, %xmm0
pxor %xmm3, %xmm5
movdqa 960(%esp), %xmm6
pshufd $177, %xmm5, %xmm7
movdqa 976(%esp), %xmm5
paddq %xmm0, %xmm6
paddq %xmm7, %xmm5
paddq 432(%esp), %xmm3
pxor %xmm6, %xmm1
pxor %xmm5, %xmm2
movdqa %xmm5, 976(%esp)
movdqa %xmm1, %xmm5
psrlq $24, %xmm5
psllq $40, %xmm1
pxor %xmm1, %xmm5
movdqa %xmm2, %xmm1
psrlq $24, %xmm1
psllq $40, %xmm2
pxor %xmm2, %xmm1
movq 72(%ebx), %xmm2
movhpd 8(%ebx), %xmm2
paddq %xmm2, %xmm4
paddq %xmm1, %xmm3
paddq %xmm5, %xmm4
pxor %xmm4, %xmm0
pxor %xmm3, %xmm7
movdqa %xmm0, %xmm2
psllq $48, %xmm0
psrlq $16, %xmm2
pxor %xmm0, %xmm2
movdqa %xmm7, %xmm0
paddq %xmm2, %xmm6
psrlq $16, %xmm0
psllq $48, %xmm7
pxor %xmm7, %xmm0
pxor %xmm6, %xmm5
movdqa 976(%esp), %xmm7
paddq %xmm0, %xmm7
movdqa %xmm6, 960(%esp)
movdqa %xmm5, %xmm6
pxor %xmm7, %xmm1
psrlq $63, %xmm6
psllq $1, %xmm5
pxor %xmm5, %xmm6
movdqa %xmm1, %xmm5
psrlq $63, %xmm5
psllq $1, %xmm1
pxor %xmm1, %xmm5
movdqa %xmm6, %xmm1
movdqa %xmm7, 976(%esp)
movdqa %xmm5, %xmm7
punpcklqdq %xmm6, %xmm6
punpcklqdq %xmm5, %xmm7
punpckhqdq %xmm6, %xmm5
movq 16(%ebx), %xmm6
movhpd 40(%ebx), %xmm6
paddq %xmm6, %xmm4
punpckhqdq %xmm7, %xmm1
movdqa %xmm2, %xmm6
movdqa %xmm1, 896(%esp)
movdqa %xmm0, %xmm7
paddq %xmm1, %xmm4
movq 32(%ebx), %xmm1
movhpd 120(%ebx), %xmm1
paddq %xmm1, %xmm3
punpcklqdq %xmm2, %xmm6
punpckhqdq %xmm6, %xmm7
punpcklqdq %xmm0, %xmm0
pxor %xmm4, %xmm7
paddq %xmm5, %xmm3
punpckhqdq %xmm0, %xmm2
movdqa %xmm1, 816(%esp)
pxor %xmm3, %xmm2
pshufd $177, %xmm7, %xmm1
movdqa %xmm1, 912(%esp)
movdqa 976(%esp), %xmm1
movdqa 960(%esp), %xmm0
blake2b_blocks_sse2_L31:
paddq 912(%esp), %xmm1
movdqa 896(%esp), %xmm6
pshufd $177, %xmm2, %xmm2
pxor %xmm1, %xmm6
paddq %xmm2, %xmm0
movdqa %xmm6, %xmm7
pxor %xmm0, %xmm5
psrlq $24, %xmm7
psllq $40, %xmm6
movdqa %xmm0, 960(%esp)
pxor %xmm6, %xmm7
movdqa 688(%esp), %xmm0
movdqa %xmm5, %xmm6
movhpd 624(%esp), %xmm0
psrlq $24, %xmm6
psllq $40, %xmm5
paddq %xmm0, %xmm4
pxor %xmm5, %xmm6
movdqa 576(%esp), %xmm5
movhpd 656(%esp), %xmm5
paddq %xmm7, %xmm4
paddq %xmm5, %xmm3
movdqa %xmm1, 976(%esp)
movdqa 912(%esp), %xmm1
pxor %xmm4, %xmm1
paddq %xmm6, %xmm3
movdqa %xmm5, 1104(%esp)
movdqa %xmm1, %xmm5
pxor %xmm3, %xmm2
psrlq $16, %xmm5
psllq $48, %xmm1
pxor %xmm1, %xmm5
movdqa %xmm2, %xmm1
psrlq $16, %xmm1
psllq $48, %xmm2
movdqa %xmm0, 528(%esp)
pxor %xmm2, %xmm1
movdqa 960(%esp), %xmm0
movdqa 976(%esp), %xmm2
paddq %xmm1, %xmm0
paddq %xmm5, %xmm2
pxor %xmm0, %xmm6
pxor %xmm2, %xmm7
movdqa %xmm2, 976(%esp)
movdqa %xmm6, %xmm2
movdqa %xmm0, 960(%esp)
movdqa %xmm7, %xmm0
psrlq $63, %xmm2
psllq $1, %xmm6
psrlq $63, %xmm0
psllq $1, %xmm7
pxor %xmm6, %xmm2
pxor %xmm7, %xmm0
movdqa %xmm2, %xmm6
movdqa %xmm0, %xmm7
punpcklqdq %xmm2, %xmm6
punpcklqdq %xmm0, %xmm0
punpckhqdq %xmm6, %xmm7
punpckhqdq %xmm0, %xmm2
movdqa 752(%esp), %xmm0
movdqa 736(%esp), %xmm6
movhpd 560(%esp), %xmm0
movhpd 624(%esp), %xmm6
paddq %xmm0, %xmm4
paddq %xmm6, %xmm3
paddq %xmm2, %xmm4
paddq %xmm7, %xmm3
movdqa %xmm1, %xmm0
movdqa %xmm5, %xmm6
punpcklqdq %xmm1, %xmm0
punpcklqdq %xmm5, %xmm5
punpckhqdq %xmm0, %xmm6
punpckhqdq %xmm5, %xmm1
pxor %xmm4, %xmm6
pxor %xmm3, %xmm1
pshufd $177, %xmm6, %xmm0
pshufd $177, %xmm1, %xmm6
movdqa 976(%esp), %xmm1
movdqa 960(%esp), %xmm5
paddq %xmm6, %xmm1
paddq %xmm0, %xmm5
paddq 816(%esp), %xmm3
pxor %xmm1, %xmm7
pxor %xmm5, %xmm2
movdqa %xmm5, 960(%esp)
movdqa %xmm7, %xmm5
psrlq $24, %xmm5
psllq $40, %xmm7
pxor %xmm7, %xmm5
movdqa 576(%esp), %xmm7
movdqa %xmm1, 976(%esp)
movdqa %xmm2, %xmm1
movhpd 640(%esp), %xmm7
psrlq $24, %xmm1
psllq $40, %xmm2
paddq %xmm7, %xmm4
paddq %xmm5, %xmm3
pxor %xmm2, %xmm1
pxor %xmm3, %xmm6
paddq %xmm1, %xmm4
pxor %xmm4, %xmm0
movdqa %xmm6, %xmm7
movdqa %xmm0, %xmm2
psrlq $16, %xmm7
psllq $48, %xmm6
psrlq $16, %xmm2
psllq $48, %xmm0
pxor %xmm6, %xmm7
movdqa 976(%esp), %xmm6
pxor %xmm0, %xmm2
movdqa 960(%esp), %xmm0
paddq %xmm7, %xmm6
paddq %xmm2, %xmm0
pxor %xmm6, %xmm5
pxor %xmm0, %xmm1
movdqa %xmm6, 976(%esp)
movdqa %xmm5, %xmm6
movdqa %xmm0, 960(%esp)
movdqa %xmm1, %xmm0
psrlq $63, %xmm6
psllq $1, %xmm5
psrlq $63, %xmm0
psllq $1, %xmm1
pxor %xmm5, %xmm6
pxor %xmm1, %xmm0
movdqa %xmm6, %xmm1
movdqa %xmm0, %xmm5
punpcklqdq %xmm6, %xmm1
punpcklqdq %xmm0, %xmm0
punpckhqdq %xmm1, %xmm5
punpckhqdq %xmm0, %xmm6
movdqa 608(%esp), %xmm0
movdqa 688(%esp), %xmm1
movhpd 768(%esp), %xmm0
movhpd 592(%esp), %xmm1
paddq %xmm0, %xmm4
paddq %xmm1, %xmm3
paddq %xmm5, %xmm4
paddq %xmm6, %xmm3
movdqa %xmm2, %xmm0
movdqa %xmm7, %xmm1
punpcklqdq %xmm2, %xmm0
punpcklqdq %xmm7, %xmm7
punpckhqdq %xmm0, %xmm1
punpckhqdq %xmm7, %xmm2
pxor %xmm4, %xmm1
pxor %xmm3, %xmm2
movdqa 960(%esp), %xmm0
pshufd $177, %xmm1, %xmm1
pshufd $177, %xmm2, %xmm7
movdqa 976(%esp), %xmm2
paddq %xmm1, %xmm2
paddq %xmm7, %xmm0
pxor %xmm2, %xmm5
pxor %xmm0, %xmm6
movdqa %xmm2, 976(%esp)
movdqa %xmm6, %xmm2
movdqa %xmm0, 960(%esp)
movdqa %xmm5, %xmm0
psrlq $24, %xmm0
psllq $40, %xmm5
psrlq $24, %xmm2
psllq $40, %xmm6
pxor %xmm5, %xmm0
pxor %xmm6, %xmm2
movdqa 704(%esp), %xmm5
movdqa 656(%esp), %xmm6
movhpd 672(%esp), %xmm5
movhpd 720(%esp), %xmm6
paddq %xmm5, %xmm4
paddq %xmm6, %xmm3
paddq %xmm0, %xmm4
paddq %xmm2, %xmm3
pxor %xmm4, %xmm1
pxor %xmm3, %xmm7
movdqa %xmm1, %xmm6
movdqa %xmm7, %xmm5
psrlq $16, %xmm6
psllq $48, %xmm1
psrlq $16, %xmm5
psllq $48, %xmm7
pxor %xmm1, %xmm6
pxor %xmm7, %xmm5
movdqa 976(%esp), %xmm7
movdqa 960(%esp), %xmm1
paddq %xmm6, %xmm7
paddq %xmm5, %xmm1
paddq 1104(%esp), %xmm3
pxor %xmm7, %xmm0
pxor %xmm1, %xmm2
movdqa %xmm1, 960(%esp)
movdqa %xmm0, %xmm1
psrlq $63, %xmm1
psllq $1, %xmm0
pxor %xmm0, %xmm1
movdqa %xmm2, %xmm0
psrlq $63, %xmm0
psllq $1, %xmm2
pxor %xmm2, %xmm0
movdqa %xmm1, %xmm2
movdqa %xmm7, 976(%esp)
movdqa %xmm0, %xmm7
punpcklqdq %xmm1, %xmm1
punpcklqdq %xmm0, %xmm7
punpckhqdq %xmm1, %xmm0
movdqa 736(%esp), %xmm1
movhpd 688(%esp), %xmm1
paddq %xmm1, %xmm4
punpckhqdq %xmm7, %xmm2
movdqa %xmm5, %xmm7
punpcklqdq %xmm5, %xmm7
movdqa %xmm6, %xmm1
paddq %xmm0, %xmm4
paddq %xmm2, %xmm3
punpckhqdq %xmm7, %xmm1
punpcklqdq %xmm6, %xmm6
pxor %xmm4, %xmm1
punpckhqdq %xmm6, %xmm5
movdqa 960(%esp), %xmm6
pxor %xmm3, %xmm5
pshufd $177, %xmm1, %xmm7
movdqa 976(%esp), %xmm1
pshufd $177, %xmm5, %xmm5
paddq %xmm7, %xmm6
paddq %xmm5, %xmm1
pxor %xmm6, %xmm0
pxor %xmm1, %xmm2
movdqa %xmm1, 976(%esp)
movdqa %xmm0, %xmm1
psrlq $24, %xmm1
psllq $40, %xmm0
pxor %xmm0, %xmm1
movdqa %xmm2, %xmm0
psrlq $24, %xmm0
psllq $40, %xmm2
movdqa %xmm6, 960(%esp)
pxor %xmm2, %xmm0
movdqa 672(%esp), %xmm2
movdqa 768(%esp), %xmm6
movhpd 624(%esp), %xmm2
movhpd 592(%esp), %xmm6
paddq %xmm2, %xmm4
paddq %xmm6, %xmm3
paddq %xmm1, %xmm4
paddq %xmm0, %xmm3
pxor %xmm4, %xmm7
pxor %xmm3, %xmm5
movdqa %xmm7, %xmm2
movdqa %xmm5, %xmm6
psrlq $16, %xmm2
psllq $48, %xmm7
psrlq $16, %xmm6
psllq $48, %xmm5
pxor %xmm7, %xmm2
pxor %xmm5, %xmm6
movdqa 976(%esp), %xmm7
movdqa 960(%esp), %xmm5
paddq %xmm6, %xmm7
paddq %xmm2, %xmm5
pxor %xmm7, %xmm0
pxor %xmm5, %xmm1
movdqa %xmm7, 976(%esp)
movdqa %xmm0, %xmm7
movdqa %xmm5, 960(%esp)
movdqa %xmm1, %xmm5
psrlq $63, %xmm7
psllq $1, %xmm0
psrlq $63, %xmm5
psllq $1, %xmm1
pxor %xmm0, %xmm7
pxor %xmm1, %xmm5
movdqa %xmm7, %xmm1
movdqa %xmm5, %xmm0
punpcklqdq %xmm7, %xmm1
punpcklqdq %xmm5, %xmm5
punpckhqdq %xmm1, %xmm0
punpckhqdq %xmm5, %xmm7
movdqa 544(%esp), %xmm5
movdqa 784(%esp), %xmm1
movhpd 640(%esp), %xmm5
movhpd 704(%esp), %xmm1
paddq %xmm5, %xmm4
paddq %xmm1, %xmm3
paddq %xmm0, %xmm4
paddq %xmm7, %xmm3
movdqa %xmm2, %xmm5
movdqa %xmm6, %xmm1
punpcklqdq %xmm2, %xmm5
punpcklqdq %xmm6, %xmm6
punpckhqdq %xmm5, %xmm1
punpckhqdq %xmm6, %xmm2
pxor %xmm4, %xmm1
pxor %xmm3, %xmm2
pshufd $177, %xmm1, %xmm1
pshufd $177, %xmm2, %xmm6
movdqa 976(%esp), %xmm2
movdqa 960(%esp), %xmm5
paddq %xmm1, %xmm2
paddq %xmm6, %xmm5
pxor %xmm2, %xmm0
pxor %xmm5, %xmm7
movdqa %xmm5, 960(%esp)
movdqa %xmm0, %xmm5
psrlq $24, %xmm5
psllq $40, %xmm0
pxor %xmm0, %xmm5
movdqa %xmm7, %xmm0
psrlq $24, %xmm0
psllq $40, %xmm7
pxor %xmm7, %xmm0
movdqa 720(%esp), %xmm7
movhpd 560(%esp), %xmm7
paddq %xmm7, %xmm4
movdqa %xmm5, 1120(%esp)
paddq %xmm5, %xmm4
movdqa 608(%esp), %xmm5
pxor %xmm4, %xmm1
movhpd 752(%esp), %xmm5
movdqa %xmm1, %xmm7
paddq %xmm5, %xmm3
paddq %xmm0, %xmm3
pxor %xmm3, %xmm6
psrlq $16, %xmm7
psllq $48, %xmm1
movdqa %xmm6, %xmm5
pxor %xmm1, %xmm7
psrlq $16, %xmm5
psllq $48, %xmm6
movdqa 960(%esp), %xmm1
pxor %xmm6, %xmm5
paddq %xmm7, %xmm2
paddq %xmm5, %xmm1
paddq 448(%esp), %xmm3
movdqa 1120(%esp), %xmm6
pxor %xmm1, %xmm0
pxor %xmm2, %xmm6
movdqa %xmm1, 960(%esp)
movdqa %xmm6, %xmm1
psrlq $63, %xmm1
psllq $1, %xmm6
pxor %xmm6, %xmm1
movdqa %xmm0, %xmm6
psrlq $63, %xmm6
psllq $1, %xmm0
pxor %xmm0, %xmm6
movdqa %xmm2, 976(%esp)
movdqa %xmm6, %xmm0
movdqa %xmm1, %xmm2
punpcklqdq %xmm1, %xmm1
punpcklqdq %xmm6, %xmm0
punpckhqdq %xmm1, %xmm6
movdqa 672(%esp), %xmm1
movhpd 704(%esp), %xmm1
paddq %xmm1, %xmm4
punpckhqdq %xmm0, %xmm2
movdqa %xmm5, %xmm0
punpcklqdq %xmm5, %xmm0
movdqa %xmm7, %xmm1
punpcklqdq %xmm7, %xmm7
paddq %xmm6, %xmm4
paddq %xmm2, %xmm3
punpckhqdq %xmm0, %xmm1
punpckhqdq %xmm7, %xmm5
pxor %xmm4, %xmm1
pxor %xmm3, %xmm5
pshufd $177, %xmm1, %xmm1
pshufd $177, %xmm5, %xmm7
movdqa 960(%esp), %xmm5
movdqa 976(%esp), %xmm0
paddq %xmm1, %xmm5
paddq %xmm7, %xmm0
paddq 512(%esp), %xmm4
pxor %xmm5, %xmm6
pxor %xmm0, %xmm2
movdqa %xmm0, 976(%esp)
movdqa %xmm6, %xmm0
psrlq $24, %xmm0
psllq $40, %xmm6
pxor %xmm6, %xmm0
movdqa %xmm2, %xmm6
psrlq $24, %xmm6
psllq $40, %xmm2
pxor %xmm2, %xmm6
movdqa 720(%esp), %xmm2
movhpd 624(%esp), %xmm2
paddq %xmm0, %xmm4
paddq %xmm2, %xmm3
pxor %xmm4, %xmm1
paddq %xmm6, %xmm3
movdqa %xmm1, %xmm2
pxor %xmm3, %xmm7
psrlq $16, %xmm2
psllq $48, %xmm1
pxor %xmm1, %xmm2
movdqa %xmm7, %xmm1
psrlq $16, %xmm1
psllq $48, %xmm7
pxor %xmm7, %xmm1
movdqa 976(%esp), %xmm7
paddq %xmm2, %xmm5
paddq %xmm1, %xmm7
pxor %xmm5, %xmm0
pxor %xmm7, %xmm6
movdqa %xmm5, 960(%esp)
movdqa %xmm0, %xmm5
movdqa %xmm7, 976(%esp)
movdqa %xmm6, %xmm7
psrlq $63, %xmm5
psllq $1, %xmm0
psrlq $63, %xmm7
psllq $1, %xmm6
pxor %xmm0, %xmm5
pxor %xmm6, %xmm7
movdqa %xmm7, %xmm6
movdqa %xmm5, %xmm0
punpcklqdq %xmm5, %xmm5
punpcklqdq %xmm7, %xmm6
punpckhqdq %xmm5, %xmm7
movdqa 576(%esp), %xmm5
movhpd 688(%esp), %xmm5
punpckhqdq %xmm6, %xmm0
movdqa 752(%esp), %xmm6
movhpd 656(%esp), %xmm6
paddq %xmm5, %xmm4
paddq %xmm6, %xmm3
paddq %xmm0, %xmm4
paddq %xmm7, %xmm3
movdqa %xmm2, %xmm5
movdqa %xmm1, %xmm6
punpcklqdq %xmm2, %xmm5
punpckhqdq %xmm5, %xmm6
punpcklqdq %xmm1, %xmm1
pxor %xmm4, %xmm6
punpckhqdq %xmm1, %xmm2
pshufd $177, %xmm6, %xmm5
pxor %xmm3, %xmm2
movdqa 976(%esp), %xmm6
pshufd $177, %xmm2, %xmm1
movdqa 960(%esp), %xmm2
paddq %xmm5, %xmm6
paddq %xmm1, %xmm2
paddq 496(%esp), %xmm4
pxor %xmm6, %xmm0
pxor %xmm2, %xmm7
movdqa %xmm2, 960(%esp)
movdqa %xmm0, %xmm2
psrlq $24, %xmm2
psllq $40, %xmm0
pxor %xmm0, %xmm2
movdqa %xmm7, %xmm0
psrlq $24, %xmm0
psllq $40, %xmm7
pxor %xmm7, %xmm0
movdqa 736(%esp), %xmm7
movhpd 768(%esp), %xmm7
paddq %xmm7, %xmm3
paddq %xmm2, %xmm4
paddq %xmm0, %xmm3
pxor %xmm4, %xmm5
pxor %xmm3, %xmm1
movdqa %xmm2, 1136(%esp)
movdqa %xmm5, %xmm7
movdqa %xmm1, %xmm2
psrlq $16, %xmm7
psllq $48, %xmm5
psrlq $16, %xmm2
psllq $48, %xmm1
pxor %xmm5, %xmm7
pxor %xmm1, %xmm2
movdqa 960(%esp), %xmm1
paddq %xmm7, %xmm6
paddq %xmm2, %xmm1
movdqa 1136(%esp), %xmm5
pxor %xmm1, %xmm0
pxor %xmm6, %xmm5
movdqa %xmm6, 976(%esp)
movdqa %xmm5, %xmm6
movdqa %xmm1, 960(%esp)
movdqa %xmm0, %xmm1
psrlq $63, %xmm6
psllq $1, %xmm5
psrlq $63, %xmm1
psllq $1, %xmm0
pxor %xmm5, %xmm6
pxor %xmm0, %xmm1
movdqa %xmm1, %xmm0
movdqa %xmm6, %xmm5
punpcklqdq %xmm6, %xmm6
punpcklqdq %xmm1, %xmm0
punpckhqdq %xmm6, %xmm1
movdqa 720(%esp), %xmm6
movhpd 640(%esp), %xmm6
punpckhqdq %xmm0, %xmm5
movdqa 672(%esp), %xmm0
movhpd 592(%esp), %xmm0
paddq %xmm6, %xmm4
paddq %xmm0, %xmm3
paddq %xmm1, %xmm4
paddq %xmm5, %xmm3
movdqa %xmm2, %xmm6
movdqa %xmm7, %xmm0
punpcklqdq %xmm2, %xmm6
punpckhqdq %xmm6, %xmm0
punpcklqdq %xmm7, %xmm7
pxor %xmm4, %xmm0
punpckhqdq %xmm7, %xmm2
pshufd $177, %xmm0, %xmm6
pxor %xmm3, %xmm2
movdqa 960(%esp), %xmm0
pshufd $177, %xmm2, %xmm7
movdqa 976(%esp), %xmm2
paddq %xmm6, %xmm0
paddq %xmm7, %xmm2
pxor %xmm0, %xmm1
pxor %xmm2, %xmm5
movdqa %xmm2, 976(%esp)
movdqa %xmm1, %xmm2
psrlq $24, %xmm2
psllq $40, %xmm1
pxor %xmm1, %xmm2
movdqa %xmm5, %xmm1
psrlq $24, %xmm1
psllq $40, %xmm5
pxor %xmm5, %xmm1
movdqa 768(%esp), %xmm5
movhpd 608(%esp), %xmm5
movdqa %xmm5, 800(%esp)
paddq %xmm5, %xmm4
movdqa 704(%esp), %xmm5
movhpd 752(%esp), %xmm5
paddq %xmm2, %xmm4
paddq %xmm5, %xmm3
pxor %xmm4, %xmm6
paddq %xmm1, %xmm3
paddq 512(%esp), %xmm4
movdqa %xmm6, %xmm5
pxor %xmm3, %xmm7
psrlq $16, %xmm5
psllq $48, %xmm6
pxor %xmm6, %xmm5
movdqa %xmm7, %xmm6
psrlq $16, %xmm6
psllq $48, %xmm7
paddq %xmm5, %xmm0
pxor %xmm7, %xmm6
pxor %xmm0, %xmm2
movdqa 976(%esp), %xmm7
paddq %xmm6, %xmm7
movdqa %xmm7, 976(%esp)
pxor %xmm7, %xmm1
movdqa %xmm2, %xmm7
psllq $1, %xmm2
psrlq $63, %xmm7
pxor %xmm2, %xmm7
movdqa %xmm1, %xmm2
psrlq $63, %xmm2
psllq $1, %xmm1
pxor %xmm1, %xmm2
movdqa %xmm2, %xmm1
movdqa %xmm6, 832(%esp)
movdqa %xmm7, %xmm6
punpcklqdq %xmm2, %xmm1
punpckhqdq %xmm1, %xmm6
punpcklqdq %xmm7, %xmm7
movdqa %xmm6, 864(%esp)
punpckhqdq %xmm7, %xmm2
paddq %xmm6, %xmm4
movdqa 976(%esp), %xmm1
blake2b_blocks_sse2_L30:
movdqa 656(%esp), %xmm7
movhpd 736(%esp), %xmm7
paddq %xmm7, %xmm3
movdqa 832(%esp), %xmm6
movdqa %xmm2, 1152(%esp)
movdqa %xmm6, %xmm7
paddq %xmm2, %xmm3
movdqa %xmm5, %xmm2
punpcklqdq %xmm5, %xmm2
punpckhqdq %xmm2, %xmm7
punpcklqdq %xmm6, %xmm6
pxor %xmm4, %xmm7
pshufd $177, %xmm7, %xmm2
punpckhqdq %xmm6, %xmm5
paddq %xmm2, %xmm1
pxor %xmm3, %xmm5
movdqa 864(%esp), %xmm7
pshufd $177, %xmm5, %xmm6
pxor %xmm1, %xmm7
paddq %xmm6, %xmm0
paddq 528(%esp), %xmm3
movdqa %xmm1, 976(%esp)
movdqa %xmm7, %xmm5
movdqa 1152(%esp), %xmm1
psrlq $24, %xmm5
movdqa %xmm0, 960(%esp)
pxor %xmm0, %xmm1
psllq $40, %xmm7
movdqa 576(%esp), %xmm0
pxor %xmm7, %xmm5
movdqa %xmm1, %xmm7
psllq $40, %xmm1
movhpd 544(%esp), %xmm0
psrlq $24, %xmm7
paddq %xmm0, %xmm4
pxor %xmm1, %xmm7
paddq %xmm5, %xmm4
paddq %xmm7, %xmm3
pxor %xmm4, %xmm2
pxor %xmm3, %xmm6
movdqa %xmm2, %xmm1
movdqa %xmm6, %xmm0
psrlq $16, %xmm1
psllq $48, %xmm2
psrlq $16, %xmm0
psllq $48, %xmm6
pxor %xmm2, %xmm1
pxor %xmm6, %xmm0
movdqa 976(%esp), %xmm6
movdqa 960(%esp), %xmm2
paddq %xmm1, %xmm6
paddq %xmm0, %xmm2
pxor %xmm6, %xmm5
pxor %xmm2, %xmm7
movdqa %xmm6, 976(%esp)
movdqa %xmm7, %xmm6
movdqa %xmm2, 960(%esp)
movdqa %xmm5, %xmm2
psrlq $63, %xmm2
psllq $1, %xmm5
psrlq $63, %xmm6
psllq $1, %xmm7
pxor %xmm5, %xmm2
pxor %xmm7, %xmm6
movdqa %xmm6, %xmm7
movdqa %xmm2, %xmm5
punpcklqdq %xmm2, %xmm2
punpcklqdq %xmm6, %xmm7
punpckhqdq %xmm2, %xmm6
movdqa 688(%esp), %xmm2
movhpd 608(%esp), %xmm2
punpckhqdq %xmm7, %xmm5
movdqa 768(%esp), %xmm7
movhpd 576(%esp), %xmm7
paddq %xmm2, %xmm4
paddq %xmm7, %xmm3
paddq %xmm6, %xmm4
paddq %xmm5, %xmm3
movdqa %xmm0, %xmm2
movdqa %xmm1, %xmm7
punpcklqdq %xmm0, %xmm2
punpckhqdq %xmm2, %xmm7
punpcklqdq %xmm1, %xmm1
pxor %xmm4, %xmm7
punpckhqdq %xmm1, %xmm0
pshufd $177, %xmm7, %xmm2
pxor %xmm3, %xmm0
movdqa 960(%esp), %xmm7
movdqa 976(%esp), %xmm1
pshufd $177, %xmm0, %xmm0
paddq %xmm2, %xmm7
paddq %xmm0, %xmm1
pxor %xmm7, %xmm6
pxor %xmm1, %xmm5
movdqa %xmm1, 976(%esp)
movdqa %xmm6, %xmm1
psrlq $24, %xmm1
psllq $40, %xmm6
pxor %xmm6, %xmm1
movdqa %xmm5, %xmm6
psrlq $24, %xmm6
psllq $40, %xmm5
pxor %xmm5, %xmm6
movdqa 784(%esp), %xmm5
movhpd 752(%esp), %xmm5
movdqa %xmm5, 784(%esp)
paddq %xmm5, %xmm4
movdqa 592(%esp), %xmm5
movhpd 656(%esp), %xmm5
paddq %xmm1, %xmm4
paddq %xmm5, %xmm3
pxor %xmm4, %xmm2
paddq %xmm6, %xmm3
movdqa %xmm2, %xmm5
pxor %xmm3, %xmm0
psrlq $16, %xmm5
psllq $48, %xmm2
pxor %xmm2, %xmm5
movdqa %xmm0, %xmm2
psrlq $16, %xmm2
psllq $48, %xmm0
pxor %xmm0, %xmm2
movdqa 976(%esp), %xmm0
paddq %xmm2, %xmm0
paddq %xmm5, %xmm7
pxor %xmm0, %xmm6
pxor %xmm7, %xmm1
movdqa %xmm0, 976(%esp)
movdqa %xmm6, %xmm0
movdqa %xmm7, 960(%esp)
movdqa %xmm1, %xmm7
psrlq $63, %xmm0
psllq $1, %xmm6
psrlq $63, %xmm7
psllq $1, %xmm1
pxor %xmm6, %xmm0
pxor %xmm1, %xmm7
movdqa %xmm0, %xmm6
movdqa %xmm7, %xmm1
punpcklqdq %xmm0, %xmm6
punpcklqdq %xmm7, %xmm7
punpckhqdq %xmm6, %xmm1
punpckhqdq %xmm7, %xmm0
movdqa 672(%esp), %xmm7
movdqa 704(%esp), %xmm6
movhpd 720(%esp), %xmm7
movhpd 624(%esp), %xmm6
paddq %xmm7, %xmm4
paddq %xmm6, %xmm3
paddq %xmm1, %xmm4
paddq %xmm0, %xmm3
movdqa %xmm5, %xmm7
movdqa %xmm2, %xmm6
punpcklqdq %xmm5, %xmm7
punpcklqdq %xmm2, %xmm2
punpckhqdq %xmm7, %xmm6
punpckhqdq %xmm2, %xmm5
pxor %xmm4, %xmm6
pxor %xmm3, %xmm5
movdqa 976(%esp), %xmm2
pshufd $177, %xmm6, %xmm6
pshufd $177, %xmm5, %xmm7
movdqa 960(%esp), %xmm5
paddq %xmm6, %xmm2
paddq %xmm7, %xmm5
pxor %xmm2, %xmm1
pxor %xmm5, %xmm0
movdqa %xmm2, 976(%esp)
movdqa %xmm1, %xmm2
movdqa %xmm5, 960(%esp)
movdqa %xmm0, %xmm5
psrlq $24, %xmm2
psllq $40, %xmm1
psrlq $24, %xmm5
psllq $40, %xmm0
pxor %xmm1, %xmm2
pxor %xmm0, %xmm5
movdqa 736(%esp), %xmm1
movdqa 544(%esp), %xmm0
movhpd 640(%esp), %xmm1
movhpd 560(%esp), %xmm0
paddq %xmm1, %xmm4
paddq %xmm0, %xmm3
paddq %xmm2, %xmm4
paddq %xmm5, %xmm3
pxor %xmm4, %xmm6
pxor %xmm3, %xmm7
movdqa %xmm6, %xmm1
movdqa %xmm7, %xmm0
psrlq $16, %xmm1
psllq $48, %xmm6
psrlq $16, %xmm0
psllq $48, %xmm7
pxor %xmm6, %xmm1
pxor %xmm7, %xmm0
movdqa 976(%esp), %xmm7
movdqa 960(%esp), %xmm6
paddq %xmm1, %xmm7
paddq %xmm0, %xmm6
paddq 416(%esp), %xmm4
pxor %xmm7, %xmm2
pxor %xmm6, %xmm5
movdqa %xmm6, 960(%esp)
movdqa %xmm2, %xmm6
psrlq $63, %xmm6
psllq $1, %xmm2
pxor %xmm2, %xmm6
movdqa %xmm5, %xmm2
psrlq $63, %xmm2
psllq $1, %xmm5
pxor %xmm5, %xmm2
movdqa %xmm6, %xmm5
movdqa %xmm7, 976(%esp)
movdqa %xmm2, %xmm7
punpcklqdq %xmm6, %xmm6
punpcklqdq %xmm2, %xmm7
punpckhqdq %xmm6, %xmm2
movdqa 640(%esp), %xmm6
movhpd 704(%esp), %xmm6
punpckhqdq %xmm7, %xmm5
movdqa %xmm0, %xmm7
paddq %xmm6, %xmm3
paddq %xmm2, %xmm4
paddq %xmm5, %xmm3
punpcklqdq %xmm0, %xmm7
movdqa %xmm1, %xmm6
punpckhqdq %xmm7, %xmm6
punpcklqdq %xmm1, %xmm1
pxor %xmm4, %xmm6
punpckhqdq %xmm1, %xmm0
movdqa 960(%esp), %xmm1
pxor %xmm3, %xmm0
pshufd $177, %xmm6, %xmm7
pshufd $177, %xmm0, %xmm6
movdqa 976(%esp), %xmm0
paddq %xmm7, %xmm1
paddq %xmm6, %xmm0
pxor %xmm1, %xmm2
pxor %xmm0, %xmm5
movdqa %xmm0, 976(%esp)
movdqa %xmm2, %xmm0
psrlq $24, %xmm0
psllq $40, %xmm2
pxor %xmm2, %xmm0
movdqa %xmm5, %xmm2
psrlq $24, %xmm2
psllq $40, %xmm5
pxor %xmm5, %xmm2
movdqa 736(%esp), %xmm5
movhpd 544(%esp), %xmm5
paddq %xmm5, %xmm4
movdqa 688(%esp), %xmm5
movhpd 560(%esp), %xmm5
paddq %xmm0, %xmm4
paddq %xmm5, %xmm3
pxor %xmm4, %xmm7
paddq %xmm2, %xmm3
paddq 784(%esp), %xmm4
movdqa %xmm7, %xmm5
pxor %xmm3, %xmm6
psrlq $16, %xmm5
psllq $48, %xmm7
pxor %xmm7, %xmm5
movdqa %xmm6, %xmm7
psrlq $16, %xmm7
psllq $48, %xmm6
pxor %xmm6, %xmm7
movdqa 976(%esp), %xmm6
paddq %xmm5, %xmm1
paddq %xmm7, %xmm6
pxor %xmm1, %xmm0
pxor %xmm6, %xmm2
movdqa %xmm1, 960(%esp)
movdqa %xmm2, %xmm1
movdqa %xmm6, 976(%esp)
movdqa %xmm0, %xmm6
psrlq $63, %xmm6
psllq $1, %xmm0
psrlq $63, %xmm1
psllq $1, %xmm2
pxor %xmm0, %xmm6
pxor %xmm2, %xmm1
movdqa %xmm1, %xmm0
movdqa %xmm6, %xmm2
punpcklqdq %xmm6, %xmm6
punpcklqdq %xmm1, %xmm0
punpckhqdq %xmm6, %xmm1
movdqa 592(%esp), %xmm6
movhpd 720(%esp), %xmm6
punpckhqdq %xmm0, %xmm2
movdqa %xmm5, %xmm0
paddq %xmm6, %xmm3
paddq %xmm2, %xmm4
paddq %xmm1, %xmm3
punpcklqdq %xmm5, %xmm0
movdqa %xmm7, %xmm6
punpckhqdq %xmm0, %xmm6
punpcklqdq %xmm7, %xmm7
pxor %xmm4, %xmm6
punpckhqdq %xmm7, %xmm5
pshufd $177, %xmm6, %xmm0
pxor %xmm3, %xmm5
movdqa 976(%esp), %xmm6
movdqa 960(%esp), %xmm7
pshufd $177, %xmm5, %xmm5
paddq %xmm0, %xmm6
paddq %xmm5, %xmm7
paddq 800(%esp), %xmm4
pxor %xmm6, %xmm2
pxor %xmm7, %xmm1
movdqa %xmm7, 960(%esp)
movdqa %xmm2, %xmm7
psrlq $24, %xmm7
psllq $40, %xmm2
pxor %xmm2, %xmm7
movdqa %xmm1, %xmm2
psrlq $24, %xmm2
psllq $40, %xmm1
pxor %xmm1, %xmm2
movdqa 672(%esp), %xmm1
movhpd 576(%esp), %xmm1
paddq %xmm7, %xmm4
paddq %xmm1, %xmm3
pxor %xmm4, %xmm0
paddq %xmm2, %xmm3
paddq 352(%esp), %xmm4
movdqa %xmm0, %xmm1
pxor %xmm3, %xmm5
psrlq $16, %xmm1
psllq $48, %xmm0
pxor %xmm0, %xmm1
movdqa %xmm5, %xmm0
psrlq $16, %xmm0
psllq $48, %xmm5
pxor %xmm5, %xmm0
movdqa 960(%esp), %xmm5
paddq %xmm1, %xmm6
paddq %xmm0, %xmm5
paddq 368(%esp), %xmm3
pxor %xmm6, %xmm7
pxor %xmm5, %xmm2
movdqa %xmm6, 976(%esp)
movdqa %xmm2, %xmm6
movdqa %xmm5, 960(%esp)
movdqa %xmm7, %xmm5
psrlq $63, %xmm5
psllq $1, %xmm7
psrlq $63, %xmm6
psllq $1, %xmm2
pxor %xmm7, %xmm5
pxor %xmm2, %xmm6
movdqa %xmm6, %xmm2
movdqa %xmm5, %xmm7
punpcklqdq %xmm5, %xmm5
punpcklqdq %xmm6, %xmm2
punpckhqdq %xmm5, %xmm6
movdqa %xmm0, %xmm5
punpckhqdq %xmm2, %xmm7
movdqa %xmm1, %xmm2
punpcklqdq %xmm0, %xmm5
paddq %xmm6, %xmm4
paddq %xmm7, %xmm3
punpckhqdq %xmm5, %xmm2
punpcklqdq %xmm1, %xmm1
pxor %xmm4, %xmm2
punpckhqdq %xmm1, %xmm0
pshufd $177, %xmm2, %xmm5
pxor %xmm3, %xmm0
movdqa 960(%esp), %xmm1
movdqa 976(%esp), %xmm2
pshufd $177, %xmm0, %xmm0
paddq %xmm5, %xmm1
paddq %xmm0, %xmm2
paddq 336(%esp), %xmm4
paddq 320(%esp), %xmm3
pxor %xmm1, %xmm6
pxor %xmm2, %xmm7
movdqa %xmm2, 976(%esp)
movdqa %xmm6, %xmm2
psrlq $24, %xmm2
psllq $40, %xmm6
pxor %xmm6, %xmm2
movdqa %xmm7, %xmm6
paddq %xmm2, %xmm4
psrlq $24, %xmm6
psllq $40, %xmm7
pxor %xmm7, %xmm6
pxor %xmm4, %xmm5
paddq %xmm6, %xmm3
paddq 304(%esp), %xmm4
movdqa %xmm5, %xmm7
pxor %xmm3, %xmm0
psrlq $16, %xmm7
psllq $48, %xmm5
pxor %xmm5, %xmm7
movdqa %xmm0, %xmm5
paddq %xmm7, %xmm1
paddq 432(%esp), %xmm3
psrlq $16, %xmm5
psllq $48, %xmm0
pxor %xmm0, %xmm5
pxor %xmm1, %xmm2
movdqa 976(%esp), %xmm0
paddq %xmm5, %xmm0
movdqa %xmm1, 960(%esp)
movdqa %xmm2, %xmm1
pxor %xmm0, %xmm6
psrlq $63, %xmm1
psllq $1, %xmm2
pxor %xmm2, %xmm1
movdqa %xmm6, %xmm2
psrlq $63, %xmm2
psllq $1, %xmm6
pxor %xmm6, %xmm2
movdqa %xmm1, %xmm6
movdqa %xmm0, 976(%esp)
movdqa %xmm2, %xmm0
punpcklqdq %xmm1, %xmm1
punpcklqdq %xmm2, %xmm0
punpckhqdq %xmm1, %xmm2
movdqa %xmm7, %xmm1
punpckhqdq %xmm0, %xmm6
movdqa %xmm5, %xmm0
punpcklqdq %xmm7, %xmm1
paddq %xmm6, %xmm4
paddq %xmm2, %xmm3
punpckhqdq %xmm1, %xmm0
punpcklqdq %xmm5, %xmm5
pxor %xmm4, %xmm0
punpckhqdq %xmm5, %xmm7
pshufd $177, %xmm0, %xmm0
pxor %xmm3, %xmm7
movdqa 976(%esp), %xmm5
movdqa 960(%esp), %xmm1
pshufd $177, %xmm7, %xmm7
paddq %xmm0, %xmm5
paddq %xmm7, %xmm1
paddq 288(%esp), %xmm4
paddq 272(%esp), %xmm3
pxor %xmm5, %xmm6
pxor %xmm1, %xmm2
movdqa %xmm1, 960(%esp)
movdqa %xmm6, %xmm1
psrlq $24, %xmm1
psllq $40, %xmm6
pxor %xmm6, %xmm1
movdqa %xmm2, %xmm6
paddq %xmm1, %xmm4
psrlq $24, %xmm6
psllq $40, %xmm2
pxor %xmm2, %xmm6
pxor %xmm4, %xmm0
paddq %xmm6, %xmm3
paddq 448(%esp), %xmm4
movdqa %xmm0, %xmm2
pxor %xmm3, %xmm7
psrlq $16, %xmm2
psllq $48, %xmm0
pxor %xmm0, %xmm2
movdqa %xmm7, %xmm0
psrlq $16, %xmm0
psllq $48, %xmm7
pxor %xmm7, %xmm0
movdqa 960(%esp), %xmm7
paddq %xmm0, %xmm7
paddq %xmm2, %xmm5
paddq 256(%esp), %xmm3
pxor %xmm7, %xmm6
pxor %xmm5, %xmm1
movdqa %xmm5, 976(%esp)
movdqa %xmm6, %xmm5
movdqa %xmm7, 960(%esp)
movdqa %xmm1, %xmm7
psrlq $63, %xmm5
psllq $1, %xmm6
psrlq $63, %xmm7
psllq $1, %xmm1
pxor %xmm6, %xmm5
pxor %xmm1, %xmm7
movdqa %xmm5, %xmm1
movdqa %xmm7, %xmm6
punpcklqdq %xmm7, %xmm7
punpcklqdq %xmm5, %xmm1
punpckhqdq %xmm7, %xmm5
movdqa %xmm0, %xmm7
punpckhqdq %xmm1, %xmm6
movdqa %xmm2, %xmm1
punpcklqdq %xmm0, %xmm7
punpcklqdq %xmm2, %xmm2
paddq %xmm5, %xmm4
paddq %xmm6, %xmm3
punpckhqdq %xmm7, %xmm1
punpckhqdq %xmm2, %xmm0
pxor %xmm4, %xmm1
pxor %xmm3, %xmm0
pshufd $177, %xmm1, %xmm7
pshufd $177, %xmm0, %xmm1
movdqa 960(%esp), %xmm0
movdqa 976(%esp), %xmm2
paddq %xmm7, %xmm0
paddq %xmm1, %xmm2
paddq 416(%esp), %xmm4
paddq 240(%esp), %xmm3
pxor %xmm0, %xmm5
pxor %xmm2, %xmm6
movdqa %xmm2, 976(%esp)
movdqa %xmm5, %xmm2
psrlq $24, %xmm2
psllq $40, %xmm5
pxor %xmm5, %xmm2
movdqa %xmm6, %xmm5
paddq %xmm2, %xmm4
psrlq $24, %xmm5
psllq $40, %xmm6
pxor %xmm6, %xmm5
pxor %xmm4, %xmm7
paddq %xmm5, %xmm3
paddq 224(%esp), %xmm4
movdqa %xmm7, %xmm6
pxor %xmm3, %xmm1
psrlq $16, %xmm6
psllq $48, %xmm7
pxor %xmm7, %xmm6
movdqa %xmm1, %xmm7
psrlq $16, %xmm7
psllq $48, %xmm1
paddq %xmm6, %xmm0
paddq 208(%esp), %xmm3
pxor %xmm1, %xmm7
pxor %xmm0, %xmm2
movdqa 976(%esp), %xmm1
paddq %xmm7, %xmm1
movdqa %xmm1, 976(%esp)
pxor %xmm1, %xmm5
movdqa %xmm2, %xmm1
psllq $1, %xmm2
psrlq $63, %xmm1
pxor %xmm2, %xmm1
movdqa %xmm5, %xmm2
psrlq $63, %xmm2
psllq $1, %xmm5
pxor %xmm5, %xmm2
movdqa %xmm2, %xmm5
movdqa %xmm7, 848(%esp)
movdqa %xmm1, %xmm7
punpcklqdq %xmm2, %xmm5
punpckhqdq %xmm5, %xmm7
punpcklqdq %xmm1, %xmm1
movdqa %xmm7, 880(%esp)
punpckhqdq %xmm1, %xmm2
paddq %xmm7, %xmm4
movdqa 976(%esp), %xmm1
blake2b_blocks_sse2_L29:
movdqa %xmm2, 1168(%esp)
cmpl $128, %ecx
paddq %xmm2, %xmm3
movdqa 848(%esp), %xmm7
movdqa %xmm6, %xmm2
punpcklqdq %xmm6, %xmm2
movdqa %xmm7, %xmm5
punpckhqdq %xmm2, %xmm5
punpcklqdq %xmm7, %xmm7
pxor %xmm4, %xmm5
punpckhqdq %xmm7, %xmm6
pshufd $177, %xmm5, %xmm2
pxor %xmm3, %xmm6
pshufd $177, %xmm6, %xmm7
paddq %xmm2, %xmm1
paddq %xmm7, %xmm0
paddq 192(%esp), %xmm4
paddq 496(%esp), %xmm3
movdqa 880(%esp), %xmm6
movdqa 1168(%esp), %xmm5
pxor %xmm1, %xmm6
movdqa %xmm0, 960(%esp)
pxor %xmm0, %xmm5
movdqa %xmm6, %xmm0
psllq $40, %xmm6
psrlq $24, %xmm0
pxor %xmm6, %xmm0
movdqa %xmm5, %xmm6
paddq %xmm0, %xmm4
psrlq $24, %xmm6
psllq $40, %xmm5
pxor %xmm5, %xmm6
pxor %xmm4, %xmm2
paddq %xmm6, %xmm3
movdqa %xmm2, %xmm5
pxor %xmm3, %xmm7
psrlq $16, %xmm5
psllq $48, %xmm2
pxor %xmm2, %xmm5
movdqa %xmm7, %xmm2
paddq %xmm5, %xmm1
psrlq $16, %xmm2
psllq $48, %xmm7
pxor %xmm7, %xmm2
pxor %xmm1, %xmm0
movdqa 960(%esp), %xmm7
pxor %xmm3, %xmm1
paddq %xmm2, %xmm7
movdqa %xmm5, 1184(%esp)
movdqa %xmm0, %xmm5
pxor %xmm7, %xmm6
psrlq $63, %xmm5
psllq $1, %xmm0
pxor %xmm4, %xmm7
pxor %xmm0, %xmm5
movdqa %xmm6, %xmm0
movdqa 384(%esp), %xmm3
psrlq $63, %xmm0
movdqa 400(%esp), %xmm4
psllq $1, %xmm6
pxor %xmm1, %xmm3
pxor %xmm6, %xmm0
movdqa %xmm3, 384(%esp)
pxor %xmm7, %xmm4
movdqa 1184(%esp), %xmm3
movdqa %xmm2, %xmm6
movdqa %xmm5, %xmm7
movdqa %xmm3, %xmm1
movdqa %xmm4, 400(%esp)
movdqa %xmm0, %xmm4
punpcklqdq %xmm2, %xmm6
punpcklqdq %xmm5, %xmm7
punpcklqdq %xmm3, %xmm3
punpcklqdq %xmm0, %xmm0
punpckhqdq %xmm6, %xmm1
punpckhqdq %xmm7, %xmm4
punpckhqdq %xmm3, %xmm2
pxor %xmm4, %xmm1
punpckhqdq %xmm0, %xmm5
movdqa 480(%esp), %xmm6
pxor %xmm5, %xmm2
movdqa 464(%esp), %xmm0
pxor %xmm1, %xmm6
pxor %xmm2, %xmm0
movdqa %xmm6, 480(%esp)
movdqa %xmm0, 464(%esp)
ja blake2b_blocks_sse2_L25
blake2b_blocks_sse2_L26:
movl 8(%ebp), %eax
movdqa 464(%esp), %xmm7
movdqa 480(%esp), %xmm6
movdqa 384(%esp), %xmm5
movdqa 400(%esp), %xmm4
movdqa %xmm4, (%eax)
movdqa %xmm5, 16(%eax)
movdqa %xmm6, 32(%eax)
movdqa %xmm7, 48(%eax)
addl $1204, %esp
popl %ebx
popl %edi
popl %esi
movl %ebp, %esp
popl %ebp
ret

.align 16,0x90
.globl blake2b_blocks_x86
.globl _blake2b_blocks_x86
blake2b_blocks_x86:
_blake2b_blocks_x86:
pushl %esi
pushl %edi
pushl %ebx
pushl %ebp
subl $492, %esp
movl 512(%esp), %eax
call blake2b_blocks_x86_LL2
blake2b_blocks_x86_LL2:
popl %ecx
leal _GLOBAL_OFFSET_TABLE_+1(%ecx), %ecx
movl 80(%eax), %ebp
movl %ebp, %edi
movl 84(%eax), %ebx
xorl $-79577749, %edi
movl %edi, 144(%esp)
movl %ebx, %edi
xorl $528734635, %edi
movl %edi, 148(%esp)
movl 88(%eax), %edi
movl 92(%eax), %eax
xorl $327033209, %edi
xorl $1541459225, %eax
movl %edi, 152(%esp)
lea 192+blake2b_sigma@GOTOFF(%ecx), %edi
movl 516(%esp), %esi
orl %ebx, %ebp
movl 520(%esp), %edx
movl %edi, 360(%esp)
jne blake2b_blocks_x86_L2
blake2b_blocks_x86_L32:
cmpl $128, %edx
jmp blake2b_blocks_x86_L21
blake2b_blocks_x86_L2:
cmpl $128, %edx
je blake2b_blocks_x86_L21
blake2b_blocks_x86_L3:
testb $64, %dl
lea (%esp), %ebp
je blake2b_blocks_x86_L5
blake2b_blocks_x86_L4:
movl (%esi), %ebx
movl 4(%esi), %ebp
movl %ebx, (%esp)
movl %ebp, 4(%esp)
movl 8(%esi), %edi
movl 12(%esi), %ebx
movl %edi, 8(%esp)
movl %ebx, 12(%esp)
movl 16(%esi), %ebp
movl 20(%esi), %edi
movl %ebp, 16(%esp)
movl %edi, 20(%esp)
movl 24(%esi), %ebx
movl 28(%esi), %ebp
movl %ebx, 24(%esp)
movl %ebp, 28(%esp)
movl 32(%esi), %edi
movl 36(%esi), %ebx
movl %edi, 32(%esp)
movl %ebx, 36(%esp)
movl 40(%esi), %ebp
movl 44(%esi), %edi
movl %ebp, 40(%esp)
movl %edi, 44(%esp)
movl 48(%esi), %ebx
movl 52(%esi), %ebp
movl %ebx, 48(%esp)
movl %ebp, 52(%esp)
lea 64(%esp), %ebp
movl 56(%esi), %edi
movl 60(%esi), %ebx
addl $64, %esi
movl %edi, 56(%esp)
movl %ebx, 60(%esp)
jmp blake2b_blocks_x86_L6
blake2b_blocks_x86_L5:
xorl %ebx, %ebx
movl %ebx, 64(%esp)
movl %ebx, 68(%esp)
movl %ebx, 72(%esp)
movl %ebx, 76(%esp)
movl %ebx, 80(%esp)
movl %ebx, 84(%esp)
movl %ebx, 88(%esp)
movl %ebx, 92(%esp)
movl %ebx, 96(%esp)
movl %ebx, 100(%esp)
movl %ebx, 104(%esp)
movl %ebx, 108(%esp)
movl %ebx, 112(%esp)
movl %ebx, 116(%esp)
movl %ebx, 120(%esp)
movl %ebx, 124(%esp)
blake2b_blocks_x86_L6:
xorl %ebx, %ebx
testb $32, %dl
movl %ebx, (%ebp)
movl %ebx, 4(%ebp)
movl %ebx, 8(%ebp)
movl %ebx, 12(%ebp)
movl %ebx, 16(%ebp)
movl %ebx, 20(%ebp)
movl %ebx, 24(%ebp)
movl %ebx, 28(%ebp)
movl %ebx, 32(%ebp)
movl %ebx, 36(%ebp)
movl %ebx, 40(%ebp)
movl %ebx, 44(%ebp)
movl %ebx, 48(%ebp)
movl %ebx, 52(%ebp)
movl %ebx, 56(%ebp)
movl %ebx, 60(%ebp)
je blake2b_blocks_x86_L8
blake2b_blocks_x86_L7:
movl (%esi), %ebx
movl 4(%esi), %edi
movl %ebx, (%ebp)
movl %edi, 4(%ebp)
movl 8(%esi), %ebx
movl 12(%esi), %edi
movl %ebx, 8(%ebp)
movl %edi, 12(%ebp)
movl 16(%esi), %ebx
movl 20(%esi), %edi
movl %ebx, 16(%ebp)
movl %edi, 20(%ebp)
movl 24(%esi), %ebx
movl 28(%esi), %edi
addl $32, %esi
movl %ebx, 24(%ebp)
movl %edi, 28(%ebp)
addl $32, %ebp
blake2b_blocks_x86_L8:
testb $16, %dl
je blake2b_blocks_x86_L10
blake2b_blocks_x86_L9:
movl (%esi), %ebx
movl 4(%esi), %edi
movl %ebx, (%ebp)
movl %edi, 4(%ebp)
movl 8(%esi), %ebx
movl 12(%esi), %edi
addl $16, %esi
movl %ebx, 8(%ebp)
movl %edi, 12(%ebp)
addl $16, %ebp
blake2b_blocks_x86_L10:
testb $8, %dl
je blake2b_blocks_x86_L12
blake2b_blocks_x86_L11:
movl (%esi), %ebx
movl 4(%esi), %edi
addl $8, %esi
movl %ebx, (%ebp)
movl %edi, 4(%ebp)
addl $8, %ebp
blake2b_blocks_x86_L12:
testb $4, %dl
je blake2b_blocks_x86_L14
blake2b_blocks_x86_L13:
movl (%esi), %ebx
addl $4, %esi
movl %ebx, (%ebp)
addl $4, %ebp
blake2b_blocks_x86_L14:
testb $2, %dl
je blake2b_blocks_x86_L16
blake2b_blocks_x86_L15:
movzwl (%esi), %ebx
addl $2, %esi
movw %bx, (%ebp)
addl $2, %ebp
blake2b_blocks_x86_L16:
testb $1, %dl
je blake2b_blocks_x86_L18
blake2b_blocks_x86_L17:
movzbl (%esi), %ebx
movb %bl, (%ebp)
blake2b_blocks_x86_L18:
cmpl $128, %edx
lea (%esp), %esi
blake2b_blocks_x86_L21:
movl 512(%esp), %ebp
lea blake2b_sigma@GOTOFF(%ecx), %ecx
movl %esi, 236(%esp)
movl %ecx, 128(%esp)
movl 68(%ebp), %edi
movl %edi, 228(%esp)
movl 60(%ebp), %edi
movl %edi, 196(%esp)
movl 72(%ebp), %edi
movl %edi, 164(%esp)
movl 76(%ebp), %edi
movl %edi, 200(%esp)
movl 24(%ebp), %edi
movl %edi, 176(%esp)
movl 28(%ebp), %edi
movl %edi, 208(%esp)
movl 16(%ebp), %edi
movl %edi, 184(%esp)
movl 20(%ebp), %edi
movl %edi, 216(%esp)
movl 48(%ebp), %edi
movl %edi, 168(%esp)
movl 52(%ebp), %edi
movl %edi, 204(%esp)
movl 8(%ebp), %edi
movl 64(%ebp), %ebx
movl %edi, 156(%esp)
movl 12(%ebp), %edi
movl %ebx, 192(%esp)
movl 56(%ebp), %ebx
movl %edi, 224(%esp)
movl 40(%ebp), %edi
movl %ebx, 172(%esp)
movl %edx, %ebx
movl %edi, 160(%esp)
movl 44(%ebp), %edi
jbe blake2b_blocks_x86_LL3
movl $128, %ebx
blake2b_blocks_x86_LL3:
movl %edi, 212(%esp)
movl (%ebp), %edi
movl %edi, 180(%esp)
movl 4(%ebp), %edi
movl %edi, 232(%esp)
movl 32(%ebp), %edi
movl 36(%ebp), %ebp
movl %edi, 188(%esp)
movl %ebp, 220(%esp)
movl %eax, 132(%esp)
movl %ebx, 136(%esp)
movl %edx, 140(%esp)
movl 512(%esp), %esi
jmp blake2b_blocks_x86_L22
blake2b_blocks_x86_L28:
movl 524(%esp), %eax
movl 140(%esp), %edx
addl $-128, %edx
addl %eax, 236(%esp)
movl %edx, 140(%esp)
blake2b_blocks_x86_L22:
movl 136(%esp), %edx
xorl %ebx, %ebx
movl 192(%esp), %eax
addl %edx, %eax
movl 228(%esp), %ecx
adcl $0, %ecx
movl %eax, 192(%esp)
movl %eax, 64(%esi)
subl %edx, %eax
movl %ecx, 228(%esp)
movl %ecx, 68(%esi)
sbbl %ebx, %ecx
jae blake2b_blocks_x86_L25
blake2b_blocks_x86_L23:
movl 164(%esp), %eax
addl $1, %eax
movl 200(%esp), %edx
adcl $0, %edx
movl %eax, 164(%esp)
movl %edx, 200(%esp)
movl %eax, 72(%esi)
movl %edx, 76(%esi)
blake2b_blocks_x86_L25:
movl 152(%esp), %eax
movl %eax, 312(%esp)
movl 172(%esp), %ebp
movl 196(%esp), %ebx
movl 144(%esp), %eax
movl 184(%esp), %edi
movl %ebp, 284(%esp)
movl %ebx, 288(%esp)
movl %eax, 296(%esp)
movl 168(%esp), %ebp
movl 204(%esp), %ebx
movl 212(%esp), %eax
movl %edi, 332(%esp)
movl %ebp, 276(%esp)
movl %ebx, 280(%esp)
movl 148(%esp), %edi
movl %eax, 272(%esp)
movl 224(%esp), %ebp
movl 160(%esp), %ebx
movl 188(%esp), %eax
movl 208(%esp), %ecx
movl %edi, 300(%esp)
movl %ebp, 248(%esp)
movl %ebx, 268(%esp)
movl 180(%esp), %edi
movl %eax, 260(%esp)
movl 176(%esp), %edx
movl 164(%esp), %ebp
movl 232(%esp), %ebx
xorl $725511199, %ebp
movl 128(%esp), %eax
movl %ebp, 348(%esp)
movl %ecx, 256(%esp)
movl 200(%esp), %ebp
movl 216(%esp), %ecx
xorl $-1694144372, %ebp
movl %edi, 240(%esp)
movl %edx, 316(%esp)
movl %ebx, 244(%esp)
movl 220(%esp), %edi
movl %eax, 292(%esp)
movl 192(%esp), %ebx
xorl $-1377402159, %ebx
movl %ebx, 352(%esp)
movl %ecx, 252(%esp)
movl 228(%esp), %ebx
movl %ebp, 356(%esp)
xorl $1359893119, %ebx
movl 132(%esp), %edx
movl 156(%esp), %ecx
movl 332(%esp), %ebp
movl 316(%esp), %esi
movl %edi, 264(%esp)
movl $1595750129, 308(%esp)
movl $-1521486534, 304(%esp)
movl $-23791573, 324(%esp)
movl $1013904242, 320(%esp)
movl $-2067093701, 340(%esp)
movl $-1150833019, 336(%esp)
movl $-205731576, 328(%esp)
movl $1779033703, 344(%esp)
blake2b_blocks_x86_L26:
movl %esi, 316(%esp)
movl %edx, 368(%esp)
movzbl (%eax), %esi
movl 236(%esp), %edx
movl %ecx, 364(%esp)
movl 240(%esp), %ecx
addl (%esi,%edx), %ecx
movl %ebp, 332(%esp)
movl 244(%esp), %ebp
adcl 4(%esi,%edx), %ebp
movl 260(%esp), %edx
addl %edx, %ecx
movl 264(%esp), %esi
adcl %esi, %ebp
xorl %ebp, %ebx
movl 352(%esp), %edi
movl %ecx, 240(%esp)
xorl %ecx, %edi
movl 328(%esp), %ecx
addl %ebx, %ecx
movl %ebx, 372(%esp)
movl 344(%esp), %ebx
adcl %edi, %ebx
xorl %ecx, %edx
xorl %ebx, %esi
movl %edi, 352(%esp)
movl %edx, %edi
movl %ecx, 328(%esp)
movl %esi, %ecx
shrl $24, %esi
shll $8, %edx
orl %edx, %esi
movl %esi, 264(%esp)
movzbl 2(%eax), %edx
movl 236(%esp), %esi
shll $8, %ecx
shrl $24, %edi
orl %edi, %ecx
movl %ecx, 376(%esp)
movl 364(%esp), %ecx
addl (%edx,%esi), %ecx
movl 248(%esp), %edi
movl %ebp, 244(%esp)
movl 268(%esp), %ebp
adcl 4(%edx,%esi), %edi
addl %ebp, %ecx
movl 272(%esp), %edx
adcl %edx, %edi
movl %ebx, 344(%esp)
movl %ecx, 364(%esp)
movl 348(%esp), %ebx
xorl %ecx, %ebx
movl 356(%esp), %ecx
xorl %edi, %ecx
movl %edi, 248(%esp)
movl 340(%esp), %edi
addl %ecx, %edi
movl %ecx, 356(%esp)
movl 336(%esp), %ecx
adcl %ebx, %ecx
xorl %edi, %ebp
xorl %ecx, %edx
movl %ebx, 348(%esp)
movl %edx, %ebx
movl %edi, 340(%esp)
movl %ebp, %edi
shrl $24, %edx
shll $8, %ebp
orl %ebp, %edx
movzbl 4(%eax), %ebp
movl %ecx, 336(%esp)
shll $8, %ebx
shrl $24, %edi
movl 332(%esp), %ecx
orl %edi, %ebx
addl (%ebp,%esi), %ecx
movl 252(%esp), %edi
adcl 4(%ebp,%esi), %edi
movl 276(%esp), %ebp
addl %ebp, %ecx
movl %edx, 272(%esp)
movl 280(%esp), %edx
adcl %edx, %edi
movl %ebx, 380(%esp)
movl %ecx, 332(%esp)
movl 296(%esp), %ebx
xorl %ecx, %ebx
movl 300(%esp), %ecx
xorl %edi, %ecx
movl %edi, 252(%esp)
movl 324(%esp), %edi
addl %ecx, %edi
movl %ecx, 300(%esp)
movl 320(%esp), %ecx
adcl %ebx, %ecx
xorl %edi, %ebp
xorl %ecx, %edx
movl %ebx, 296(%esp)
movl %edx, %ebx
movl %edi, 324(%esp)
movl %ebp, %edi
shrl $24, %edx
shll $8, %ebp
orl %ebp, %edx
movl %edx, 280(%esp)
movzbl 6(%eax), %edx
movl %ecx, 320(%esp)
shll $8, %ebx
shrl $24, %edi
movl 316(%esp), %ecx
orl %edi, %ebx
addl (%edx,%esi), %ecx
movl 256(%esp), %edi
movl 284(%esp), %ebp
adcl 4(%edx,%esi), %edi
addl %ebp, %ecx
movl 288(%esp), %edx
adcl %edx, %edi
movl %ebx, 384(%esp)
movl %ecx, 316(%esp)
movl 312(%esp), %ebx
xorl %ecx, %ebx
movl 368(%esp), %ecx
xorl %edi, %ecx
movl %edi, 256(%esp)
movl 308(%esp), %edi
addl %ecx, %edi
movl %ecx, 368(%esp)
movl 304(%esp), %ecx
adcl %ebx, %ecx
xorl %edi, %ebp
xorl %ecx, %edx
movl %ebx, 312(%esp)
movl %edx, %ebx
movl %edi, 308(%esp)
movl %ebp, %edi
shrl $24, %edx
shll $8, %ebp
orl %ebp, %edx
movzbl 5(%eax), %ebp
movl %ecx, 304(%esp)
shll $8, %ebx
movl (%ebp,%esi), %ecx
addl 332(%esp), %ecx
movl 4(%ebp,%esi), %esi
adcl 252(%esp), %esi
shrl $24, %edi
orl %edi, %ebx
movl %ebx, 388(%esp)
movl 384(%esp), %ebx
addl %ebx, %ecx
movl %edx, 288(%esp)
movl 280(%esp), %edx
adcl %edx, %esi
movl 300(%esp), %ebp
movl 296(%esp), %edi
xorl %ecx, %ebp
xorl %esi, %edi
movl %ecx, 392(%esp)
movl %ebp, %ecx
movl %esi, 396(%esp)
movl %edi, %esi
shll $16, %esi
shrl $16, %ecx
shrl $16, %edi
orl %ecx, %esi
shll $16, %ebp
orl %ebp, %edi
movl 324(%esp), %ebp
addl %esi, %ebp
movl %esi, 400(%esp)
movl 320(%esp), %esi
adcl %edi, %esi
xorl %ebp, %ebx
xorl %esi, %edx
movl %esi, 320(%esp)
movl %edx, %esi
movl %edi, 296(%esp)
movl %ebx, %edi
shrl $31, %esi
addl %ebx, %ebx
shrl $31, %edi
addl %edx, %edx
orl %ebx, %esi
orl %edx, %edi
movl %esi, 408(%esp)
movzbl 7(%eax), %edx
movl 236(%esp), %esi
movl %edi, 404(%esp)
movl 288(%esp), %edi
movl (%edx,%esi), %ebx
addl 316(%esp), %ebx
movl 4(%edx,%esi), %ecx
movl 388(%esp), %edx
adcl 256(%esp), %ecx
addl %edx, %ebx
movl %ebp, 324(%esp)
adcl %edi, %ecx
movl 368(%esp), %ebp
movl 312(%esp), %esi
xorl %ebx, %ebp
xorl %ecx, %esi
movl %ebx, 412(%esp)
movl %ebp, %ebx
movl %ecx, 416(%esp)
movl %esi, %ecx
shll $16, %ecx
shrl $16, %ebx
shrl $16, %esi
orl %ebx, %ecx
shll $16, %ebp
orl %ebp, %esi
movl 308(%esp), %ebp
addl %ecx, %ebp
movl %ecx, 420(%esp)
movl 304(%esp), %ecx
adcl %esi, %ecx
xorl %ebp, %edx
movl %esi, 312(%esp)
xorl %ecx, %edi
movl %edx, %esi
movl %edi, %ebx
shrl $31, %esi
addl %edi, %edi
orl %edi, %esi
addl %edx, %edx
movl %esi, 424(%esp)
movzbl 3(%eax), %edi
movl 236(%esp), %esi
shrl $31, %ebx
orl %edx, %ebx
movl (%edi,%esi), %edx
addl 364(%esp), %edx
movl %ecx, 304(%esp)
movl 4(%edi,%esi), %ecx
movl 380(%esp), %edi
adcl 248(%esp), %ecx
addl %edi, %edx
movl 272(%esp), %esi
adcl %esi, %ecx
movl %ebp, 308(%esp)
movl %ebx, 428(%esp)
movl 356(%esp), %ebx
movl 348(%esp), %ebp
xorl %edx, %ebx
xorl %ecx, %ebp
movl %edx, 432(%esp)
movl %ebp, %edx
movl %ecx, 436(%esp)
movl %ebx, %ecx
shll $16, %edx
shrl $16, %ecx
shrl $16, %ebp
orl %ecx, %edx
shll $16, %ebx
orl %ebx, %ebp
movl 340(%esp), %ebx
addl %edx, %ebx
movl %edx, 440(%esp)
movl 336(%esp), %edx
adcl %ebp, %edx
xorl %ebx, %edi
movl %ebx, 340(%esp)
xorl %edx, %esi
movl %edi, %ebx
movl %esi, %ecx
shrl $31, %ebx
addl %esi, %esi
movl %edx, 336(%esp)
orl %esi, %ebx
movzbl 1(%eax), %esi
addl %edi, %edi
movl 236(%esp), %edx
shrl $31, %ecx
orl %edi, %ecx
movl (%esi,%edx), %edi
addl 240(%esp), %edi
movl %ebp, 348(%esp)
movl 4(%esi,%edx), %ebp
movl 376(%esp), %esi
adcl 244(%esp), %ebp
addl %esi, %edi
movl %ecx, 448(%esp)
movl 264(%esp), %ecx
adcl %ecx, %ebp
movl %ebx, 444(%esp)
movl 372(%esp), %ebx
movl 352(%esp), %edx
xorl %edi, %ebx
xorl %ebp, %edx
movl %edi, 452(%esp)
movl %edx, %edi
movl %ebp, 456(%esp)
movl %ebx, %ebp
shll $16, %edi
shrl $16, %ebp
shrl $16, %edx
orl %ebp, %edi
shll $16, %ebx
orl %ebx, %edx
movl 328(%esp), %ebx
addl %edi, %ebx
movl %edi, 460(%esp)
movl 344(%esp), %edi
adcl %edx, %edi
xorl %ebx, %esi
movl %edx, 352(%esp)
xorl %edi, %ecx
movl %esi, %edx
addl %esi, %esi
movl %ebx, 328(%esp)
movl %ecx, %ebx
shrl $31, %edx
addl %ecx, %ecx
movl %edi, 344(%esp)
orl %ecx, %edx
movzbl 8(%eax), %edi
movl 236(%esp), %ecx
shrl $31, %ebx
orl %esi, %ebx
movl %ebx, 468(%esp)
movl 452(%esp), %ebx
addl (%edi,%ecx), %ebx
movl 456(%esp), %esi
movl %edx, 464(%esp)
movl 448(%esp), %edx
adcl 4(%edi,%ecx), %esi
addl %edx, %ebx
movl 444(%esp), %edi
adcl %edi, %esi
movl 420(%esp), %ebp
movl %ebx, 452(%esp)
xorl %ebx, %ebp
movl 312(%esp), %ebx
xorl %esi, %ebx
movl %esi, 456(%esp)
movl 324(%esp), %esi
addl %ebx, %esi
movl %ebx, 312(%esp)
movl 320(%esp), %ebx
adcl %ebp, %ebx
xorl %esi, %edx
xorl %ebx, %edi
movl %ebp, 420(%esp)
movzbl 10(%eax), %ebp
movl %esi, 324(%esp)
movl %edx, %esi
movl %ebx, 320(%esp)
movl %edi, %ebx
shll $8, %ebx
shrl $24, %esi
orl %esi, %ebx
movl %ebx, 472(%esp)
movl (%ebp,%ecx), %ebx
addl 432(%esp), %ebx
movl 4(%ebp,%ecx), %esi
adcl 436(%esp), %esi
shrl $24, %edi
shll $8, %edx
orl %edx, %edi
movl 408(%esp), %edx
addl %edx, %ebx
movl %edi, 444(%esp)
movl 404(%esp), %edi
adcl %edi, %esi
movl 460(%esp), %ebp
movl %ebx, 364(%esp)
xorl %ebx, %ebp
movl 352(%esp), %ebx
xorl %esi, %ebx
movl %esi, 248(%esp)
movl 308(%esp), %esi
addl %ebx, %esi
movl %ebx, 352(%esp)
movl 304(%esp), %ebx
adcl %ebp, %ebx
xorl %esi, %edx
xorl %ebx, %edi
movl %esi, 308(%esp)
movl %edx, %esi
movl %ebx, 304(%esp)
movl %edi, %ebx
shrl $24, %edi
shll $8, %edx
orl %edx, %edi
movl %edi, 404(%esp)
movzbl 12(%eax), %edi
movl %ebp, 460(%esp)
shll $8, %ebx
shrl $24, %esi
movl (%edi,%ecx), %ebp
orl %esi, %ebx
addl 392(%esp), %ebp
movl 4(%edi,%ecx), %esi
movl 428(%esp), %edx
adcl 396(%esp), %esi
addl %edx, %ebp
movl %ebx, 476(%esp)
movl 424(%esp), %ebx
adcl %ebx, %esi
movl 440(%esp), %edi
movl %ebp, 332(%esp)
xorl %ebp, %edi
movl 348(%esp), %ebp
xorl %esi, %ebp
movl %esi, 252(%esp)
movl 328(%esp), %esi
addl %ebp, %esi
movl %ebp, 348(%esp)
movl 344(%esp), %ebp
adcl %edi, %ebp
xorl %esi, %edx
xorl %ebp, %ebx
movl %esi, 328(%esp)
movl %edx, %esi
movl %ebp, 344(%esp)
movl %ebx, %ebp
shrl $24, %ebx
shll $8, %edx
orl %edx, %ebx
movzbl 14(%eax), %edx
movl %eax, 292(%esp)
shll $8, %ebp
shrl $24, %esi
movl (%edx,%ecx), %eax
orl %esi, %ebp
addl 412(%esp), %eax
movl 4(%edx,%ecx), %esi
movl 468(%esp), %ecx
adcl 416(%esp), %esi
addl %ecx, %eax
movl 464(%esp), %edx
adcl %edx, %esi
movl %edi, 440(%esp)
movl %eax, 316(%esp)
movl 400(%esp), %edi
xorl %eax, %edi
movl 296(%esp), %eax
xorl %esi, %eax
movl %esi, 256(%esp)
movl 340(%esp), %esi
addl %eax, %esi
movl %eax, 296(%esp)
movl 336(%esp), %eax
adcl %edi, %eax
xorl %esi, %ecx
xorl %eax, %edx
movl %edi, 400(%esp)
movl %ecx, %edi
movl %esi, 340(%esp)
movl %edx, %esi
shrl $24, %edx
shll $8, %ecx
orl %ecx, %edx
movl %edx, 464(%esp)
movl 292(%esp), %edx
shll $8, %esi
shrl $24, %edi
orl %edi, %esi
movzbl 13(%edx), %edi
movl 236(%esp), %edx
movl 332(%esp), %ecx
addl %ebp, %ecx
movl %eax, 336(%esp)
movl 252(%esp), %eax
adcl %ebx, %eax
addl (%edi,%edx), %ecx
movl %ecx, 332(%esp)
adcl 4(%edi,%edx), %eax
movl 348(%esp), %edi
movl 440(%esp), %edx
xorl %ecx, %edi
xorl %eax, %edx
movl %edi, %ecx
movl %eax, 252(%esp)
movl %edx, %eax
shll $16, %eax
shrl $16, %ecx
shrl $16, %edx
orl %ecx, %eax
shll $16, %edi
orl %edx, %edi
movl 328(%esp), %edx
addl %eax, %edx
movl %eax, 348(%esp)
movl 344(%esp), %eax
adcl %edi, %eax
xorl %edx, %ebp
xorl %eax, %ebx
movl %eax, 344(%esp)
movl %ebx, %eax
movl %edi, 356(%esp)
movl %ebp, %edi
shrl $31, %eax
addl %ebp, %ebp
orl %ebp, %eax
addl %ebx, %ebx
movl %eax, 284(%esp)
movl 292(%esp), %eax
shrl $31, %edi
orl %ebx, %edi
movl %edi, 288(%esp)
movzbl 15(%eax), %ebx
movl 236(%esp), %edi
movl 316(%esp), %ebp
addl %esi, %ebp
movl %edx, 328(%esp)
movl 256(%esp), %edx
movl 464(%esp), %ecx
adcl %ecx, %edx
addl (%ebx,%edi), %ebp
movl %ebp, 316(%esp)
adcl 4(%ebx,%edi), %edx
movl 296(%esp), %edi
movl 400(%esp), %ebx
xorl %ebp, %edi
xorl %edx, %ebx
movl %edi, %ebp
movl %edx, 256(%esp)
movl %ebx, %edx
shll $16, %edx
shrl $16, %ebp
shrl $16, %ebx
orl %ebp, %edx
shll $16, %edi
orl %ebx, %edi
movl 340(%esp), %ebx
addl %edx, %ebx
movl %edx, 296(%esp)
movl 336(%esp), %edx
adcl %edi, %edx
xorl %ebx, %esi
xorl %edx, %ecx
movl %edx, 336(%esp)
movl %ecx, %edx
movl %edi, 300(%esp)
movl %esi, %edi
shrl $31, %edx
addl %esi, %esi
shrl $31, %edi
addl %ecx, %ecx
movl %ebx, 340(%esp)
orl %esi, %edx
movzbl 11(%eax), %ebp
orl %ecx, %edi
movl 236(%esp), %ebx
movl %edx, 260(%esp)
movl 364(%esp), %ecx
movl 476(%esp), %edx
addl %edx, %ecx
movl %edi, 264(%esp)
movl 248(%esp), %edi
movl 404(%esp), %esi
adcl %esi, %edi
addl (%ebp,%ebx), %ecx
movl %ecx, 364(%esp)
adcl 4(%ebp,%ebx), %edi
movl 352(%esp), %ebp
movl 460(%esp), %ebx
xorl %ecx, %ebp
xorl %edi, %ebx
movl %ebp, %ecx
movl %edi, 248(%esp)
movl %ebx, %edi
shll $16, %edi
shrl $16, %ecx
shrl $16, %ebx
orl %ecx, %edi
shll $16, %ebp
orl %ebx, %ebp
movl 308(%esp), %ebx
addl %edi, %ebx
movl %edi, 352(%esp)
movl 304(%esp), %edi
adcl %ebp, %edi
xorl %ebx, %edx
xorl %edi, %esi
movl %edi, 304(%esp)
movl %esi, %edi
movl %ebp, 372(%esp)
movl %edx, %ebp
shrl $31, %edi
addl %edx, %edx
shrl $31, %ebp
addl %esi, %esi
movzbl 9(%eax), %ecx
orl %edx, %edi
movl 236(%esp), %edx
orl %esi, %ebp
movl %ebx, 308(%esp)
addl $16, %eax
movl %edi, 276(%esp)
movl 452(%esp), %ebx
movl 472(%esp), %edi
addl %edi, %ebx
movl %ebp, 280(%esp)
movl 456(%esp), %ebp
movl 444(%esp), %esi
adcl %esi, %ebp
addl (%ecx,%edx), %ebx
movl %ebx, 240(%esp)
adcl 4(%ecx,%edx), %ebp
movl 312(%esp), %edx
movl 420(%esp), %ecx
xorl %ebx, %edx
xorl %ebp, %ecx
movl %ebp, 244(%esp)
movl %ecx, %ebx
movl %edx, %ebp
shll $16, %ebx
shrl $16, %ebp
shrl $16, %ecx
orl %ebp, %ebx
shll $16, %edx
orl %ecx, %edx
movl 324(%esp), %ecx
addl %ebx, %ecx
movl %ebx, 312(%esp)
movl 320(%esp), %ebx
adcl %edx, %ebx
xorl %ecx, %edi
xorl %ebx, %esi
movl %edi, %ebp
movl %ecx, 324(%esp)
movl %esi, %ecx
shrl $31, %ecx
addl %edi, %edi
shrl $31, %ebp
addl %esi, %esi
orl %esi, %ebp
orl %edi, %ecx
movl %ebx, 320(%esp)
movl %ebp, 272(%esp)
movl %ecx, 268(%esp)
movl 332(%esp), %ebp
movl 316(%esp), %esi
movl 364(%esp), %ecx
movl 372(%esp), %ebx
cmpl 360(%esp), %eax
jb blake2b_blocks_x86_L26
blake2b_blocks_x86_L27:
movl 328(%esp), %edi
xorl 240(%esp), %edi
movl %esi, 316(%esp)
movl 512(%esp), %esi
movl 180(%esp), %eax
movl %edx, 368(%esp)
xorl %edi, %eax
movl 344(%esp), %edx
movl %eax, 180(%esp)
movl %eax, (%esi)
movl 340(%esp), %eax
xorl %ecx, %eax
movl 336(%esp), %ecx
xorl 244(%esp), %edx
xorl 248(%esp), %ecx
movl 232(%esp), %edi
xorl %edx, %edi
movl 156(%esp), %edx
xorl %eax, %edx
movl 224(%esp), %eax
movl %edi, 232(%esp)
xorl %ecx, %eax
movl %edi, 4(%esi)
movl %ebp, 332(%esp)
movl %eax, 224(%esp)
movl %eax, 12(%esi)
movl 324(%esp), %edi
movl 320(%esp), %eax
xorl 332(%esp), %edi
xorl 252(%esp), %eax
movl %edx, 156(%esp)
movl %edx, 8(%esi)
movl 184(%esp), %edx
movl 216(%esp), %ecx
xorl %edi, %edx
movl %edx, 184(%esp)
xorl %eax, %ecx
movl %edx, 16(%esi)
movl 308(%esp), %eax
movl 304(%esp), %edx
xorl 316(%esp), %eax
xorl 256(%esp), %edx
movl 176(%esp), %edi
xorl 264(%esp), %ebx
xorl %eax, %edi
movl 208(%esp), %eax
xorl %edx, %eax
movl %eax, 208(%esp)
movl %eax, 28(%esi)
movl 352(%esp), %edx
movl 220(%esp), %eax
movl 356(%esp), %ebp
xorl %ebx, %eax
movl 348(%esp), %ebx
xorl 260(%esp), %edx
xorl 268(%esp), %ebx
xorl 272(%esp), %ebp
movl %ecx, 216(%esp)
movl %ecx, 20(%esi)
movl 188(%esp), %ecx
movl %eax, 220(%esp)
xorl %edx, %ecx
movl %eax, 36(%esi)
movl 160(%esp), %eax
movl 212(%esp), %edx
xorl %ebx, %eax
xorl %ebp, %edx
movl 296(%esp), %ebp
movl %eax, 160(%esp)
movl %eax, 40(%esi)
movl %edi, 176(%esp)
movl %edi, 24(%esi)
movl 300(%esp), %eax
movl 312(%esp), %ebx
movl 368(%esp), %edi
xorl 276(%esp), %ebp
xorl 280(%esp), %eax
xorl 284(%esp), %ebx
xorl 288(%esp), %edi
movl %edx, 212(%esp)
movl %edx, 44(%esi)
movl 168(%esp), %edx
movl %ecx, 188(%esp)
xorl %ebp, %edx
movl %ecx, 32(%esi)
movl %edx, 168(%esp)
movl 204(%esp), %ecx
movl %edx, 48(%esi)
xorl %eax, %ecx
movl 172(%esp), %eax
movl 196(%esp), %edx
xorl %ebx, %eax
xorl %edi, %edx
movl %ecx, 204(%esp)
movl %ecx, 52(%esi)
movl %eax, 172(%esp)
movl %edx, 196(%esp)
movl %eax, 56(%esi)
movl %edx, 60(%esi)
cmpl $128, 140(%esp)
ja blake2b_blocks_x86_L28
blake2b_blocks_x86_L29:
addl $492, %esp
popl %ebp
popl %ebx
popl %edi
popl %esi
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

