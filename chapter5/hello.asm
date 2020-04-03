section .data
    bNum db 123 ; data byte
    wNum dw 12345; data word
    dNum dd 1234567890 ; data double word
    qNum1 dq 123456789012345689 ; data quadword
    qNum2 dq 123456
    qNum3 dq 3.14

section .bss

section .text
    global main
main:
    push rbp
    mov rbp, rsp

    mov rax, -1 ; set all bits to 1
    mov al, byte[bNum] ; set low 8 bits to 123, the rest is still set to 1s
    xor rax, rax ; clear rax to all 0s
    mov al, byte[bNum]; set low 8 bits to 123, the rest is still set to 0s

    mov rax, -1
    mov ax, word[wNum]
    xor rax, rax
    mov ax, word[wNum]

    mov rax, -1
    mov eax, dword[dNum] ; moving 32 bits clears the upper bits of rax

    mov rax, -1
    mov rax, qword[qNum1]
    mov qword[qNum2], rax
    mov rax, 123456
    movq xmm0, [qNum3]

    mov rsp, rbp
    pop rbp

    mov rax, 60; 60 = exit
    mov rdi, 0; 0 = success exit code
    syscall; call quit
