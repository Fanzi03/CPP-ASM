section .data
  issue1 db "Which array size?", 0xa
  issue1_len equ $ - issue1

  align 2
  fmt db "%d", 0

section .bss
  num resd 1 
  array resd 1000

extern scanf
extern printf
section .text
  global main

_read:
  sub rsp, 16 

  mov edi, fmt
  mov rsi, rdx
  xor eax, eax
  call scanf

  add rsp, 16

  ret

main:
  mov rax, 1
  mov rdi, 1
  mov rsi, issue1
  mov rdx, issue1_len
  syscall

  call _read

  sub rsp, 8

  mov edi, fmt  
  mov rsi, rdx;  call _read
  xor eax, eax  ;  
  call printf   ;
               ;
  add rsp, 8    ;  mov ebx, num
;  mov ecx, 0
;  
;  .loop:
;    cmp ecx, ebx
;    je .end
;      call _read 
;;      mov edx, [num]
;;      mov dword [array + ecx * 4], edx
;      inc ecx 
;
;;      sub rsp, 8
;
;;      mov edi, fmt
;;      mov esi, edx
;;      xor eax, eax
;;      call printf
;
;;      add rsp, 8
;;
;;      mov eax, 1
;;      mov edi, 1
;;      mov esi, [num]
;;      mov edx, 4
;;      syscall
;      
;      jmp .loop
;  .end:
    
  
;  sub rsp, 8
;
;  mov edi, fmt
;  mov esi, [num]
;  xor eax, eax
;  call printf

;  add rsp, 8

  xor eax, eax
  ret

  
