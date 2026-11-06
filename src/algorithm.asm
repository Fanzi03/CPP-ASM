section .bss
  temp resd 1
section .text
  global get_average
  global sum
  global buble_sort
  global max
  global _sub
  global sum_matrix

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
