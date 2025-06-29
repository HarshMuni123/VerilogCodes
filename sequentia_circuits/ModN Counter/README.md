# Mod-N Counter

This folder contains the implementation of a **Mod-N Counter**, a digital sequential circuit that counts from 0 up to N-1 and then resets back to 0. These counters are widely used in digital clocks, timers, frequency division, and control circuits.

## 📄 Description

A Mod-N counter:
- Counts cyclically from `0` to `N-1`
- Resets automatically after reaching `N`
- Can be implemented as an up-counter or down-counter
- May be synchronous or asynchronous in design

The value of `N` can be modified in the code to create counters like Mod-6, Mod-10, Mod-12, etc.

## 📁 Files

- `mod_n_counter.v` — Verilog source code for the Mod-N counter
- `mod_n_counter_tb.v` — Testbench to verify the functionality
- `README.md` — Documentation for the module

## ▶️ How to Run (Using Icarus Verilog)

```bash
iverilog -o modn_tb mod_n_counter.v mod_n_counter_tb.v
vvp modn_tb
gtkwave modn_tb.vcd
