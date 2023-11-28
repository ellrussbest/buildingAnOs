; x86 assembly language
; How a computer starts up
; 1. BIOS is copied from a ROM chip into RAM
; 2. BIOS starts executing code
;   - initializes hardware
;   - runs some tests (POST = power-on self test)
; 3. BIOS searches for an operating system to starts
; 4. BIOS loads and starts the operating system
; 5. Operating system runs

; We have two ways in which the BIOS can load the operating system
; 1. Legacy Booting
;    - BIOS loads first sector of each bootable device into memory (at location 0x7C00)
;    - BIOS checks for 0xAA55 signature
;    - If found, it starts executing the code

; 2. EFI (Extensible Firmware Interface)
;   - BIOS looks into special EFI partitions
;   - Operating system must be compiled as an EFI program

; We will go with the (Legacy Booting)
; We will write the code
; Then assemble the code
; Then load it on the first sector of our disk
; Then we add the signature that the BIOS requires

; Our BIOS always puts our operating system on the address 7C00
; So the first thing we need to do is to give our assembler this information
; This is done using the org directive
; This will tell assembler to calculate all memory offset starting at the address 0x7C00
; Changing this address to another address, say, won't make the BIOS load at a different address
; It will only tell the assembler that the variables and labels from our code should be calculated with the offset 0x7C00

; Difference Between directive and instruction
; Directive -> Gives a CLUE to the assembler that will affect how th program gets compiled. Not translated to machine code.
;           -> Assembler specific - different assemblers might have different directives
; Instruction -> Translated to a machine code instruction that the CPU will execute

; ORG (Tells the assembler where we expect our code to be loaded. The assembler uses this infomration to calculate label adresses)
org 0x7C00

; We tell our assembler to emit 16 bit code (this could either be 16, 32, or 64 bit code)
; Because of backward compatibility, the CPU always starts in 16 bit mode
bits 16

; Start of comment
%if 0
    ; Javascript representation of the code
    ; Define a function called main
    function main() {
        // Halt the program
        hlt();
    }

    ; Create an infinite loop by jumping back to the halt function
    function halt() {
        jmp(halt);
    }

    ; Fill the remaining memory space with zeros
    let remainingSpace = 510 - (currentAddress() - startAddress())
    for (let i = 0 i < remainingSpace i++) {
        writeByte(0)
    }

    ; Write the boot signature at the end of the boot sector
    writeWord(0xAA55);
%endif
; End of comment

main:
    hlt
.halt:
    jmp .halt

times 510-($-$$) db 0
dw 0AA55h