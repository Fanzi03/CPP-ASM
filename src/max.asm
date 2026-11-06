section .text
  global max

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
