#/bin/bash
mkdir bin

nasm bootloader.asm -f bin -o bin/bootloader.flp

echo Done
