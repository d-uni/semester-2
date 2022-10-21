%include "io.inc"

section .bss
a resd 1
b resd 1

section .text
C:
push ebp ; Стандартный пролог
mov ebp, esp
sub esp, 12 ; Выделяем во фрейме еще два двойных слова для сохранения результатов первого рекурсивного вызова
mov eax, dword [ebp+8] ; Загружаем параметр m в регистр
mov ebx, dword [ebp+12] ;Загружаем параметр n в регистр
cmp eax, 0 ; Для m==0 передаем управление на
je .no ; метку .no
cmp eax, ebx ; m==n
je .no
sub ebx, 1 ; Помещаем в пространство аргументов величину n-1
mov dword [esp+4], ebx
mov dword [esp], eax
call C ; Выполняем первый рекурсивный вызов
mov dword [ebp-4], eax ; Сохраняем результат работы первого вызова
mov eax, dword [ebp+8] ; Помещаем в пространство аргументов величину m-1
sub eax, 1
mov ebx, dword [ebp+12] ; Помещаем в пространство аргументов величину n-1
sub ebx, 1
mov dword [esp+4], ebx
mov dword [esp], eax
call C ; Выполняем второй рекурсивный вызов
add eax, dword [ebp-4] ; Складываем P(n-2)+P(n-3)
jmp .end
.no:
mov eax, 1 ; Остальные случаи: return 1
jmp .end ; Завершаем выполнение
.end:
mov esp, ebp ; Стандартный эпилог
pop ebp
ret

global CMAIN
CMAIN:
mov ebp, esp; for correct debugging; for correct debugging; for correct debugging; for correct debugging
mov edx, dword [esp]
GET_UDEC 4,a
GET_UDEC 4,b
mov eax,dword[a]
mov ebx,dword[b]
mov dword [esp], eax
mov dword [esp+4], ebx
call C
PRINT_UDEC 4,eax
;write your code here
mov  dword [esp],edx
xor eax, eax
ret 
