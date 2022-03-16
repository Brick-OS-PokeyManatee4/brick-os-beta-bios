#/bin/bash
echo Starting To Build
echo Making Dirs
mkdir bin
echo Done Making Dirs
echo Building
nasm bootloader.asm -f bin -o bootloader.bin
nasm ExtendedProgram.asm -f elf64 -o ExtendedProgram.o
gcc -ffreestanding -mno-red-zone -m64 -c "Kernel.cpp" -o "Kernel.o"
echo Done Building
echo Linking
ld -o kernel.tmp -Ttext 0x7e00 ExtendedProgram.o Kernel.o
echo Done Linking
echo Objcopying
objcopy -O binary kernel.tmp kernel.bin
echo Done Objcopying
echo Merging
cat bootloader.bin kernel.bin > bin/bootloader.flp
echo Done Merging
echo Cleaning
rm ExtendedProgram.o
rm bootloader.bin
rm Kernel.o
rm kernel.bin
echo Done Cleaning
echo All Done
