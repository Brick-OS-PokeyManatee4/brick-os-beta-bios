
[org 0x7c00]

mov bp, 0x7c00
mov sp, bp

mov bx, TestString
call PrintString

jmp $

PrintString:
  mov ah, 0x0e
  mov al, [bx]
  int 0x10
  ret
  
TestString:
  db 'Brick OS Loaded',0
  
times 510-($-$$) db 0

dw 0xaa55
