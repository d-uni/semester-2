;Задача 03-1: НОД четырёх
;На вход программе со стандартного потока ввода подаются четыре натуральных числа, каждое из которых не превосходит 109. Требуется ;на стандартный поток вывода напечатать их наибольший общий делитель.

;Примеры
;Входные данные
;1 2 3 4
;Результат работы
;1
;Входные данные
;2 4 6 8
;Результат работы
;2
;Входные данные
;3 9 27 4
;Результат работы
;1
;Входные данные
;9 18 27 6
;Результат работы
;3

%include "io.inc"


section .bss
 a resd 1
 b resd 1
 d resd 1
 
section .text

C:
push ebp ; 
mov ebp, esp
sub esp,8
mov eax, dword[ebp+8]
mov ebx,dword[ebp+12]
cmp ebx,0
je .no
mov dword[esp],ebx

cdq
idiv ebx
mov dword[esp+4],edx
call C
jmp .end
.no:
mov eax,eax
jmp .end
.end:
mov esp, ebp
pop ebp
ret


global CMAIN
CMAIN:
 mov ebp, esp;
    ;write your code here
    mov edx, dword [esp]
    mov dword[b],edx
    GET_UDEC 4,a
    mov eax,dword[a]
     mov dword[esp],eax
     GET_UDEC 4,d
    mov eax,dword[d]
    mov dword[esp+4],eax
    call C
    mov dword[esp],eax
    GET_UDEC 4,d
    mov eax,dword[d]
    mov dword[esp+4],eax
    call C
    mov dword[esp],eax
    GET_UDEC 4,d
    mov eax,dword[d]
    mov dword[esp+4],eax
    call C
    PRINT_DEC 4,eax
    
     mov edx,dword[b]
    mov esp, ebp
    mov  dword [esp],edx
    xor eax, eax
    ret