## Table of Contents
- [Instruction Set](#instruction-set)

## Instruction Set

Each instruction has a 4-bit opcode OP, and has register fields that are 3 bits wide (RS, RT, and in the case of register-to-register, RD). The register-to-register instructions also include a 3-bit function field, FUNCT, which is sent to the FS input of the ALU. Immediate instructions contain a 6-bit constant, IMM, instead.

<p align="center">
  <img src="../assets/instruction_format.png" alt="instruction_format" width="600">
</p>

<p align="center"><sub>Instruction Format</sub></p>


These are all the currently supported instructions for this microprocessor:

<p align="center">
  <img src="../assets/instruction_set.png" alt="instruction_set" width="600">
</p>

<p align="center"><sub>Instruction Set</sub></p>