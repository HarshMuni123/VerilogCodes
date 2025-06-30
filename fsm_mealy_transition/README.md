# 🔁 Mealy FSM Sequence Detector (Verilog)

This project implements a **Mealy finite state machine (FSM)** in Verilog HDL to detect a specific bit sequence. It also includes a testbench for simulation.

---

## 🚀 Project Overview

- **FSM Type**: Mealy
- **Purpose**: Detect the bit pattern `01`
- **Behavior**:
  - Outputs `1` on detecting the sequence `0` followed by `1`
  - Output is generated during the `1` bit of the pattern
  - Overlapping sequences supported (e.g., `0101` outputs twice)

---

## 📁 Files Included

| File | Description |
|------|-------------|
| `mealy_fsm.v` | Verilog module for the FSM |
| `mealy_fsm_tb.v` | Testbench to verify FSM functionality |
| `waveform.png` | (Optional) Screenshot of simulation waveform |
| `README.md` | Project documentation |

---

## 🔧 How It Works

### States:
- `S0`: Initial state
- `S1`: After detecting `0`

### Transition Table:

| Current State | Input | Next State | Output |
|---------------|-------|------------|--------|
| `S0`          | `0`   | `S1`       | `0`    |
| `S0`          | `1`   | `S0`       | `0`    |
| `S1`          | `0`   | `S1`       | `0`    |
| `S1`          | `1`   | `S0`       | `1` ✅ |

---

## 🧪 Simulation

### Tools Used:
- ModelSim / Vivado / any Verilog simulator

### Sample Output:

Time clk reset in_bit out

30ns 0 0 1 1

50ns 0 0 1 1

90ns 0 0 1 1
