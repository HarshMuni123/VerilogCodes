# 🔌 Priority Encoder (8-to-3) - Verilog

A **Priority Encoder** encodes the index of the highest-priority active input. This project includes Verilog implementation using various `case`-based constructs (`case`, `casex`, `casez`) with a focus on functional correctness and synthesis clarity.

---

## 📁 Files

- `priority_encoder.v` - Verilog source code
- `testbench.v` - Testbench for simulation
- `README.md` - Project documentation

---

## 🧠 What is a Priority Encoder?

A **priority encoder** takes multiple input lines and outputs the binary representation of the index of the highest-priority active input bit.

For an 8-to-3 encoder:
- Input: 8 bits (`in[7:0]`)
- Output: 3 bits (`out[2:0]`)
- If multiple inputs are high, the **highest index input** gets priority.

---

## 🔢 8-to-3 Priority Encoder Truth Table

| Input (`in[7:0]`) | Priority Bit | Output (`out[2:0]`) | Valid (`valid`) |
|-------------------|--------------|----------------------|------------------|
| 1000_0000         | in[7]        | 111                  | 1                |
| 0100_0000         | in[6]        | 110                  | 1                |
| 0010_0000         | in[5]        | 101                  | 1                |
| 0001_0000         | in[4]        | 100                  | 1                |
| 0000_1000         | in[3]        | 011                  | 1                |
| 0000_0100         | in[2]        | 010                  | 1                |
| 0000_0010         | in[1]        | 001                  | 1                |
| 0000_0001         | in[0]        | 000                  | 1                |
| 0000_0000         | None         | xxx (don’t care)     | 0                |

---

## 💻 Verilog Conditional Constructs: `case` vs `casex` vs `casez`

Verilog provides different variants of the `case` statement, which affect how unknown (`x`) and high-impedance (`z`) values are treated.

### ✅ Comparison Table

| Construct | Behavior with `x` | Behavior with `z` | Synthesis Notes |
|-----------|-------------------|-------------------|-----------------|
| `case`    | Matches only exact values. `x`/`z` in inputs will not match any constant. | No special treatment. | Strict matching. Reliable for synthesis. |
| `casex`   | Treats `x` and `z` in **both** case expression and case items as **don't cares**. | Treated as wildcard. | Not synthesis-friendly, unsafe for critical logic. |
| `casez`   | Treats `z` (and optionally `?`) as **don’t care** in **case items only**. | Allows pattern matching like `casez (a) 4'b1???: ...`. | Safe for masking inputs like priority encoders. Preferred over `casex`. |

### 📌 Example: `casez` for Priority Encoder

```verilog
always @(*) begin
  casez (in)
    8'b1???????: out = 3'd7;
    8'b01??????: out = 3'd6;
    8'b001?????: out = 3'd5;
    ...
    default:     out = 3'dx;
  endcase
end
iverilog -o encoder_tb priority_encoder.v testbench.v
vvp encoder_tb
