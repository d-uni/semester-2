;Задача 04-1: Шестнадцатеричное наступает!
;На стандартном потоке ввода задаётся последовательность беззнаковых целых 32х-битных чисел в десятичной записи, разделённых ;пробельными символами. Требуется вывести ту же самую последовательность, но каждое число должно быть выведено через printf в ;формате "0x%08X\n"

;Запрещается использовать макросы ввода-вывода библиотеки io.inc. При вызове всех библиотечных функций стек должен быть выровнен по ;16 байт.


;Примеры
;Входные данные
;10 256
;Результат работы
;0x0000000A
;0x00000100


%include "io.inc"
section .rodata
 LC0 db "%u", 0 ; Форматная строка для scanf
 LC1 db `0x%08X\n`, 0 ; Форматная строка для printf
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
.l:
 mov ebp, esp
 sub esp, 16
 lea ebx, [ebp-4]
 mov dword [esp+4], ebx
 mov dword [esp], LC0
 call scanf
 cmp eax,-1 
 je .end
 mov eax, dword [ebp-4]
 
 mov dword [esp+4], eax
 mov dword [esp], LC1
 call printf
 mov ebx, dword [ebp-4]
 add esp,16
 
 jmp .l
 .end:
 add esp,16
    ;write your code here
    xor eax, eax
    ret
