# 🔢 Decade Counter in Verilog

This project implements a **Decade Counter (0–9)** using Verilog, along with a corresponding testbench for functional verification. The decade counter counts from 0 to 9 and resets back to 0, with synchronous reset and enable controls.

## 📁 Files

- `decade_counter.v` - The main Verilog module that implements the decade counter.
- `decade_counter_tb.v` - A testbench to simulate and verify the behavior of the decade counter.
- `README.md` - Project documentation.

## 🔧 Module Description

### Module: `decade_counter`

| Port | Direction | Width | Description              |
|------|-----------|-------|--------------------------|
| clk  | Input     | 1     | Clock signal             |
| rst  | Input     | 1     | Synchronous reset        |
| en   | Input     | 1     | Enable signal            |
| out  | Output    | 4     | 4-bit counter output (0–9)|

### Behavior
- When `rst` is asserted (1), the counter resets to `0` on the rising edge of the clock.
- If `en` is asserted and `rst` is deasserted, the counter increments on each clock cycle.
- When the counter reaches `9`, it rolls over to `0` on the next clock edge.

## 🧪 Testbench: `decade_counter_tb.v`

The testbench verifies:
- Reset functionality
- Enabled counting
- Disabled counting (holding state)
- Proper rollover from 9 → 0

## ▶️ How to Simulate

### Using Icarus Verilog

```bash
# Compile the design and testbench
iverilog -o sim_out decade_counter.v decade_counter_tb.v

# Run the simulation
vvp sim_out
