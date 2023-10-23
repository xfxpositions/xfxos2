; For documentation
; https://www.gnu.org/software/grub/manual/multiboot/multiboot.html

; Multiboot header
section .multiboot
align 4 ; align 32-bit

multiboot_header:
    dd 0x1BADB002 ; magic number
    dd 0x0 ; flags, it's empty by default
    dd - (0x1BADB002 + 0) ; checksum for multiboot header
