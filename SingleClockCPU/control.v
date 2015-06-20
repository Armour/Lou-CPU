`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:
// Design Name:
// Module Name:    control
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module control(OP, ALUop, RegDst, RegWrite, Branch, Jump, MemtoReg, MemRead, MemWrite, ALUsrc, rst);
    input  wire      rst;
    input  wire[5:0] OP;
    output wire[1:0] ALUop;
    output wire RegDst, RegWrite, ALUsrc, Branch, Jump;
    output wire MemtoReg, MemRead, MemWrite;
    wire R, LW, SW, BEQ;

    assign R  = ~OP[0]&~OP[1]&~OP[2]&~OP[3]&~OP[4]&~OP[5];
    assign LW =  OP[0]& OP[1]&~OP[2]&~OP[3]&~OP[4]& OP[5];
    assign SW =  OP[0]& OP[1]&~OP[2]& OP[3]&~OP[4]& OP[5];
    assign BEQ= ~OP[0]&~OP[1]& OP[2]&~OP[3]&~OP[4]&~OP[5];
    assign J  = ~OP[0]& OP[1]&~OP[2]&~OP[3]&~OP[4]&~OP[5];

    assign ALUop[0] = ~rst & BEQ;
    assign ALUop[1] = ~rst & R;
    assign RegDst   = ~rst & R;//R-Type instruction: rd is the destination register
    assign RegWrite = ~rst & (R | LW);//when meet R or LW instructions, reg enables write-operation
    assign Branch   = ~rst & BEQ;
    assign ALUsrc   = ~rst & (SW | LW);//the second ALU operand from reg output or inst[15:0]?
    assign Jump     = ~rst & J;//when op=000010, jump
    assign MemtoReg = ~rst & LW;//decide whether the result of ALU or read data from memory written back to the reg
    assign MemRead  = ~rst & LW;
    assign MemWrite = ~rst & SW;

endmodule

