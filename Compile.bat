mkdir bin
mkdir bin/boot
mkdir bin/boot/os
mkdir bin/isoOutput
nasm bootloader.asm -f bin -o bootloader.bin
nasm ExtendedProgram.asm -f elf64 -o ExtendedProgram.o
gcc -ffreestanding -mno-red-zone -m64 -c "Kernel.cpp" -o "Kernel.o"
echo Done Building
echo Linking
ld -o kernel.tmp -Ttext 0x7e00 ExtendedProgram.o Kernel.o
echo Done Linking
echo Objcopying
objcopy -O binary kernel.tmp Kernel.bin
echo Done Objcopying

copy /b bootloader.bin+Kernel.bin BrickOS.bin

move BrickOS.bin bin/boot/os/BrickOS.bin
copy BrickOS.bin bin/boot/os/BrickOSDebug.bin
