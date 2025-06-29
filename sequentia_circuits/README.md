# Sequential Circuits

This repository contains implementations and simulations of **sequential circuits**, which are digital circuits whose outputs depend on both current inputs and past states. These circuits are fundamental to memory elements and control logic in digital systems.

## 📁 Folder Structure

Each subdirectory in this folder contains a specific type of sequential circuit or concept:

- `flip_flops/` — SR, D, JK, and T Flip-Flops
- `counters/` — Binary, Up/Down, Ring, and Johnson Counters
- `shift_registers/` — SISO, SIPO, PISO, and PIPO shift registers
- `fsm/` — Finite State Machines (Moore and Mealy)
- `memory/` — Basic RAM/ROM implementations (if applicable)

## ⚙️ Requirements

To run simulations or view circuit designs, you may need one or more of the following tools:

- [Icarus Verilog](http://iverilog.icarus.com/) – Verilog simulation
- [GTKWave](http://gtkwave.sourceforge.net/) – View simulation waveforms
- [Vivado](https://www.xilinx.com/products/design-tools/vivado.html) – Synthesis & FPGA deployment
- [Logisim](http://www.cburch.com/logisim/) – Circuit visualization

## ▶️ Running Examples

To simulate a Verilog design:

```bash
cd flip_flops/d_flip_flop
iverilog -o dff_tb d_flip_flop.v dff_tb.v
vvp dff_tb
gtkwave dff_tb.vcd
