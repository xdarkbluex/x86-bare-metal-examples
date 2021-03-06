/*
# PIT protected mode

Expected output:

    00000020\n

is printed to the screen infinitely with the minimum PIT frequency.
*/

#include "common.h"
BEGIN
    STAGE2
    CLEAR
    PROTECTED_MODE
    IDT_SETUP_48_ISRS
    REMAP_PIC_32
    PIT_GENERATE_FREQUENCY
    PIT_SET_MIN_FREQ
    sti
    jmp .
IDT_48_ENTRIES
interrupt_handler:
    mov 4(%esp), %eax
    VGA_PRINT_HEX_4 <%eax>
    ret
