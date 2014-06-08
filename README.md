Zedboard Bitcoin Miner
==========================

Implementation of a Bitcoin miner for Zedboard.

/VHDL: Hardware description of the miner to be programmed on the Programmable
Logic (PL) side of the Zynq device, including cryptographic functions.

/Embedded C: Software to run on one of the ARM cores of the Zynq device
for controlling the mining process and for communicating to the PC
using the USB Serial interface.

/Python: Script to run on the PC for acquiring data necessary for mining from
the Bitcoin network.

HOW IT WORKS:
The Python script running on a PC connects to the Bitcoin server and executes 
the Getwork function. Data is swapped accordingly and sent to the Zynq via 
USB serial. The embedded software running on the ARM core receives and 
allocates the data on the registers of the PL side and starts the mining process. 
The miner module on the PL side executes the mining procedure and returns the 
winning nonce in case of finding one, otherwise it returns a fail message. The LEDs
on the Zedboard are programmed to show status data such as mining in progress, 
win or fail.