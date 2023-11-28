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
