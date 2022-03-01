[org 0x7e00]

jmp EnterProtectedMode

%include "gdt.asm"
%include "Print.asm"

EnterProtectedMode:
    call EnableA20
    cli
    lgdt [gdt_descriptor]
    mov eax, cr0
    or eax, 1
    mov cr0, eax
    jmp codeseg:StartProtectedMode

EnableA20:
  in al, 0x92
  or al, 2
  out 0x92, al
  ret

[bits 32]

StartProtectedMode:

        mov ax, dataseg
        mov ds, ax
	mov ss, ax
	mov es, ax
	mov fs, ax
        mov gs, ax
        
        mov [0xb8000], byte 'B'
	mov [0xb8002], byte 'r'
	mov [0xb8004], byte 'i'
	mov [0xb8006], byte 'c'
	mov [0xb8008], byte 'k'
	mov [0xb8010], byte ' '
	mov [0xb8012], byte 'O'
	mov [0xb8014], byte 'S'
	mov [0xb8016], byte ' '
	mov [0xb8018], byte 'L'
	mov [0xb8020], byte 'o'
	mov [0xb8022], byte 'a'
	mov [0xb8024], byte 'd'
	mov [0xb8026], byte 'e'
	mov [0xb8028], byte 'd'

        jmp $

times 2048-($-$$) db 0
