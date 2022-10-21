;Задача 04-4: Just another simple task
;Вам требуется посчитать количество целых чисел во входном файле и вывести его на стандартный поток. Каждое целое число помещается в ;32-х разрядный беззнаковый тип. Количество чисел не превосходит 100000 и не менее нуля.

;Запрещается использовать макросы ввода-вывода библиотеки io.inc. При вызове всех библиотечных функций стек должен быть выровнен по ;16 байт.

;Примеры
;Входные данные в файле data.in
;1 2 3
;Результат работы
;3 

%include 'io.inc'
CEXTERN fopen
CEXTERN fclose
CEXTERN fscanf

section .bss
e resd 1
p resd 1

section .rodata
 LC0 db "r", 0 ; параметр fopen – открыть двоичный файл на чтение
 LC1 db "data.in", 0
  LC2 db "%d", 0
 
section .text
c:
push ebp ; Пролог
 mov ebp, esp
 mov edx,0
 sub esp, 24
 xor ebx,ebx
 xor edi,edi
 mov dword [ebp-4], ebx ;описатель открытого файла
 mov dword [ebp-8], edi; счетчик
 
 mov edi,0 
 

 mov dword [esp], LC1 ; Открываем файл (который передали) на чтение
 mov dword [esp+4], LC0
 call fopen
 cmp eax, 0 ; В случае неудачи – сразу выходим
 je .end2
mov ebx, eax ; Сохраняем описатель файла в ebx



.loop:
 lea eax, [ebp-12]
 mov dword [esp+8], eax
 mov dword [esp+4], LC2
 mov dword[esp],ebx
 call fscanf
 cmp eax,-1 
 je .end1
add edi,1
 
jmp .loop


.end1:
 mov dword [esp], ebx ; Закрываем файл
 call fclose
 .end2:
 mov eax,edi
 mov edi, dword [ebp-8]
 mov ebx, dword [ebp-4]
 leave
 ret

global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov dword[e],esp
    mov eax, dword[esp]
    mov dword[p],eax
    xor eax,eax
call c
PRINT_DEC 4,eax
    ;write your code here
    mov eax,dword[p]
    mov esp,dword[e]
    mov dword[esp],eax
    xor eax, eax
    ret
