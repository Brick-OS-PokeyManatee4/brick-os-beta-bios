#/bin/bash
echo Starting To Build
echo Making Dirs
mkdir bin
echo Done Making Dirs
echo Building

nasm bootloader.asm -f bin -o bootloader.bin
nasm ExtendedProgram.asm -f elf64 -o ExtendedProgram.o
gcc -Ttext 0x8000 -ffreestanding -mno-red-zone -m64 -c "Kernel.cpp" -o "Kernel.o"
echo Done Building
echo Linking
ld -T"linkbinary.ld"
echo Done Linking
echo Merging
cat bootloader.bin kernel.bin > bin/bootloader.flp
echo Done Merging
echo Cleaning
rm ExtendedProgram.o
rm Kernel.o
rm bootloader.bin
rm kernel.bin
ls
echo Done Cleaning
echo All Done
