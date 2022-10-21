;Задача 03-8: Суммы цифр
;Учительница записала на доске целое число N (1 ≤ N ≤ 4000000000) в системе счисления с основанием K (2 ≤ K ≤ 10). Вовочка подсчитал ;сумму цифр этого числа и записал ее ниже также в системе счисления с основанием K. С полученным числом он проделал то же самое, и ;продолжал выписывать числа, пока два последних записанных числа не совпали. Ваша задача — найти сумму всех выписанных на доске ;чисел.

;Вводятся два числа N и K в десятичном виде. Необходимо вывести единственное целое число также в десятичном виде.

;Указание: реализуйте функцию, подсчитывающую сумму цифр числа для разных систем счисления.

;Примеры
;Входные данные
;25 10
;Результат работы
;39
;Входные данные
;7 2
;Результат работы
;14
;Входные данные
;777 8
;Результат работы
;791

%include "io.inc"

section .bss
 n resd 1
 k resd 1
 s1 resd 1
  s2 resd 1
 o resd 1

section .text

C:
 push ebp ; 
mov ebp, esp
mov dword[s1],0
mov ebx,dword[ebp+8]
mov eax,dword[ebp+12]
.j:
cmp eax,0
je .r
cdq
xor edx,edx
div ebx
add dword[s1],edx
jmp .j
.r:
mov eax,dword[s1]
mov esp, ebp ; 
pop ebp
ret


global CMAIN
CMAIN:
mov ebp,esp
mov edx,dword[esp]
mov dword[o],edx

GET_UDEC 4,n
mov ecx,dword[n]
mov dword[s2],ecx
GET_UDEC 4,k
.u:
mov edx,dword[k]
mov dword[esp],edx
mov dword[esp+4],ecx
call C
add dword[s2],eax
cmp eax,ecx
je .h
mov ecx,eax
jmp .u
.h:
mov eax,dword[s2]
PRINT_UDEC 4,eax

    ;write your code here
    mov edx,dword[o]
    mov  dword [esp],edx
    xor eax, eax
    ret