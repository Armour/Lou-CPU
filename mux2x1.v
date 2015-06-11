`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    14:31:16 05/27/2015
// Design Name:
// Module Name:    mux2x1
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
module mux2x1(
        input A,
        input B,
        input ctrl,
        output S
    );

    wire ta, tb;
    and(ta, A, ~ctrl);
    and(ta, B, ctrl);
    or(S, ta, tb);

endmodule
