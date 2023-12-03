# Assembly Language

- Assembly is a human readable interpretation of a machine code
- When you compile a program in a programming language such as C or C++, it gets converted into a machine code which is the language that the processor understands
- Assembly makes it easier for us humans to read and write the code
- High level such as C or C++ need to be tranlated by the compiler into machine code
- This will involve multiple steps; like building an abstract syntax tree and huge amount of optimization
- Assembly is much simpler, because the instruction need to be converted into the machine code via a tool called an assembler
- Assembly instruction is made up of [mnemonic] and [operand] e.g.
  - add ax, 7 (add is the mnemonic while ax and 7 are operands)
  - mov bx, ax
  - inc ax

- The assembly language are different depending on different processors, i.e. the instructions supported on x86 processors(desktops and laptops) are different than the instructions supported on an arm cpu (tablets and smart phones)
- Most processors, however, keep backward comaptibility so that old programs can still run without modification

## Breaking down registers
1. Accumulator: The accumulator register is used to store intermediate results during calculations in a computer's central processing unit (CPU). It helps in performing arithmetic and logical operations.

2. Counter: The counter register is used to keep track of the number of times a particular event or instruction has occurred. It is commonly used in loops and counting operations (counting the number of occurrences of a specific event)

3. Data: The data register is used to store data that is being transferred to or from the CPU. It is used to hold the operands of arithmetic and logic operations, as well as the results of these operations.

4. Base: The base register, also known as the base address register, is used in memory addressing. It holds the starting address of a memory block or segment. It helps in accessing memory locations relative to the base address. It is often used in combination with an offset to calculate the actual address of a memory location.

## A simple example demonstrating the use of accumulator, counter, data, and base registers

```assembly
section .data
    ; Data section
    msg db 'Hello, world!', 0

section .text
    global _start

_start:
    ; Code section
    ; Use the data register to load the address of the message
    mov edx, msg
    ; Use the counter register to set the length of the message
    mov ecx, 13
    ; Use the base register to specify the file descriptor (1 for stdout)
    mov ebx, 1
    ; Use the accumulator register to specify the system call number (4 for sys_write)
    mov eax, 4
    ; Make the system call to write the message to the console
    int 0x80
    ; Use the accumulator register to specify the system call number (1 for sys_exit)
    mov eax, 1
    ; Use the data register to specify the exit code
    xor ebx, ebx
    ; Make the system call to exit the program
    int 0x80
```

# Explanation
In this example, the assembly code uses the accumulator (eax), counter (ecx), data (edx), and base (ebx) registers to perform the following operations:
1. Load the address of the message into the data register (edx).
2. Set the length of the message in the counter register (ecx).
3. Specify the file descriptor for stdout in the base register (ebx).
4. Specify the system call number for sys_write in the accumulator register (eax).
5. Make the system call to write the message to the console using int 0x80.
6. Specify the system call number for sys_exit in the accumulator register (eax).
7. Specify the exit code in the data register (ebx).
8. Make the system call to exit the program using int 0x80.

This example demonstrates how the different registers are used in a simple assembly program to perform input/output and control flow operations