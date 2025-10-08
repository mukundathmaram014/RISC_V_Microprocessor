# RISC-V Microprocessor

This project implements a RISC-V microprocessor in Verilog. It includes core modules such as the ALU, control unit, register file, decoder, memory interfaces, and testbenches for simulation.

## 📘 Documentation

For in-depth explanations of the architecture and interface, see the [**docs/**](./docs/) folder.

## Features

- Modular Verilog design
- Implements basic RISC-V instruction set
- Includes ALU, control logic, register file, decoder, shifter, sign extender, and memory modules
- Testbench for simulation and verification
- Pin model and flow reports for FPGA synthesis

## File Structure

- `adder.v`, `alu.v`, `control.v`, `decoder.v`, `dram.v`, `haltlogic.v`, `iram.v`, `logical.v`, `pc.v`, `regfile.v`, `shifter.v`, `signextend.v`: Core Verilog modules
- `cpu.v`: Top-level CPU module
- `cpu_testbench.v`: Testbench for simulation
- `RISC_V_Microprocessor.qpf`, `.qsf`, `.qws`: Quartus project files
- `RISC_V_Microprocessor_description.txt`: Project description
- `README.md`: Project documentation

## Getting Started

1. Clone the repository.
2. Open the project in your preferred Verilog IDE or Quartus.
3. Simulate using the provided testbench (`cpu_testbench.v`).
4. Synthesize for FPGA using the Quartus project files.

## Requirements

- Verilog simulator (e.g., ModelSim, Icarus Verilog)
- Quartus Prime (for FPGA synthesis)

## Usage

- Edit and simulate modules as needed.
- Use the testbench to verify functionality.
- Synthesize and deploy to supported FPGA boards.
