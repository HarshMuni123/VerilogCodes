# Binary Up/Down Counter

This folder contains the implementation and simulation of a **Binary Up/Down Counter**, a sequential digital circuit that counts in binary, either incrementing (up) or decrementing (down) based on a control input.

## 📄 Description

The binary up/down counter:
- Uses flip-flops to store the count state
- Increments or decrements on each clock pulse depending on the control signal
- May include synchronous or asynchronous reset

## 📁 Files

- `up_down_counter.v` – Main Verilog module
- `up_down_counter_tb.v` – Testbench for simulation
- `README.md` – This documentation

## ▶️ How to Run (Verilog)

```bash
iverilog -o counter_tb up_down_counter.v up_down_counter_tb.v
vvp counter_tb
gtkwave counter_tb.vcd
