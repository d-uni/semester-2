;Задача 03-2: Подсчет единиц.
;В этой задаче Вам необходимо описать рекурсивную функцию F(x), которая вычисляет количество единиц в троичной записи числа. Функция ;должна удовлетворять соглашениям о вызовах cdecl.

;На вход программе подается 32-битное беззнаковое число x.

;Программа должна вывести единственное число — значение F(x).

;Примеры
;Входные данные
;1
;Результат работы
;1
;Входные данные
;2
;Результат работы
;0
;Входные данные
;3
;Результат работы
;1
;Входные данные
;4;
;Результат работы
;2

%include "io.inc"
section .bss
a resq 1
b resd 1

section .text
C:
push ebp ; 
mov ebp, esp
sub esp,8 ; 
mov ecx,dword[ebp+8]
cmp ecx,0
je .no
mov eax,ecx
xor edx,edx
mov ebx,3
div ebx
cmp edx,1
je .w1
cmp edx,-1
je .w1
mov dword[esp],eax
call C
jmp .end
.w1:
mov dword[esp],eax
call C
add eax,1
jmp .end
.no:
 mov eax,0

.end:
mov esp, ebp ; 
pop ebp
ret

global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    mov edx, dword [esp]
    mov dword[b],edx
    GET_UDEC 4,a
    mov eax,dword[a]
   
    mov dword[esp],eax
    call C
    PRINT_DEC 4,eax
   
    mov edx,dword[b]
    mov esp, ebp
    mov  dword [esp],edx
    xor eax, eax
    ret