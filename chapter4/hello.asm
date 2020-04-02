;hello.asm
extern printf; declare an external function
section .data
    msg1 db "Hello, World!",10,0
    msg1Len equ $-msg1-1; length of msg1 without the null terminator

    msg2 db "Alive and Kicking!",10,0
    msg2Len equ $-msg2-1; length of msg1 without the null terminator

    fmtFloat db "This is our float: %lf", 10, 0 ; Formatting string
    fmtInt db "This is our int: %d", 10, 0 ; Formatting string

    radius dq 357 ; intentionally not a string
    pi dq 3.14 ; intentionally not a string

section .bss

section .text
    global main
main:
    push rbp ; function prologue
    mov rbp, rsp; function prologue

    mov rax, 1; 1 = write
    mov rdi, 1; 1 = to stdout
    mov rsi, msg1; string to display in rsi
    mov rdx, msg1Len; length of string to display without null terminator
    syscall; display the string

    mov rax, 1; 1 = write
    mov rdi, 1; 1 = to stdout
    mov rsi, msg2; string to display in rsi
    mov rdx, msg2Len; length of string to display without null terminator
    syscall; display the second string

    mov rdi, fmtInt; first argument to printf
    mov rsi, [radius]; second argument to printf
    mov rax, 0 ; no floating point registers (xmm) involved
    call printf; call printf function

    mov rdi, fmtFloat; first argument to printf
    movq xmm0, [pi]; second argument to printf
    mov rax, 1 ; one floating point registers (xmm) involved
    call printf; call printf function

    mov rsp, rbp; function epilogue
    pop rbp; function epilogue

    mov rax, 60; 60 = exit
    mov rdi, 0; 0 = success exit code
    syscall; call quit
