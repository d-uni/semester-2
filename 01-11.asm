;Задача 01-11: Белое и квадратное
;На стандартном потоке ввода задаётся клетка обычной шахматной доски 8x8, например, H2 (для обозначения вертикалей используются ;заглавные латинские буквы от A до H включительно).

;Требуется на стандартный поток вывода напечатать единственное число: количество белых клеток, находящихся правее и выше заданной ;(горизонталь и вертикаль самой клетки не учитываются).

;Запрещается использовать инструкции условной передачи данных и управления.

;Примеры
;Входные данные
;H2
;Результат работы
;0
;Входные данные
;A1
;Результат работы
;24

%include "io.inc"

section .bss
 a resb 1
 b resb 1
 
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    GET_CHAR a
    GET_CHAR b
    mov bl, 8
    mov al, 8
    sub byte[a], 64
    sub byte[b], 48
    sub al, byte[a]
    sub bl, byte[b]
    mul bl
    mov bl, 2
    CDQ
    div bl
    PRINT_UDEC 1, al
    xor eax, eax
    ret