OUTPUT_ARCH("riscv")
ENTRY(_start)

SECTIONS
{
    /* Tell QEMU to place this code at the start of virt's RAM */
    . = 0x80000000;
    
    .text : {
        *(.text)
    }
}
