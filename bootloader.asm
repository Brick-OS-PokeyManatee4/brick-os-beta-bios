
[org 0x7c00]

mov bp, 0x7c00
mov sp, bp

mov bx, TestString
call PrintString

jmp $

%include "Print.asm"

times 510-($-$$) db 0

dw 0xaa55
