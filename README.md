# VLSI Digital Design Portfolio

This repository contains my digital design modules and testbenches as I transition toward advanced ASIC/SoC Design Verification (DV) roles. It showcases structural RTL coding in Verilog alongside progressive verification techniques.

## 🚀 Current Modules

### 1. 2-to-1 & 4-to-1 Multiplexer (`2to1_MUX.v` `4to1_mux.v`)
* **Type:** Combinational Logic
* **Description:** A basic multiplexer routing one of two input lines to a single output based on a selection line.
* **Verification Status:** Basic functional simulation complete.

### 2. Parity Generator (`Parity_generator.v`)
* **Type:** Error Detection Logic
* **Description:** Generates a parity bit for input data packets to ensure data integrity during transmission.
* **Verification Status:** Basic directed testing complete.# vlsi-digital
Verilog designs and testbenches for digital logic modules, transitioning toward SystemVerilog and UVM verification.

### 3. 2-Bit Comparator (`2-Bit_Comparator.v`)
Type
* **Hardware Description Language (HDL) Component**
* **Modeling Style:** Structural / Gate-Level Modeling (built entirely using primitive gates: `not`, `and`, `or`).

### Description
This module takes two 2-bit inputs, A (A₁A₀) and B (B₁B₀), and yields three distinct single-bit binary outputs representing their relationship:
* **Equal (A = B):** High (`1`) when both numbers match bit-for-bit.
* **Greater (A > B):** High (`1`) when A is numerically larger than B.
* **Less (A < B):** High (`1`) when A is numerically smaller than B.

The circuit is optimized using Boolean logic derived from Karnaugh Maps (K-Maps), utilizing an internal signal E₁ to track Most Significant Bit (MSB) equality before checking Least Significant Bit (LSB) variance.

### Verification Type
* **Exhaustive Simulation (Behavioral Testbench Verification)**
* **Mechanism:** An automated, stimulus-driven testbench (`tb_comparator_2bit`) that leverages a 4-bit concurrent concatenation loop (`{A1, A0, B1, B0} = i`).
* **Coverage:** **100% Exhaustive Verification**, cycling systematically through all 2⁴ = 16 possible binary input combinations with dedicated propagation delays (`#10`) to print a formatted logic truth table to the simulator output.

### 4. Parameterized ALU Design – Verilog ( Design_ALU_Basic_Operation.sv)
* **Designed a parameterized ALU in Verilog supporting four operations:

    00 → Addition
    01 → Subtraction
    10 → AND
    11 → OR
  
* **Status Flags

The ALU generates four status flags based on the operation result:

OF – Overflow Flag: Indicates signed arithmetic overflow.
ZF – Zero Flag: Set when the result is zero.
SF – Sign Flag: Indicates the sign of the result using the MSB.
PF – Parity Flag: Set when the result contains an even number of 1s.
* **Inputs
A – First operand (parameterized width)
B – Second operand (parameterized width)
opcode – 2-bit operation selector
* **Outputs
C – ALU result (parameterized width)
OF – Overflow Flag
ZF – Zero Flag
SF – Sign Flag
PF – Parity Flag


### 5. Create a 4-to-16 line decoder using Structural modeling. Implement it by connecting multiple 2-to-4 decoders.

### Code Flow — 4-to-16 Decoder
Input: 4-bit input A[3:0].
First Decoder (D0): Takes A[3:2] and generates 4 enable signals EN[3:0].
Group Selection: Only one EN signal becomes 1 based on A[3:2].
Second-Level Decoders (D1–D4): All receive A[1:0].
Enable: Only the decoder whose EN is 1 becomes active.
Output: That decoder selects one output out of its 4 outputs.
Final Result: One of the 16 outputs Y[15:0] becomes 1, while all others remain 0.
Testbench: A is tested from 0000 to 1111 to verify all 16 combinations.

Simple flow:

A[3:2] → D0 → EN[3:0] → Select Decoder → A[1:0] → Y[15:0]

Example:

A = 1010 → A[3:2] = 10 → Select D3 → A[1:0] = 10 → Y10 = 1.
