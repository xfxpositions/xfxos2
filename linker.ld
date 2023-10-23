ENTRY(_start)

SECTIONS {
    . = 0x00100000;

    .text ALIGN (4K) : AT(ADDR(.text) - 0x100000) {
        *(.multiboot)
        *(.text)
    }

    .rodata ALIGN (4K) : AT(ADDR(.rodata) - 0x100000) {
        *(.rodata)
    }

    .data ALIGN (4K) : AT(ADDR(.data) - 0x100000) {
        *(.data)
    }

    .bss ALIGN (4K) : AT(ADDR(.bss) - 0x100000) {
        *(COMMON)
        *(.bss)
    }
}
