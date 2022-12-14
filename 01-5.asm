;Задача 01-5: Поворот
;На вход программе подаётся беззнаковое 32-битное целое число N и натуральное число K (1 ≤ K ≤ 31). Требуется циклически сдвинуть ;биты числа N вправо на K битов и вывести полученное таким образом число.

;Примечание: в системе команд процессоров семейства x86 для выполнения этой операции есть готовая инструкция — ROR.

;Запрещается использовать инструкции условной передачи данных и управления.

;Примеры
;Входные данные
;2 1
;Результат работы
;1
;Входные данные
;1 2
;Результат работы
;1073741824
;Входные данные
;3 1
;Результат работы
;2147483649
;Входные данные
;12 2
;Результат работы
;3
;Входные данные
;19 3
;Результат работы
;1610612738

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
    mov eax, dword[a]
    mov cl,byte[k]
    ror eax,cl
    PRINT_UDEC 4,eax
    xor eax, eax
    ret