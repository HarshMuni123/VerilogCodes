# 🔧 Verilog & HDL Design Library

Welcome to the **Verilog branch** of my digital design repository! This collection includes clean, testbench-verified Verilog implementations of various **combinational**, **sequential**, and **FSM-based** circuits — perfect for VLSI beginners, students, or anyone brushing up on hardware description logic.

---

## 📁 Directory Overview


---

## ✅ Modules by Category

### 🧮 Combinational Logic
| File                        | Description                      |
|-----------------------------|----------------------------------|
| `adder.v`                  | 4-bit binary adder               |
| `mux_2to1.v`               | 2:1 multiplexer                  |
| `comparator.v`             | 2-bit comparator                 |
| `parity_checker.v`         | Odd/even parity detector         |
| `bcd_excess3.v`            | Binary to Excess-3 encoder       |

---

### 🔁 Sequential Logic
| File                        | Description                      |
|-----------------------------|----------------------------------|
| `d_flipflop.v`             | D flip-flop with async reset     |
| `jk_flipflop.v`            | JK flip-flop                     |
| `up_down_counter.v`        | Up/Down 4-bit counter            |
| `shift_register.v`         | 4-bit shift register             |

---

### 🤖 FSM Designs
| File                        | Description                      |
|-----------------------------|----------------------------------|
| `fsm_counter.v`            | 4-state FSM counter              |
| `sequence_detector.v`      | Detects pattern like `1011`      |
| `traffic_light.v`          | Simple traffic light FSM         |
| `vending_machine.v`        | FSM-based coin logic machine     |

---

### 🧪 Testbenches
All modules are testbench-verified. Examples:
- `tb_fsm_counter.v`
- `tb_d_flipflop.v`
- `tb_adder.v`

```bash
# Example usage with Icarus Verilog
iverilog -o sim_out fsms/fsm_counter.v testbenches/tb_fsm_counter.v
vvp sim_out
