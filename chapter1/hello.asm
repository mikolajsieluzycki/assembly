;hello.asm
section .data
    msg db "Hello, World!",10,0
section .bss
section .text
    global main
main:
    mov rax, 1; 1 = write
    mov rdi, 1; 1 = to stdout
    mov rsi, msg; string to display in rsi
    mov rdx, 14; length of string to display without null terminator
    syscall; display the string

    mov rax, 60; 60 = exit
    mov rdi, 0; 0 = success exit code
    syscall; call quit
