[org 0x7e00]

mov bx, ExtendedSpaceSuccess
call PrintString

jmp $

%include "Print.asm"

ExtendedSpaceSuccess:
  db 'We Are Succesfully In Extended Space!', 0

times 2048-($-$$) db 0
