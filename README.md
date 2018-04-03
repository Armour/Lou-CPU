# Multi-Clock CPU
#### Group: CO4618
#### Author: Bernard Yuan

Almost all the parts are transplanted from SingleClock CPU with modifications in the debugging process.
## System Specification:
* controller: used for providing all the control signals of the CPU.
* ALUnit and related accessories: used for several kinds of arithmatic operations, including add, sub, or, and, slt.
* regFile: the register files, consisting of 32 registers.
* PCregister: modified from the register module, as the timing reqirement of PC register is different from others.
* mux2x1 and mux4x1: used for data selections
* Note: still need one IPcore as the Memory cell, with following parameters:
  * Data width: 32
  * Data depth: 512 or larger
  * ENA signal required
  * init file: can be customized, the test.coe file provides one testing routine and the test.txt file is the explanation of it.

## Debug
1. The timing of Multi-Clock CPU. If one element uses the data read from one register at a positive edge, this element must do the write operation at the following negative edge to avoid writing errors.
2. To demonstrate it, we have to provide the clock pulse manually. Initially the clock pulses are given with a button, but the button is sometimes not stable as there are bounces, so in the .ucf file the clock is changed into one switch.

## Instructions implemented:
1. R-type:
  * add
  * sub
  * or
  * and
  * slt
2. I-type:
  * beq
  * lw
  * sw
3. J-type:
  * J

## Display part:
1. display32bits and display16bits: display the numbers with nodes and segments in Hexdecimal, mainly for debugging.
2. The VGA display is still in progress.

## Instructions to do:
1. R type
  xor
2. I type
  addi
  subi
  andi
  ori
  slti
  bne
3. J type
  Jal
