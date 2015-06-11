`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    14:35:47 05/27/2015
// Design Name:
// Module Name:    shift
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
module shift(
        input  [31:0]in,
        output [31:0]out
    );

    assign out = {in[29:0], 2b'0};

endmodule
