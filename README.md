# 4-bit ALU Design using Verilog

A fully functional 4-bit Arithmetic Logic Unit (ALU) implemented in Verilog HDL and verified using a testbench in Xilinx Vivado.

---

## Supported Operations

| Opcode | Operation | Description |
|--------|-----------|-------------|
| 0000 | ADD | A + B (with carry) |
| 0001 | SUB | A - B (with borrow) |
| 0010 | AND | A & B |
| 0011 | OR | A \| B |
| 0100 | NOT | ~A |
| 0101 | XOR | A ^ B |
| 0110 | INC | A + 1 |
| 0111 | DEC | A - 1 |
| 1000 | EQ | 1 if A == B |
| 1001 | GT | 1 if A > B |

---

## Port Description

| Port | Direction | Width | Description |
|------|-----------|-------|-------------|
| A | Input | 4-bit | Operand A |
| B | Input | 4-bit | Operand B |
| opcode | Input | 4-bit | Operation selector |
| result | Output | 5-bit | Result (4-bit + carry) |
| zero | Output | 1-bit | High when result is 0 |
| carry | Output | 1-bit | Carry / borrow flag |
| equal | Output | 1-bit | High when A == B |
| greater | Output | 1-bit | High when A > B |

---

## Project Structure

```
4-bit-ALU-Verilog/
├── alu_4bit.v        # ALU design (RTL)
├── alu_4bit_tb.v     # Testbench
└── README.md
```

---

## How to Simulate (Vivado)

1. Open Xilinx Vivado and create a new project
2. Add `alu_4bit.v` as design source
3. Add `alu_4bit_tb.v` as simulation source
4. Set `alu_4bit_tb` as the top simulation module
5. Run **Behavioral Simulation**
6. Observe waveforms and console output

---

## Sample Output

```
==============================================
       4-bit ALU Testbench - Chaitanya Patel
==============================================
ADD         | A=5   B=3  | Result=8  | Carry=0
ADD(carry)  | A=15  B=3  | Result=2  | Carry=1
SUB         | A=9   B=4  | Result=5  | Carry=0
AND         | A=1100 B=1010 | Result=1000
OR          | A=1100 B=1010 | Result=1110
NOT         | A=1010 | Result=0101
XOR         | A=1100 B=1010 | Result=0110
INC         | A=6  | Result=7
DEC         | A=6  | Result=5
EQ          | A=7  B=7  | Equal=1
GT          | A=9  B=5  | Greater=1
```

---

## Tools Used

- **Language**: Verilog HDL
- **Simulator**: Xilinx Vivado
- **Concepts**: Combinational logic, ALU design, flag generation

---

## Author

**Chaitanya Patel**  
BTech in Electronics and Communication Engineering  
Birla Vishwakarma Mahavidyalaya, Anand, Gujarat  
[LinkedIn](https://linkedin.com/in/chaitanyapatelece) | chpatel1904@gmail.com
