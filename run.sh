zig build
nasm src/boot.s -f elf32 -o build/boot.o
ld -m elf_i386 -Ttext 0x100000 -o build/kernel.bin build/boot.o build/kernel.o
sudo grub-mkrescue -o build/os.iso grub/grub.cfg build/kernel.bin
qemu-system-i386 build/os.iso
