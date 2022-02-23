#/bin/bash
mkdir bin

nasm bootloader.asm -f bin -o bin/bootloader.bin
nasm ExtendedProgram.asm -f bin -o bin/ExtendedProgram.bin
cat bin/bootloader.bin bin/ExtendedProgram.bin > bin/bootloader.flp

echo Done
