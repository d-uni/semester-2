%include "io.inc"

section .rodata
 LC0 db "%d", 0 ; Форматная строка для scanf
 LC1 db `%d\n`, 0 ; Форматная строка для printf
 
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov esi,dword[esp]
    ;write your code here
    mov edi,0
    .l:
     mov ebp, esp
     sub esp, 16
 lea ebx, [ebp]
 mov dword [esp+4], ebx
 mov dword [esp], LC0
 call scanf
 mov eax,dword [ebp]
 cmp eax,0
 je .end
 
 add esp,12
 add edi,1
 jmp .l
 
 .end:
 
 
 
  add esp,16
 PRINT_DEC 4,edi
 imul edi,4
 add esp,edi
 mov dword[esp],esi
    xor eax, eax
    ret
