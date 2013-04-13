.text

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


