section .text
  wrong_size db "The matrix cannot multiplie with this size", 0xa
  wrong_size_len equ $ - wrong_size
  fmt db "\n%d", 0

section .bss
  temp resd 1
  matrix1 resq 1
  matrix2 resq 1
  res resq 1
  n1 resd 1
  n2 resd 1
  m1 resd 1
  m2 resd 1
  size resd 1
  i resd 1


section .text
  global get_average
  global sum
  global buble_sort
  global max
  global _sub
  global sum_matrix
  global multiplie_matrixies
extern malloc
extern calloc
extern printf
extern init


multiplie_matrixies:
  push rbp
  mov rbp, rsp
  
  mov eax, edx
  cmp eax, r8d 
  je .equal
    mov rax, 1
    mov rdi, 1
    mov rsi, wrong_size
    mov rdx, wrong_size_len
    syscall

    xor eax, eax
    mov rsp, rbp
    pop rbp
    ret
  .equal:
  
;  push rdi
  call init

;  mov [matrix1], rdi
;  mov [n1], esi
;  mov [m1], edx
;
;  mov [matrix2], rcx
;  mov [n2], r8d
;  mov [m2], r9d
;  mov rcx, [rsp + 16] 
;  mov [size], ecx 
;
;  mov rdi, [n1]
;  imul rdi, 8
;
;  call malloc
;
;  mov [res], rax
;  mov [i], 0
;  
;  .loop:
;    mov ecx, [i]
;    cmp ecx, [n1]
;    jge .end
;      mov rdi, [m2]
;      imul rdi, [size]
;      call malloc
;      mov ecx, [i]
;      mov [res + rcx * 8], rax
;;      mov rdi, fmt
;;      mov rsi, [n1]
;;      xor eax, eax
;;      call printf
;      add [i], 1
;      jmp .loop
;  .end:
;  mov rax, res
    
  mov rsp, rbp
  pop rbp
  ret


  

sum_matrix:
  push rbp
  mov rbp, rsp
  
  xor eax, eax
  mov r9, -1
  
  .for1:
    inc r9
    cmp r9d, esi
    jge .end
    xor r8, r8
    mov ebx, [rdi + r9 * 8]
    .for2:
      cmp r8d, edx
      jge .for1
        mov ecx, [rbx + r8 * 4]
        add eax, ecx
        inc r8
        jmp .for2
  
  .end:
  pop rbp
  ret
  
_sub:
  push rbp
  mov rbp, rsp
  mov eax, edi
  sub eax, esi
  pop rbp
  ret

max:
  push rbp 
  mov rbp, rsp

  mov eax, edi
  
  cmp edi, esi
  jge .more
    mov eax, esi
  .more:

  pop rbp
  ret

buble_sort:
  push rbp
  mov rbp, rsp
  
  imul esi, 4

  prepare:
    xor r8, r8
    xor ecx, ecx
    mov edx, 4
  .for:
    cmp edx, esi
    jge .end
      mov eax, [rdi + rcx] 
      mov ebx, [rdi + rdx]
      cmp eax, ebx
      jle .skip_swap
        mov [rdi + rdx], eax
        mov [rdi + rcx], ebx
        or r8, 1
      .skip_swap:

    add ecx, 4
    add edx, 4
    jmp .for
  .end:
    cmp r8, 1
    je prepare
  pop rbp
  ret

sum:
  push rbp
  mov rbp, rsp

  mov eax, edi
  add eax, esi

  pop rbp
  ret

get_average:
  push rbp
  mov rbp, rsp

  xor ebx, ebx
  xor ecx, ecx

  .loop:
    cmp ecx, esi
    jge .end
      add ebx, [rdi + rcx * 4]
      inc ecx
      jmp .loop
  .end:

  mov qword [temp], rbx
  movsd xmm0, [temp]

  mov qword [temp], rsi
  movsd xmm1, [temp]

  divsd xmm0, xmm1

  pop rbp
  ret
