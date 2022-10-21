;Задача 04-14: Сортировка списка
;Во входном файле input.txt записана последовательность чисел. Числа в последовательности целые, по модулю не превосходящие 109. Их ;количество не превышает 4000.

;Требуется отсортировать данную последовательность по неубыванию и вывести результат в файл output.txt.

;Указание: при решении данной задачи запрещается использовать массивы. Для хранения последовательности используйте однонаправленный ;или двунаправленный список.
;
;Также запрещается использовать макросы ввода-вывода библиотеки io.inc. При вызове всех библиотечных функций стек должен быть ;выровнен по 16 байт.

;Примеры
;Входные данные в файле input.txt
;2 4 1 3 5 8
;Результат работы в файле output.txt
;1 2 3 4 5 8
;Входные данные в файле input.txt
;-5 3 -2 1 0 -4 3
;Результат работы в файле output.txt
;-5 -4 -2 0 1 3 3



%include "io.inc"
CEXTERN fscanf
CEXTERN fprintf
CEXTERN calloc
CEXTERN fopen
CEXTERN fclose

section .rodata
LC0 db "r", 0 ; параметр fopen – открыть двоичный файл на чтение
LC1 db "input.txt", 0
LC2 db "%d", 0
LC9 db "%d ", 0
LC3 db "w",0
LC4 db "output.txt", 0

section .bss
  list resd 3
  x resd 1
  f resd 1
  root resd 1
  l resd 1
  y1 resd 1
  y2 resd 1
  new_n resd 1
  c resd 1
  
  
section .text
create_node: ; stdcall (передача через ecx)
  push ecx
  sub esp,8
  mov dword [esp+4], dword 8
  mov dword [esp], dword 1
  call calloc
  mov ecx,dword[esp+8]
  mov dword[eax],ecx
  mov dword[eax+4],0
  add esp,8
  pop ecx
  ret
  
  
  
 
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov dword[c],1
 sub esp, 32
 mov edi,0
 mov dword [esp], LC1 ; Открываем файл (который передали) на чтение
 mov dword [esp+4], LC0
 call fopen
 cmp eax, 0 ; В случае неудачи – сразу выходим
 jne .end2
 mov dword [esp], eax ; Закрываем файл
call fclose
add esp,32
xor eax,eax
leave
ret

.end2:
mov esi,eax; сохранили описатель

mov ecx,dword -1000000001
call create_node
mov dword[root],eax
mov eax,[eax]
mov dword[l],0
.while:
 mov eax, x
 mov [esp+8], eax
 mov dword[esp+4],LC2
 mov dword[esp],esi
 call fscanf
 cmp eax,1
 jne .end1
 
 

;push
sub esp,8
mov eax,dword[root]
 mov dword[y1],eax
 mov dword[y2],eax
 mov eax,dword[y2]
 cmp dword[c],1
  cmp eax,0
 je .aw
 mov eax,dword[y2]
 mov eax,dword[eax]
 cmp eax,edx
 jge .aw
 
  cmp dword[c],1
je .fi5
mov eax,dword[root]
 mov eax,[eax+4]
 mov eax, [eax]
 .fi5:
 
 .while3:

 mov eax,dword[y2]
 mov dword[y1],eax
 mov eax,dword[y2]
 mov eax,dword[eax+4]
 mov dword[y2],eax
 cmp eax,0
 je .aw
 mov eax,dword[y2]
 mov eax,dword[eax]
 mov ebx,dword[x]
 cmp eax,ebx
 jge .aw
jmp .while3
 .aw:
   mov ecx,dword[x]
   call create_node
   mov dword[new_n],eax

   cmp dword[y2],0
   
    
   je .of
   mov eax,dword[new_n]
   mov ecx,dword[y2]
   mov dword[eax+4],ecx
   .of:
   mov eax, dword[y1]
   
   cmp dword[c],1
je .fi6
mov eax,dword[root]
 mov eax,[eax+4]
 mov eax, [eax];2
 .fi6:
 sub dword[c],1
 
 
 mov eax, dword[y1]
 mov ecx,dword[new_n]
   mov dword[eax+4],ecx
   
   add esp,8
 








 mov eax,dword[root]
 mov eax,[eax+4]
 mov eax, [eax]
 jmp .while
 
.end1:
 mov dword [esp], esi ; Закрываем файл
call fclose
mov dword [esp], LC4 ; Открываем файл (который передали) на чтение
 mov dword [esp+4], LC3
 call fopen
  cmp eax, 0 ; В случае неудачи – сразу выходим
 jne .end3
 mov dword [esp], eax ; Закрываем файл
call fclose
add esp,32
xor eax,eax
leave
ret

.end3:
 mov esi,eax
 mov eax, dword[root]
 mov eax,dword[eax+4]
 cmp eax,0
 je .while9
 .while2:
 mov eax, dword[root]
 mov eax,dword[eax+4]
 mov dword[root],eax
 
 mov eax, dword[root]
 mov eax,dword[eax]

 mov dword [esp+8], eax
 mov dword[esp+4], LC9
 mov  dword[esp],esi
 call fprintf
 
 mov eax, dword[root]
 mov eax,dword[eax+4]
 cmp eax,0
 jne .while2
 .while9:
 mov [esp],esi
 call fclose
add esp,32

    ;write your code here
    xor eax, eax
    ret
