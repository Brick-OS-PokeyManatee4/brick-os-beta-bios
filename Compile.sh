#/bin/bash
echo Starting To Build
echo Making Dirs
mkdir bin/isoOutput
mkdir bin/boot/os
echo Done Making Dirs
echo Building
nasm bootloader.asm -f bin -o bootloader.bin
nasm ExtendedProgram.asm -f elf64 -o ExtendedProgram.o
gcc -ffreestanding -mno-red-zone -m64 -c "Kernel.cpp" -o "Kernel.o"
echo Done Building
echo Linking
ld -T link.ld ExtendedProgram.o Kernel.o -o Kernel.bin
echo Done Linking
echo Merging
cat bootloader.bin Kernel.bin > bin/boot/os/BrickOS.bin
echo Done Merging
echo Copying BrickOSDebug
cp bin/boot/os/BrickOS.bin bin/boot/os/BrickOSDebug.bin
echo Done Copying Now Grubbing
echo Grubbing
grub-mkrescue -o bin/isoOutput/BrickOSGrub.iso bin
echo Done Grubbing Now Cleaning
echo Cleaning
rm ExtendedProgram.o
rm Kernel.o
rm kernel.bin
echo Done Cleaning
echo All Done
