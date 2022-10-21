;Задача 01-15. Площадь треугольника
;Найдите площадь треугольника, заданного координатами его вершин.

;На вход программе подаются числа x1, y1, x2, y2, x3, y3 - координаты вершин. Все числа целые, не превосходящие по модулю 10000.

;Программа должна вывести площадь треугольника с точностью до одного знака после запятой.

;При решении задачи запрещается использовать инструкции условной передачи данных и управления.

;Примеры
;Входные данные
;1 1
;0 1
;1 0        
;Результат работы
;0.5

%include "io.inc"

section .bss
 x1 resd 1
 y1 resd 1
 x2 resd 1
 y2 resd 1
 x3 resd 1
 y3 resd 1
 x resd 1
 
section .text

global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    GET_DEC 4,x1
    GET_DEC 4,y1
    GET_DEC 4,x2
    GET_DEC 4,y2
    GET_DEC 4,x3
    GET_DEC 4,y3
    
    mov ebx,dword[y2]
    mov edx,dword[y3]
    sub dword[y2],edx
    mov edx,dword[y1]
    sub dword[y3],edx
    sub dword[y1],ebx
    mov edx,dword[y2]
    
    
    mov edx,dword[x1]
    imul edx, dword[y2]
    mov dword[x1],edx
    
    
    
    mov edx,dword[x2]
    imul edx, dword[y3]
    mov dword[x2],edx
    
    mov edx,dword[x3]
    imul edx, dword[y1]
    mov dword[x3],edx
    
    
    mov edx , dword[x1]
    add edx,dword[x2]
    add edx,dword[x3] 
    
    mov ebx, edx ; модуль edx
    sar ebx, 31
    xor edx, ebx
    sub edx, ebx
    
    mov eax,edx 
    CDQ
    mov ebx,2
    idiv ebx
    PRINT_UDEC 4,eax
    mov eax,10
    mul edx
    CDQ
    mov ebx,2
    idiv ebx
    PRINT_CHAR '.'
    PRINT_UDEC 4,eax
    xor eax, eax
    ret