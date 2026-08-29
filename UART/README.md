# UART Transmitter using Verilog

## Overview

This project implements a simple **UART (Universal Asynchronous Receiver/Transmitter) Transmitter** in Verilog HDL. It sends 8-bit serial data using one start bit and one stop bit.

## Features

- 8-bit UART transmitter
- One start bit
- One stop bit
- Busy status signal
- GTKWave simulation support

## Inputs

| Signal | Description |
|--------|-------------|
| clk | System clock |
| reset | Reset signal |
| tx_start | Start transmission |
| data_in[7:0] | Data to transmit |

## Outputs

| Signal | Description |
|--------|-------------|
| tx | Serial transmit output |
| busy | Transmission in progress |

## UART Frame

```
Start Bit | Data[7:0] | Stop Bit
     0    | 8 Bits    |     1
```

## Project Files

- `uart_tx.v` – UART transmitter
- `uart_tx_tb.v` – Testbench
- `uart_tx.vcd` – Waveform file
- `simulation_result.png` – GTKWave screenshot

## Simulation

### Compile

```bash
iverilog -o uart uart_tx.v uart_tx_tb.v
```

### Run

```bash
vvp uart
```

### View Waveform

```bash
gtkwave uart_tx.vcd
```

## Applications

- FPGA serial communication
- Microcontroller interfaces
- Embedded systems
- RS-232 communication
- Debug consoles