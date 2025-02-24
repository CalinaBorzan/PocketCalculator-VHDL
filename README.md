# Pocket Calculator

## Overview
The **Pocket Calculator** is a hardware-based project designed to perform basic arithmetic operations using an **FPGA (Field-Programmable Gate Array) board**. The calculator operates on **8-bit signed numbers** and displays results on a **7-segment display**. Implemented in **VHDL**, the project runs on the **Basys3 FPGA board** and allows users to input numbers and select operations using board switches, with results displayed in **hexadecimal format**.

## Features
- **Basic Arithmetic Operations**: Supports **addition, subtraction, multiplication, and division**.
- **8-bit Signed Numbers**: Handles both positive and negative values.
- **7-Segment Display**: Displays computation results in **hexadecimal format**.
- **User Input via Switches**: Users enter numbers and select operations via FPGA board switches.
- **Error Handling**: Properly manages negative numbers and displays the result sign.
- **Modular Design**: Designed with modular components for easy implementation and debugging.

## Technologies Used
- **Hardware Description Language**: VHDL
- **FPGA Board**: Basys3 (Artix-7 FPGA)
- **Development Tools**: Vivado Design Suite
- **Simulation**: Testbenches to verify component functionality

## Architecture
The project is divided into two main units:
- **Control Unit (CU)**: Manages data flow and control signals between components.
- **Execution Unit (EU)**: Performs arithmetic operations.

### Key Components
- **1-bit Full Adder**: Performs fundamental addition operations.
- **8-bit Adder/Subtractor**: Uses cascaded **1-bit full adders** for 8-bit calculations.
- **Multiplier**: Implements multiplication using **adder/subtractor** logic.
- **Divider**: Uses **shifting and subtraction** for division.
- **Comparator**: Compares two 8-bit numbers to determine equality or order.
- **Display Controller**: Manages the **7-segment display** for result visualization.

## Installation & Setup
1. **Clone the Repository**:
   ```sh
   git clone https://github.com/CalinaBorzan/PocketCalculator-VHDL.git
   ```
2. **Open Vivado**:
   - Launch **Vivado** and create a new project.
   - Select **Basys3 board** (Artix-7 FPGA, `xc7a35tcpg236-1`).
3. **Add Source Files**:
   - Import **VHDL files** from the repository into the project.
4. **Create Constraints File**:
   - Assign **FPGA pins** according to the provided **User Manual**.
5. **Synthesize and Implement**:
   - Run synthesis and generate the **bitstream**.
6. **Program the FPGA**:
   - Connect the **Basys3 board** and upload the generated bitstream.

## User Manual
### How to Use the Calculator
1. **Input Numbers**:
   - Use the **switches** to input two **8-bit numbers** in hexadecimal format.
2. **Select Operation**:
   - Choose an operation using selection switches:
     - **No selection**: Addition
     - **sel0**: Subtraction
     - **sel1**: Multiplication
     - **sel0 & sel1**: Division
3. **View Results**:
   - The **7-segment display** shows the computed result.
   - If the result is **negative**, the `semn_out` LED lights up.

## Technical Justifications
- **Signed Magnitude Representation**: Facilitates handling and displaying **negative numbers**.
- **Modular Design**: Enhances **debugging** and future **scalability**.
- **Efficient Algorithms**: Optimized **shifting and arithmetic-based multiplication and division**.

## Future Developments
- **Decimal Input**: Enable **button-based** decimal input instead of switches.
- **Larger Display**: Support **more digits** by using a larger FPGA board.
- **Memory Feature**: Store and recall **previous calculations**.
- **Erase Button**: Add an **erase function** for correcting inputs.
- **Complex Operations**: Implement **square roots and exponentiation**.

## Why This Project?
This project demonstrates **expertise in digital design, VHDL programming, and FPGA implementation**. It showcases the ability to design and develop a **functional hardware system**, including **modular design, control logic, and user interface development**. This is a strong addition to my portfolio for **hardware engineering and embedded systems roles**.

## License
This project is licensed under the **MIT License**. See the **LICENSE** file for details.



