`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:
// Design Name:
// Module Name:    decode3x8
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
module Decode3x8(
      input [2:0] in,
      output[7:0] out
    );

    or r0(out[0],~in[2],~in[1],~in[0]);
    or r1(out[1],~in[2],~in[1], in[0]);
    or r2(out[2],~in[2], in[1],~in[0]);
    or r3(out[3],~in[2], in[1], in[0]);
    or r4(out[4], in[2],~in[1],~in[0]);
    or r5(out[5], in[2],~in[1], in[0]);
    or r6(out[6], in[2], in[1],~in[0]);
    or r7(out[7], in[2], in[1], in[0]);

endmodule
