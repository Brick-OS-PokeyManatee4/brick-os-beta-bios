#/bin/bash
echo Starting To Build
echo Making Dirs
mkdir bin
echo Done Making Dirs
echo Building
nasm bootloader.asm -f bin -o bootloader.bin
nasm ExtendedProgram.asm -f bin -o ExtendedProgram.bin
echo Done Building
echo Merging
cat bootloader.bin ExtendedProgram.bin > bin/bootloader.flp
echo Done Merging
echo Cleaning
rm ExtendedProgram.bin
rm bootloader.bin
echo Done Cleaning
echo All Done
