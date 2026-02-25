# Serial-to-Ethernet Converter (Zynq-7000)

> **Bridging the Gap Between Legacy Serial Communication and Modern IP Networks.**

## Problem Statement

In the world of Embedded Systems and Industrial Automation, a significant challenge persists: **Platform Interoperability**.

Many critical legacy systems—industrial sensors, GPS modules, medical devices, and PLCs—communicate exclusively via **UART (RS-232/485)**. However, modern control centers, cloud dashboards, and data loggers operate almost entirely on **TCP/IP networks (Ethernet/Wi-Fi)**.

These two worlds are fundamentally incompatible:
*   **UART** is short-range, point-to-point, and non-routable.
*   **Ethernet** is long-range, packet-switched, and routable.

**The Challenge**: How do we enable a legacy UART device to "talk" to a remote server across a local network or the internet in real-time, without replacing the expensive legacy hardware?

---

##  The Solution: Adaptive SoC Gateway

This project implements a **High-Performance Serial-to-Ethernet Gateway** on the **Xilinx Zynq-7000 SoC**. By leveraging the Zynq's heterogeneous architecture (Dual-Core Cortex-A9 PS + FPGA PL), we create a robust, bare-metal application that transparently tunnels serial data over UDP.

### Key Capabilities
*   **Transparent Bridging**: Data received on UART is packetized and sent to a specific IP/Port via UDP.
*   **Bidirectional**: Data received via UDP is depacketized and transmitted out of the UART port.
*   **Low Latency**: Built on the **LwIP (Lightweight IP)** stack running bare-metal (No-OS) for deterministic performance.
*   **Health Monitoring**: Integrated **Heartbeat Mechanism** ensures the link status is constantly verified (1s intervals).

##  Tech Stack
*   **Platform**: Xilinx Zynq-7000 (Cortex-A9)
*   **Framework**: Xilinx Vitis / Standalone BSP
*   **Network Stack**: LwIP (Lightweight IP)
*   **Protocol**: UDP (User Datagram Protocol) for minimal overhead.
*   **Language**: Embedded C

##  How It Works
1.  **UART RX**: The Zynq Processor listens for bytes on the UART interface.
2.  **Packetization**: Incoming bytes are buffered until a delimiter (newline) or buffer limit is reached.
3.  **UDP TX**: The buffer is wrapped in a UDP packet and blasted to the listening server (PC/Cloud).
4.  **UDP RX**: The Zynq listens for incoming UDP packets from the server and immediately writes the payload to the UART TX register.

This architecture effectively turns any "dumb" serial device into a network-connected smart node.
