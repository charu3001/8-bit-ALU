# 8-bit ALU Design & Verification
### Verilog HDL | Xilinx Vivado | Artix-7 (XC7A200T)

---

## Overview

A fully verified 8-bit Arithmetic Logic Unit (ALU) designed in Verilog HDL and synthesized on the Xilinx Artix-7 FPGA platform. The design supports 8 operations selected via a 3-bit opcode and was verified through behavioral simulation with a comprehensive testbench.

---

## Synthesis Results (Xilinx Artix-7 — XC7A200T)

| Parameter               | Value              |
|-------------------------|--------------------|
| Target Device           | Xilinx Artix-7 (XC7A200T) |
| Tool                    | AMD/Xilinx Vivado  |
| Slice LUTs              | 34                 |
| Slice Registers         | 0 (combinational design) |
| F7 Muxes                | 8                  |
| Critical Path Delay     | 7.5 ns             |
| Theoretical Max Freq    | ~132 MHz           |
| LUT Utilization         | 0.05%              |

---

## Supported Operations

| Opcode (3-bit) | Operation     | Description                  |
|----------------|---------------|------------------------------|
| 000            | ADD           | A + B                        |
| 001            | SUB           | A - B                        |
| 010            | AND           | A & B (bitwise)              |
| 011            | OR            | A \| B (bitwise)             |
| 100            | XOR           | A ^ B (bitwise)              |
| 101            | NOT           | ~A (bitwise complement)      |
| 110            | SHL           | A << 1 (logical shift left)  |
| 111            | SHR           | A >> 1 (logical shift right) |

---

## Design Details

- **Architecture:** Combinational logic — no clock required
- **Data width:** 8-bit inputs (A, B) and 8-bit output (result)
- **Operation select:** 3-bit opcode control logic
- **Process:** Synthesized on Xilinx Artix-7 using Vivado 2024.x
- **Critical path:** B[1] → result[5] through CARRY4 → LUT2 → LUT6 → MUXF7 → OBUF (7 logic levels)

---

## Repository Structure

```
8-bit-ALU/
│
├── src/
│   └── alu.v              # ALU RTL design (Verilog)
│
├── tb/
│   └── tb_alu.v           # Testbench — all 8 operations verified
│
├── reports/
│   ├── utilization.rpt    # Post-synthesis utilization report
│   └── timing.rpt         # Timing analysis report
│
├── sim/
│   └── waveform.png       # Vivado simulation waveform screenshot
│
└── README.md
```

---

## How to Run

### Simulate in Vivado
1. Clone the repository
   ```bash
   git clone https://github.com/charu3001/8-bit-ALU.git
   ```
2. Open Vivado → Create Project → Add `src/alu.v` and `tb/tb_alu.v`
3. Set `tb_alu` as the simulation top module
4. Run Behavioral Simulation → observe waveform output

### Run Synthesis
1. Set `alu` as the top synthesis module
2. Select target: `xc7a200tsbg484-1` (Artix-7)
3. Run Synthesis → open Utilization and Timing reports

---

## Key Design Decisions

**Why combinational (no clock)?**
An ALU is fundamentally a combinational block — it computes results based purely on inputs with no state. Adding registers would belong at the pipeline stage level, not inside the ALU itself. This keeps the design modular and reusable.

**Why does the critical path go through CARRY4?**
The ADD operation uses Vivado's carry-chain primitive (CARRY4) for efficient ripple-carry addition. The longest path runs through the carry chain from LSB to MSB, which is expected behavior for an adder-based ALU.

**Latch-free design**
All case branches include a `default` clause ensuring no unintended latches are inferred during synthesis — confirmed by zero Slice Registers in the utilization report.

---

## Simulation Results

All 8 operations verified through testbench simulation:

```
ADD:  8'hA + 8'h5  = 8'hAF  ✓
SUB:  8'hA - 8'h5  = 8'h05  ✓
AND:  8'hF0 & 8'h0F = 8'h00 ✓
OR:   8'hF0 | 8'h0F = 8'hFF ✓
XOR:  8'hFF ^ 8'hF0 = 8'h0F ✓
NOT:  ~8'hAA        = 8'h55  ✓
SHL:  8'h01 << 1    = 8'h02  ✓
SHR:  8'h80 >> 1    = 8'h40  ✓
```

---

## Tools Used

| Tool              | Version      |
|-------------------|--------------|
| AMD/Xilinx Vivado | 2024.x       |
| Verilog HDL       | IEEE 1364-2001 |
| Target FPGA       | Artix-7 XC7A200T |

---

## Author

**Charu Smitha C**  
M.Tech — VLSI & Embedded Systems  
Siddaganga Institute of Technology, Tumkur  
[linkedin.com/in/charusmitha-c](https://linkedin.com/in/charusmitha-c)

---

## Related Projects

- [D Flip-Flop Full-Custom Layout & 16-bit LFSR](../DFF-LFSR) — Cadence Virtuoso, TSMC 180nm
- [ECG Smart Loop Recorder](../ECG-SmartLoopRecorder) — MATLAB, Arduino Uno, Raspberry Pi Pico
