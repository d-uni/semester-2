%include "io.inc"
CEXTERN calloc
CEXTERN scanf
CEXTERN printf
CEXTERN free

section .bss
    n resd 1
    i resd 1
    k resd 1
    p resd 1
    m resd 1
    m1 resd 1
    u resd 1
    a resd 1
    s resd 1
    smax resd 1
    
    section .rodata
    getint db "%d", 0
    getlong db "%d", 0
    getstring db "fault", 0
   printint db `%d\n`, 0
    printlong db `%d `, 0
   printNEW db `\n `, 0
    
    
    
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
mov ebx,esp
sub esp,70
mov dword[s], 0
mov dword[smax], 0
mov dword[n],0
mov dword[i],0
mov dword[k],0
mov dword[p],0
mov dword[m],0
mov dword[m1],0

mov [esp+4], dword n
mov [esp],dword getint
call scanf
mov eax,eax
.l1:
mov eax, dword[n]
cmp eax,dword[i]
jle .from1
  mov [esp+4], dword m
  mov [esp],dword getint
  call scanf
  mov [esp+4], dword 4
  mov eax, dword[m]
  imul eax,eax
  mov dword[k],eax
  mov [esp],eax
  call calloc
  mov dword[a],eax
  cmp eax,-1
  je .end1
  mov dword[k],0
   .loop2:
    mov eax, dword[m]
    cmp eax,dword[k]
    jle .from2
    mov dword[p],0
     .loop3:
      mov eax, dword[m]
      cmp eax,dword[p]
      jle .from3
         
         mov eax,dword[k]
         imul eax,4
         add eax,dword[p]
         imul eax,4
         add eax,dword[a] ;&a[k*8+p] == (a+k*8+p)
         mov [esp+4], eax
         mov [esp],dword getlong
         call scanf
         
         
   
   
         mov eax,dword[p]
         cmp eax,dword[k]
         jne .from4
           mov eax,dword[k]
           imul eax,4
           add eax,dword[p]
           add eax,dword[a]
           mov eax,[eax]
           add dword[s],eax
         .from4:
      add dword[p],1
      jmp .loop3
      .from3:  
    add dword[k],1
    jmp .loop2
    .from2:
    mov eax,dword[s]
    cmp eax,dword[smax]
     jle .from5
       mov eax,dword[s]
       mov dword[smax],eax
       mov eax,dword[a]
   
       mov dword[u],eax
       mov eax,dword[m]
       mov dword[m1],eax
       jmp .p
     .from5:
       mov eax, dword[a]
       mov [esp], eax
       call free
     .p:
     mov dword[s],0
  add dword[i],1
  jmp .l1
  .from1:
  
  

   
   
  mov dword[k],0
  .eloop2:
    mov eax, dword[m1]
    cmp eax,dword[k]
    jle .efrom2
    mov dword[p],0
     .eloop3:
      mov eax, dword[m1]
      cmp eax,dword[p]
      jle .efrom3
      
           mov eax,dword[k]
           imul eax,4
           add eax,dword[p]
           imul eax,4
           add eax,dword[u] ; eax- указатель
           mov eax,[eax] ;eax-значение по указателю
        ;РАЗЫМЕНОВАНИЕ a[i]
       
       mov [esp+4], eax
       mov dword [esp], dword printlong
       call printf
    
    
      add dword[p],1
      jmp .eloop3
      .efrom3:
      
       mov eax,dword[m1]
       sub eax,1
       cmp dword[k],eax
       je .end0
        mov dword [esp], dword printNEW
        call printf
       .end0:
    add dword[k],1
    jmp .eloop2
    .efrom2:
      .end1:
    ;write your code here
    add esp,70
    xor eax, eax
    ret