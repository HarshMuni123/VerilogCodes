# 🔍 1011 Pattern Detector using Mealy FSM (Verilog)

This project implements a **Mealy Finite State Machine (FSM)** in Verilog to detect the binary pattern `1011` from a serial input stream. The FSM supports **overlapping detection**, meaning it can detect multiple occurrences of the pattern even if they share bits.

---

## 📌 Features

- Pattern to detect: `1011`
- FSM Type: Mealy Machine
- Overlapping patterns supported
- Clock and reset controlled
- Clean Verilog testbench included

---

## 🧠 FSM State Diagram (Textual)

```text
States: S0 -> S1 -> S10 -> S101 -> DETECT
Input:    1     0      1      1
fsm_1011_pattern/
├── fsm_1011_pattern.v         # Main FSM module (Mealy)
├── tb_fsm_1011_pattern.v      # Testbench
└── README.md                  # Project documentation
Input:    1 0 1 1 0 1 1
Time(ns):10 20 30 40 50 60 70
Detected:      0 0 0 1 0 0 1
iverilog -o fsm_test fsm_1011_pattern.v tb_fsm_1011_pattern.v
vvp fsm_test
# Add inside testbench:
$dumpfile("wave.vcd");
$dumpvars(0, tb_fsm_1011_pattern);

# Then run:
vvp fsm_test
gtkwave wave.vcd
Time   in_bit  Detected
10     1       0
20     0       0
30     1       0
40     1       1   <-- Pattern 1011 detected
...
