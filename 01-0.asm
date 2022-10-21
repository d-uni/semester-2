;Задача 01-10: Год на Пандоре
;Год на планете Пандора по-прежнему состоит из 14 месяцев, в каждом из которых либо 41, либо 42 дня: в первом месяце 41 день, во ;втором — 42, далее число дней чередуется.

;На стандартном потоке ввода задаются два числа: номер месяца в году и номер дня в месяце. Оба номера отсчитываются от 1.

;На стандартный поток вывода напечатайте номер дня в года, отсчитываемый от 1.

;Запрещается использовать инструкции условной передачи данных и управления.

;Примеры
;Входные данные
;2 3
;Результат работы
;44

%include "io.inc"

section .bss
 a resd 1
 b resd 1
section .text
global CMAIN
CMAIN:
    ;write your code here
    GET_UDEC 4,a
    GET_UDEC 4,b
    mov eax, dword[a]
    sub eax,1
    CDQ
    mov ebx,2
    div ebx
    mov ebx, dword[a]
    sub ebx,1
    sub ebx,eax
    mov edx,42
    imul edx
    mov edx,41
    imul ebx,edx
    add eax,ebx
    add eax,dword[b]
    PRINT_UDEC 4,eax
    xor eax, eax
    ret
