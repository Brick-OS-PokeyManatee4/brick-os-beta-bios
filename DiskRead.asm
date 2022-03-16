
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

        jc DiskReadFailed

	ret

BOOT_DISK:
	db 0

DiskReadErrorString:
	db 'Brick OS Beta BIOS Disk Floppy Read Failed',0

DiskReadFailed:
        mov ah, 06h
        xor al, al
        xor cx, cx
        mov dx, 184FH
        mov bh, 1Eh
        int 10H
	mov bx, DiskReadErrorString
	call PrintString
	
	jmp $

