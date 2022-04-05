OUTPUT_FORMAT(binary)

ENTRY (_start)

SECTIONS
{
    . = 1M;

    .data BLOCK(4K) : ALIGN(4K)
    {
      *(.data)
    }

    .rodata BLOCK(4K) : ALIGN(4K)
    {
      *(.rodata)
    }

    .bss BLOCK(4K) : ALIGN(4K)
    {
    *(COMMON)
    *(.bss)
    }


}
