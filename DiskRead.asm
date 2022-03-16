
PROGRAM_SPACE equ 0x8000

ReadDisk:

	mov ah, 0x02
	mov bx, PROGRAM_SPACE
	mov al, 32
	mov dl, [BOOT_DISK]
	mov ch, 0x00
	mov dh, 0x00
	mov cl, 0x02

	int 0x13

        jmp codeseg:Start64Bit
        jc DiskReadFailed

	ret

BOOT_DISK:
	db 0

[bits 64]

Start64Bit:
	mov edi, 0xb8000
	mov rax, 0x1f201f201f201f20
	mov ecx, 500
	rep stosq

        jmp $


DiskReadErrorString:
	db 'Brick OS Beta BIOS Disk Floppy Read Failed',0

DiskReadFailed:
	mov bx, DiskReadErrorString
	call PrintString
	
	jmp $

