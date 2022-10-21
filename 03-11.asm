;Задача 03-11: Делимость на три
;На стандартном потоке ввода задается число N(1 ≤ N ≤ 100000), а следом за ним N целых беззнаковых 32-битных чисел.

;Для каждого из N чисел необходимо вывести YES, если число данное число делится на три, и NO в противном случае. Ответы должны быть ;разделены переводом строки.

;Указание: использовать массивы и инструкции деления запрещается, необходимо описать функцию div3, проверяющую делимость своего ;аргумента на 3.

;Подсказка: Для решения данной задачи может быть полезным вспомнить признак деления чисел на 11.

;Примеры
;Входные данные
;3
;7
;23
;303
            
;Результат работы
;NO
;NO
;YES

%include "io.inc"

section .bss
 a resd 1
 b resd 1
 c resd 1
 s1 resd 1
 s2 resd 1
 o resd 1
 
 
section .text

C:
 push ebp ; 
mov ebp, esp
sub esp,8 ; 
mov ecx,dword[ebp+8]
cmp ecx,0
jl .no
cmp ecx,0
je .yes
sub ecx,3
mov dword[esp],ecx
call C
jmp .end
.no:
mov eax,0
jmp .end
.yes:
 mov eax,1
.end:
mov esp, ebp ; 
pop ebp
ret

global CMAIN
CMAIN:

mov ebp,esp
mov edx,dword[esp]
mov eax,1
mov dword[o],eax
GET_UDEC 4,a
mov ecx,dword[a]
mov dword[s1],0
mov dword[s2],0
.u:
mov dword[c],ecx
GET_UDEC 4,b
mov eax,dword[b]
mov ecx,32
.k:
 sar eax,1
 JNC .j
 cmp dword[o],0
 JE .h
 add dword[s1],1
 jmp .j
 .h:
   add dword[s2],1
    
 .j:
 cmp dword[o],0
 je .em
   mov dword[o],0
   jmp .w
 .em:
   mov dword[o],1
  .w:
loop .k

 
mov eax,dword[s1]
cmp eax,dword[s2]
JG .i
mov eax,dword[s2]
sub eax,dword[s1]
jmp .e
.i: 
 sub eax,dword[s2]
.e:

mov dword[esp],eax
call C
cmp eax,0
je .f
PRINT_STRING "YES" 
jmp .y
.f:
PRINT_STRING "NO" 
.y:
NEWLINE
mov dword[s1],0
mov dword[s2],0
mov ecx,dword[c]
sub ecx,1
cmp ecx,0
JNE .u

    mov  dword [esp],edx
    ;write your code here
    xor eax, eax
    ret