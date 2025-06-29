
---

## ✅ 2. README for `32-bit Adder using 16-bit Adder`

```markdown
# ➕ 32-bit Ripple Carry Adder using 16-bit Adders (Hierarchical Design)

This Verilog project demonstrates a **modular, hierarchical design** of a 32-bit ripple-carry adder constructed from two chained 16-bit adders. It emphasizes **reusability** and **modularization** in digital circuit design.

---

## 🔧 Modules

### 🧩 `adder_16bit.v`
- Performs 16-bit binary addition with carry in/out.
- Used twice in the top-level 32-bit design.

### 🧠 `adder_32bit.v`
- Instantiates two `adder_16bit` modules.
- First handles bits [15:0], second handles [31:16] with carry propagation.

---

## 📥 Inputs (for `adder_32bit.v`)
| Signal   | Width   | Description              |
|----------|---------|--------------------------|
| `A`      | 32 bits | First operand            |
| `B`      | 32 bits | Second operand           |
| `cin`    | 1 bit   | Initial carry-in         |

## 📤 Outputs
| Signal   | Width   | Description              |
|----------|---------|--------------------------|
| `sum`    | 32 bits | Final sum output         |
| `cout`   | 1 bit   | Final carry-out          |

---

## 🔁 Hierarchical Structure


---

## 🧪 Testbench: `tb_adder_32bit.v`

Includes:
- Varying operands with carry-in/out checks
- Edge cases: all 0s, max unsigned, overflow

### Sample Simulation Output:

---

## 💻 How to Run

### Using Icarus Verilog:
```bash
iverilog -o add32_test adder_16bit.v adder_32bit.v tb_adder_32bit.v
vvp add32_test
