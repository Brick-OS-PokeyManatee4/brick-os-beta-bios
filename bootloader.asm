


call PrintString

jmp $

PrintString:
  ret
  
TestString:
  db 'Brick OS Loaded',0
times 510-($-$$) db 0
  
  
dw 0xaa55
