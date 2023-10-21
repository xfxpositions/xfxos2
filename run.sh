build=build # build dir
isoname=xfxos.iso # isoname
mkdir -p $build # create build dir

zig build # build with build.zig file 
nasm src/boot.s -f elf32 -o build/boot.o # compile multiboot header
ld -m elf_i386 -T linker.ld -o build/isofiles/boot/kernel.bin build/boot.o build/kernel.o # link the kernel

d=build/isofiles/boot/grub
mkdir -p "$d" && cp grub.cfg "$d"

sudo grub-mkrescue -o build/os.iso build/isofiles # create iso
qemu-system-i386 build/os.iso # run with qemu
