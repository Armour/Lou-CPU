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
module mux4_1(
        input [31:0]A,
        input [31:0]B,
        input [31:0]C,
        input [31:0]D,
          input [1:0] ctrl,
          output [31:0] S
    );

    wire [31:0]ta, tb, tc, td;
    wire [31:0] en0, en1;

    assign en0 = {32{ctrl[0]}};
    assign en1 = {32{ctrl[1]}};

    and a0_gate[31:0](ta, A, ~en1, ~en0);
    and a1_gate[31:0](tb, B, ~en1, en0);
    and a2_gate[31:0](tc, C, en1, ~en0);
    and a3_gate[31:0](td, D, en1, en0);

    or o_gate[31:0](S, ta, tb, tc, td);

endmodule
