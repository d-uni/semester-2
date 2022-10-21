;Задача 04-7: Неостросоциальные строки
;На входной поток подаётся сначала количество, а затем сами строки, разделённые пробелами или переводами строк. Подсчитайте ;количество различных строк и выведите на стандартный выходной поток. Длина строк не превосходит 10, количество строк не превосходит ;500 и не менее нуля.

;Запрещается использовать макросы ввода-вывода библиотеки io.inc. При вызове всех библиотечных функций стек должен быть выровнен по ;16 байт.

;Примеры
;Входные данные
;3
;abc cba abc
;Результат работы
;2


%include "io.inc"
CEXTERN strcmp
CEXTERN calloc
CEXTERN free
CEXTERN printf
CEXTERN strcpy

section .bss
    cursz resd 1
    n resd 1
    strings resd 502
    temp resd 1
section .rodata
    getint db "%d", 0
    getstring db "%s", 0
    printint db `%d\n`, 0
    
section .text
c:
push ebp
mov ebp,esp

sub esp,12
xor edi, edi
        loopcmp:
        mov eax,dword[cursz]
            cmp edi, dword[cursz]
            je loopcmpend
            mov eax, edi
            shl eax, 2
            add eax, strings
            ;eax: указатель на (strings + edi)
            mov eax, dword[eax];char*
            mov [esp+4], eax
            mov ebx, dword[temp]
            mov [esp], ebx
            call strcmp
            cmp eax, 0
            je loopcmpend
            inc edi
            jmp loopcmp
        loopcmpend:
        cmp edi, dword[cursz]
        jne .end
        mov eax , dword 1
        mov esp,ebp
        leave
        ret
        .end:
        mov eax,dword 0
        mov esp,ebp
        leave
        ret

global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    sub esp, 20
    mov [esp + 4], dword n
    mov [esp], dword getint
    call scanf
    xor esi, esi
    ;calloc temp
    mov [esp], dword 13
    mov [esp + 4], dword 1
    call calloc
    mov dword[temp], eax
    loopn:
        cmp esi, dword [n]
        je loopnend
        mov [esp], dword getstring
        mov eax, dword [temp]
        mov [esp + 4], eax
        call scanf
        
        call c
        
        cmp eax,1
        jne notnew
            mov [esp], dword 13
            mov [esp+4], dword 1
            call calloc
            mov ebx, dword[cursz]
            shl ebx, 2
            add ebx, strings
            mov  [ebx],  eax
            mov [esp], eax
            mov ebx, dword [temp]
            mov [esp+4], ebx
            call strcpy
            mov ebx, dword [cursz]
            inc ebx
            mov dword[cursz], ebx   
        notnew:
        inc esi
        jmp loopn
    loopnend:
    xor esi, esi
    freel:
        cmp esi, dword [cursz]
        je freeend
        mov eax, esi
        shl eax, 2
        add eax, strings
        mov eax, dword[eax]
        mov [esp], eax
        call free
        inc esi
        jmp freel
    freeend:
    mov eax, dword[temp]
    mov [esp], eax
    call free
    mov eax, dword[cursz]
    mov [esp+4], eax
    mov [esp], dword printint
    call printf
    add esp, 20
    xor eax, eax
    ret