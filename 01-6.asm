;Задача 01-6: Извлечение последовательности бит
;На вход программе подается беззнаковое 32-битное целое число N и натуральное число K (1 ≤ K ≤ 31). Требуется взять K младших битов ;числа N и вывести полученное таким образом число.

;Запрещается использовать инструкции условной передачи данных и управления.

;Примеры
;Входные данные
;2 1
;Результат работы
;0
;Входные данные
;12 3
;Результат работы
;4
;Входные данные
;3 5
;Результат работы
;3
;Входные данные
;1024 3
;Результат работы
;0

%include "io.inc"

section .bss
 a resd 1
 k resb 1
 
section .text
global CMAIN
CMAIN:
    ;write your code here
    GET_UDEC 4,a
    GET_UDEC 1,k
    mov cl,32
    sub cl,byte[k]
    shl dword[a],cl
    shr dword[a],cl
    mov eax,dword[a]
    PRINT_UDEC 4,eax
    xor eax, eax
    ret