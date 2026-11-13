section .data 
    a db 127

section .bss
    length resd 1
    value resd 1

section .text
    global make_arr
    global make_int_arr_with_init_value
    global get_pointer_variable_to

extern malloc 
extern multiplie_matrixies

get_pointer_variable_to:
    push rbp
    mov rbp, rsp

    call multiplie_matrixies
    mov rax, a

    mov rsp,rbp
    pop rbp
    ret


make_int_arr_with_init_value:
    push rbp
    mov rbp, rsp

    imul edi, 4    

    mov [length], rdi
    mov [value], rsi

    call malloc
    
    xor rcx, rcx

    .loop:
        cmp ecx, [length] ; не стоит сравнивать числа в разных регистрах
        jge .end
            mov ebx, [value]
            mov [rax + rcx], ebx
            add rcx, 4
            jmp .loop
    .end:

    mov rsp, rbp
    pop rbp
    ret
    

make_arr:
    push rbp
    mov rbp, rsp

    imul rdi, rsi
    call malloc
    
    pop rbp
    ret
    