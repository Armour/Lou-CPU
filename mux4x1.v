`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:
// Design Name:
// Module Name:    mux4x1
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

module mux4x1(A, B, C, D, Ctrl, S);
    parameter N=32;
    input  wire [1:0] Ctrl;
    input  wire [N-1:0] A, B, C, D;
    output wire [N-1:0] S;

    wire [31:0]ta, tb, tc, td;

    and (ta, A, {32{~ctrl[1]}}, {32{~ctrl[0]}}),
         (tb, B, {32{~ctrl[1]}}, {32{ctrl[0]}}),
         (tc, C, {32{ctrl[1]}}, {32{~ctrl[0]}}),
         (td, D, {32{ctrl[1]}}, {32{ctrl[0]}});

    or (S, ta, tb, tc, td);

endmodule
