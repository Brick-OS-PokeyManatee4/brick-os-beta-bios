[org 0x7e00]

jmp EnterProtectedMode

%include "gdt.asm"
%include "Print.asm"
%include "CPUID.asm"
%include "SimplePaging.asm"

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
        
        mov [0xb8000], byte 'H'
	mov [0xb8002], byte 'e'
	mov [0xb8004], byte 'l'
	mov [0xb8006], byte 'l'
	mov [0xb8008], byte 'o'
	mov [0xb800a], byte ' '
	mov [0xb800c], byte 'B'
	mov [0xb800e], byte 'r'
	mov [0xb8010], byte 'i'
	mov [0xb8012], byte 'c'
	mov [0xb8014], byte 'k'

	call DetectCPUID
	call DetectLongMode
	call SetUpIdentityPaging
        jmp $

times 2048-($-$$) db 0
