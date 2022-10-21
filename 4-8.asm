;Задача 04-8: Отсортируй последовательность
;Это скучная задача.

;В текстовом файле input.txt задаётся последовательность знаковых целых 32х-битных чисел, разделённых произвольными комбинациями ;пробельных символов и символов перевода строки. Длина последовательности не превышает 1000 элементов. Требуется вывести ;отсортированную последовательность в файл output.txt. Для сортировки воспользуйтесь библиотечной функцией qsort

;Запрещается использовать макросы ввода-вывода библиотеки io.inc. При вызове всех библиотечных функций стек должен быть выровнен по ;16 байт.

;Примеры
;Входные данные в файле input.txt
;241 1 10
;Результат работы в файле output.txt
;1 10 241
;Входные данные в файле input.txt
;2 -1 0
;Результат работы в файле output.txt
;-1 0 2


%include 'io.inc'

CEXTERN fopen
CEXTERN fclose
CEXTERN fscanf
CEXTERN fprintf
CEXTERN calloc
CEXTERN qsort

section .bss
e resd 1
p resd 1
v resd 1
temp resd 1
mtemp resd 1
o resd 1

section .rodata
LC0 db "r", 0 ; параметр fopen – открыть двоичный файл на чтение
LC1 db "input.txt", 0
LC2 db "%d", 0
LC3 db "w",0
LC4 db "output.txt", 0
LC5 db "%d ", 0

section .text
comparator:
 push ebp,
    mov ebp, esp
    mov eax, dword[esp+8]
    mov eax,[eax]
    mov ecx,dword[esp+12]
    cmp eax, [ecx]
    jne .l1
        mov eax, 0
        jmp .end
    .l1:
    cmp eax, [ecx]
    jl .l2
        mov eax, -1
        jmp .end
    .l2:
        mov eax, 1
        jmp .end
    .end:
    leave
    ret


 mov edx,esp
add edx,8
mov eax,dword [edx]
mov eax,[eax]
sub edx,4
mov ecx,dword[edx]
mov ecx,[ecx]
sub eax, ecx
ret
    
global CMAIN
CMAIN:
mov ebp, esp; for correct debugging
mov dword[e],esp
mov eax, dword[esp]
mov dword[p],eax


push ebp ; Пролог
mov ebp, esp
push esi ;описатель открытого файла
push edi; счетчик
sub esp, 32
mov edi,0
mov dword [esp], LC1 ; Открываем файл (который передали) на чтение
mov dword [esp+4], LC0
call fopen
cmp eax, 0 ; В случае неудачи – сразу выходим
jne .end2
mov dword [esp], ebx ; Закрываем файл
call fclose
mov eax,edi
mov edi, dword [ebp-8]
mov esi, dword [ebp-4]

mov eax,dword[p]
mov esp,dword[e]
mov dword[esp],eax
xor eax, eax
leave
ret

 .end2:
mov esi, eax ; Сохраняем описатель файла в esi
mov dword [esp+4], dword 4
mov dword[esp],1002
call calloc
mov dword[temp],eax ; сохраняем адрес  адреса на начало массива
mov dword[mtemp], eax
.loop:
mov eax, edi
shl eax,2
add dword[mtemp], eax ;-указатель
mov eax, dword[mtemp]
mov [esp+8], eax
mov dword [esp+4], LC2
mov [esp],esi
call fscanf
cmp eax,-1
je .end1
mov eax,dword[temp]
mov dword[mtemp],eax
add edi,1
jmp .loop
.end1:

mov eax,dword[temp]
mov dword[mtemp],eax 



 mov [esp+12], dword comparator         ;указатель на функцию cmp
 mov [esp+8], dword 4
 mov [esp+4], edi
 mov eax, dword[temp]
 mov [esp],eax
 call qsort
    

mov dword [esp], esi ; Закрываем файл
call fclose
;for read
mov dword [esp], LC4 ; Открываем файл (который передали) на чтение
mov dword [esp+4], LC3
call fopen
mov esi,eax
sub edi,1
.loop2:

cmp edi,-1
je .end3

mov eax, edi
shl eax,2
add dword[mtemp], eax

mov eax, dword[mtemp] ;РАЗЫМЕНОВАНИЕ a[i]
mov eax,[eax]
mov [esp+8], eax

mov dword [esp+4], LC5
mov [esp],esi
call fprintf

mov eax,dword[temp]
mov dword[mtemp],eax
sub edi,1
jmp .loop2
.end3:



mov dword [esp], esi ; Закрываем файл
call fclose
mov eax,edi
mov edi, dword [ebp-8]
mov esi, dword [ebp-4]


mov eax,dword[p]
mov esp,dword[e]
mov dword[esp],eax
xor eax, eax
leave
ret