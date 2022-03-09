#/bin/bash
echo Starting To Build
echo Making Dirs
mkdir bin
echo Done Making Dirs
echo Building

nasm bootloader.asm -f bin -o bin/bootloader.bin
nasm ExtendedProgram.asm -f elf64 -o bin/ExtendedProgram.o
gcc -Ttext 0x8000 -ffreestanding -mno-red-zone -m64 -c "Kernel.cpp" -o "bin/Kernel.o"
echo Done Building
echo Linking
ld -o "Kernel.tmp" -Ttext 0x7e00 bin/ExtendedProgram.o bin/Kernel.o
echo Done Linking
echo Objcoping
objcopy -O binary Kernel.tmp bin/kernel.bin
echo Done Objcoping
echo Merging
cat bin/bootloader.bin bin/kernel.bin > bin/bootloader.flp
echo Done Merging
echo All Done
