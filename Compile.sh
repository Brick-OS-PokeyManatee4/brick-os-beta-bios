#/bin/bash
echo Starting To Build
echo Making Dirs
mkdir bin
echo Done Making Dirs
echo Building

nasm bootloader.asm -f bin -o bin/bootloader.bin
nasm ExtendedProgram.asm -f elf64 -o bin/ExtendedProgram.o
x86_64-elf-gcc -Ttext 0x8000 -ffreestanding -mno-red-zone -m64 -c "Kernel.cpp" -o "Kernel.o"
echo Done Building
echo Linking
ld -o "Kernel.elf" -Ttext 0x7e00 bin/ExtendedProgram.o Kernel.o
echo Done Linking
echo Objcoping
objcopy -o binary Kernel.elf bin/Kernel.bin
echo Done Objcoping
echo Merging
cat bin/bootloader.bin bin/Kernel.bin > bin/bootloader.flp
echo Done Merging
echo All Done
