# 🔁 Lookahead Carry Adder (LACA) in Verilog

This repository contains the design, implementation, and simulation of a **4-bit Lookahead Carry Adder (LACA)** written in Verilog. It includes detailed explanations, well-commented code, and waveform outputs for verification.

---

## 📘 What is a Lookahead Carry Adder?

The **Lookahead Carry Adder (LACA)** is a high-speed digital adder used to perform binary addition with reduced delay compared to traditional **Ripple Carry Adders (RCA)**.

In a Ripple Carry Adder, each bit must wait for the previous carry to compute the sum, which causes **propagation delay** to grow with the number of bits.

LACA overcomes this by:
- Computing **carry signals in parallel**
- Using **Generate (G)** and **Propagate (P)** logic to predict carry values in advance
- Drastically reducing the time it takes to compute the final result

This technique is used in **high-performance processors, ALUs, and arithmetic circuits** where speed is critical.

---

## 💡 Why is LACA Better than RCA?

| Feature             | Ripple Carry Adder (RCA) | Lookahead Carry Adder (LACA) |
|---------------------|---------------------------|-------------------------------|
| Carry Calculation   | Sequential                | Parallel                      |
| Speed               | Slower (O(n) delay)       | Faster (O(log n) delay)       |
| Scalability         | Poor                      | Good                          |
| Complexity          | Low                       | Moderate                      |

In short: **LACA trades off more logic for significantly better performance** — a good choice when speed is more important than gate count.

---

## 🔧 How It Works – Carry Lookahead Logic

Let:
- `A[i]` and `B[i]` be the i-th bits of the input numbers.
- `G[i] = A[i] & B[i]` → Carry Generate
- `P[i] = A[i] ^ B[i]` → Carry Propagate

![schematic](https://github.com/user-attachments/assets/6d1af5ac-0605-4d3f-b342-9419d5de1ca2)

![results (2)](https://github.com/user-attachments/assets/d7ea5d9e-8dbb-41dc-a4e7-565046a34138)

![image](https://github.com/user-attachments/assets/67837f21-2092-4188-b5a1-6e29cb1617f8)

