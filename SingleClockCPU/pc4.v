`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:
// Design Name:
// Module Name:    pc4
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
module pc4(i_pc, o_pc);
    parameter N = 9;
    input  wire[N-1:0] i_pc;
    output wire[N-1:0] o_pc;

    assign o_pc = i_pc + 1;

endmodule

