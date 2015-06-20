`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:
// Design Name:
// Module Name:    decode2x4
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

module Decode2x4(
      input [1:0] in,
      output[3:0] out
    );

    or r0(out[0], in[1], in[0]);
    or r1(out[1], in[1], ~in[0]);
    or r2(out[2], ~in[1], in[0]);
    or r3(out[3], ~in[1], ~in[0]);

endmodule
