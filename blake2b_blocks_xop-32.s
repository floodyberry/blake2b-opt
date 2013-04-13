.text

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


