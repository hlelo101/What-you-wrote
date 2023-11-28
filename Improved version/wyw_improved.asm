BITS 64

section .bss
    input resb 200
    input_len equ $-input

section .data
    text1 db "Write something: "
    text1_len equ $-text1
    text2 db "You wrote:", 10
    text2_len equ $-text2

section .text
    global _start

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, text1
    mov rdx, text1_len
    syscall
    jmp _prompt

_prompt:
    mov rax, 0
    mov rdi, 1
    mov rsi, input
    mov rdx, input_len
    syscall
    jmp _write2

_write2:
    mov rax, 1 ;Write "You wrote"
    mov rdi, 1
    mov rsi, text2
    mov rdx, text2_len
    syscall

    mov rax, 1 ;Write what the user wrote
    mov rdi, 1
    mov rsi, input
    mov rdx, input_len
    syscall
    jmp _exit

_exit:
    mov rax, 60
    mov rdi, 0
    syscall