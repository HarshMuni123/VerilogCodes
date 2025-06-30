# 🔁 FSM Counter (4-State Sequence)

This module implements a **4-state Finite State Machine (FSM) counter** in Verilog. The FSM cycles through the states `s0 → s1 → s2 → s3 → s0` based on the input `din`, advancing on each rising edge of `clk` when `din = 1`. If `din = 0`, the FSM holds its current state.

---

## 🔧 Module: `fsm_counter.v`

### 📥 Inputs:
| Signal | Width | Description               |
|--------|-------|---------------------------|
| `clk`  | 1-bit | Clock signal              |
| `reset`| 1-bit | Synchronous reset (active high) |
| `din`  | 1-bit | Input signal to control state transition |

### 📤 Output:
| Signal | Width | Description         |
|--------|-------|---------------------|
| `z`    | 2-bit | Current state output|

---

## 🔁 FSM State Diagram

    +-----+    din=1    +-----+    din=1    +-----+    din=1    +-----+
    | s0  | ----------> | s1  | ----------> | s2  | ----------> | s3  |
    +-----+             +-----+             +-----+             +-----+
       ^                                                       |
       |----------------------- din=1 -------------------------|

- FSM **holds** its state if `din = 0`.

---

## 🧪 Testbench: `tb_fsm_counter.v`

Includes:
- Clock generator
- Reset sequence
- Din stimulus: `1 → 1 → 0 → 1 → 1 → 0 → 1`
- `$monitor` output for simulation log

### Sample Output:
| Time (ns) | clk | reset | din | z (state) |
| --------- | --- | ----- | --- | --------- |
| 10        | 0   | 0     | 1   | 01 (s1)   |
| 20        | 0   | 0     | 1   | 10 (s2)   |
| 30        | 0   | 0     | 0   | 10 (s2)   |
| 40        | 0   | 0     | 1   | 11 (s3)   |
| 50        | 0   | 0     | 1   | 00 (s0)   |


---

## 💻 Run Instructions

### Using Icarus Verilog:
```bash
iverilog -o fsm_test fsm_counter.v tb_fsm_counter.v
vvp fsm_test
