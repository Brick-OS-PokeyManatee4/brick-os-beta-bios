#/bin/bash
echo Making Dirs
mkdir bin
echo Done Making Dirs
echo Building

nasm bootloader.asm -f bin -o bin/bootloader.bin
nasm ExtendedProgram.asm -f bin -o bin/ExtendedProgram.bin
echo Done Building
echo Merging
cat bin/bootloader.bin bin/ExtendedProgram.bin > bin/bootloader.flp
echo Done Merging
echo All Done
