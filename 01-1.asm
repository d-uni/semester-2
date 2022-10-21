;Задача 01-1: Чёрное и круглое
;В начало координат координатной плоскости Oxy Кто-То положил хоккейную шайбу. После этого Кто-То сообщил ей по соответствующим осям ;начальные скорости vx и vy, а также ускорения ax и ay.

;Требуется определить координаты точки, в которой в результате действий Кого-То окажется шайба через целое время t.

;На стандартном потоке ввода через пробел задаются целые десятичные числа vx, vy, ax / 2, ay / 2, t. Скорости задаются в метрах в ;секунду; ускорения — в метрах, разделённых на секунду в квадрате; время — в секундах. Значение времени неотрицательно и не ;превышает 1000. Первые четыре числа по абсолютной величине не превышают 1000.

;На стандартный поток вывода напечатайте через пробел два числа — координаты шайбы по прошествии t секунд: сначала координату x, а ;затем y.

;Запрещается использовать инструкции условной передачи данных и управления.

;Примеры
;Входные данные
;1 2 3 4 5
;Результат работы
;80 110


%include "io.inc"

section .bss
  a resd 5
  
section .text
global CMAIN
CMAIN:
    ;write your code here
    xor eax, eax
    mov eax,a
    GET_DEC 4,eax
    mov dword[a],eax
    add eax, 4
    GET_DEC 4,eax
    mov dword[a+4],eax
    add eax, 4
    GET_DEC 4,eax
    mov dword[a+8],eax
    add eax, 4
    GET_DEC 4,eax
    mov dword[a+12],eax
    add eax, 4
    GET_DEC 4,eax
    mov dword[a+16],eax
    add eax, 4
    
    mov ebx,dword[a]
    imul ebx,dword[a+16]
    mov dword[a],ebx
    
    mov ebx,dword[a+4]
    imul ebx,dword[a+16]
    mov dword[a+4],ebx
    
    
    mov ebx,dword[a+16]
    imul ebx,dword[a+16]
    mov dword[a+16],ebx
    
    mov ebx,dword[a+8]
    imul ebx,dword[a+16]
    mov dword[a+8],ebx
    
    mov ebx,dword[a+12]
    imul ebx,dword[a+16]
    mov dword[a+12],ebx
    
    mov eax,dword[a]
    add eax,dword[a+8]
    mov dword[a],eax
    
    mov eax,dword[a+4]
    add eax,dword[a+12]
    mov dword[a+4],eax
    
    PRINT_DEC 4,a
    PRINT_CHAR ' '
    PRINT_DEC 4,a+4
    
    ret