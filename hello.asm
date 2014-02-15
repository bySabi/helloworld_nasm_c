bits 32
extern printf

global hello
global maxofthree


section .data
	message db "Hello world!!", 10, 0

section .text

hello:
	pushad 
	push dword message
	call printf 
	add esp, 4 
	popad 
	ret

maxofthree:
	mov eax, [esp+4]
	mov ecx, [esp+8]
	mov edx, [esp+12]
	cmp eax, ecx
	cmovl eax, ecx
	cmp eax, edx
	cmovl eax, edx
	ret
