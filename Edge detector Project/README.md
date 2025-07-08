# 🔍 Verilog Edge Detector

This project implements a **rising edge detector** using Verilog. It detects when a signal transitions from low (`0`) to high (`1`) and produces a single-cycle pulse (`rise`) synchronized to the clock.

---

## 📁 Files

- `edge_detector.v` — RTL module for rising edge detection  
- `testbench.v` — Testbench to simulate and verify functionality  
- `waveform.png` — Simulation waveform showing signal transitions  
- `README.md` — This file

---

## ⚙️ How It Works

The module uses two internal registers:
- `curr` — current value of the input signal
- `prev` — previous value of the signal (1 clock cycle delayed)

On each rising edge of `clk`, it updates `curr` and `prev`, and sets `rise` high for one cycle when `curr=1` and `prev=0`.

![result](https://github.com/user-attachments/assets/dc03e0f4-c458-4717-9fad-d18ee40cbd4d)
![simulation](https://github.com/user-attachments/assets/d0221697-16e2-42bd-b7fb-a34f1ba436c3)
![schematic](https://github.com/user-attachments/assets/0e2b0ebd-2043-4e60-a627-0a3a83f93689)




```verilog
assign rise = ~prev & curr;


