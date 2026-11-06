section .bss
  temp resd 1
section .text
  global get_average
  global sum
  global buble_sort

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
