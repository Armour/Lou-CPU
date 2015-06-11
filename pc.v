`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:
// Design Name:
// Module Name:    pc
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

module pc(btn, rst, i_pc, o_pc);
    input wire btn, rst;
    input wire[N-1:0] i_pc;
    output wire[N-1:0] o_pc;

    parameter N = 9;
    reg[N-1:0] t_pc;
    assign o_pc = rst ? {N{1'b1}}: t_pc;
    always @(posedge btn) begin
        t_pc <= i_pc;
    end

endmodule

