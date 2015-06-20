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
module mux2x1(A, B, Ctrl, S);
    parameter N=32;
    input wire [N-1:0] A, B;
    input wire Ctrl;
    output wire [N-1:0] S;

    assign S = Ctrl? B : A;

endmodule
