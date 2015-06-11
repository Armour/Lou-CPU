`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    14:39:51 05/27/2015
// Design Name:
// Module Name:    extend
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
module extend(
        input [15:0]in,
        output [31:0]out
    );

    assign out = {16{in[15]}, in[15:0]};

endmodule
