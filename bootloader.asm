
[org 0x7c00]

mov [BOOT_DISK], dl

mov bp, 0x7c00
mov sp, bp

call ReadDisk

mov ah, 0x0e
mov al, [PROGRAM_SPACE]
int 0x10

jmp $

%include "Print.asm"
%include "DiskRead.asm"

times 510-($-$$) db 0

dw 0xaa55
