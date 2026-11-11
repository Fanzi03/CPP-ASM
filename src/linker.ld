OUTPUT_FORMAT("binary")
ENTRY(multiplie_matrixies)

SECTIONS {
    .text 0x200000 : {
        *(.text)
        *(.code)
        *(.rodata*)
    }
    .data ALIGN(0x1000) : {
        *(.data)
    }
    .bss ALIGN(0x1000) : {
        *(.bss)
    }
} 