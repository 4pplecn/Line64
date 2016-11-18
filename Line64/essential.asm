
extern dl_resolv64:far
.DATA			
SRBP	DQ 0 
SRIP	DQ 0 

.code
hook_dl_resolv64 PROC
	mov  rax, [rsp+10h]

	mov  rbx, [rsp+8h]

	add  rsp, 18h
	push r9
	push r8
	push rax
	push rdi
	push rsi
	push rdx
	push rcx
	mov rcx, rbx
	sub  rsp, 10h
	call dl_resolv64
	add  rsp, 10h
	pop r9
	pop r8
	pop rdx
	pop rcx
	mov rbx, [rsp]
	sub rsp,18h
	push rbx
	jmp rax
	add rsp,20h
	ret
hook_dl_resolv64 ENDP
hook_main PROC
	mov rdi, rdx
	mov rsi, r8
	call rcx
	ret
hook_main ENDP
END