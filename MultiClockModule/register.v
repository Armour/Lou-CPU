`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    14:52:56 05/27/2015
// Design Name:
// Module Name:    register
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
module register(
        input clk,
        input RegWrite,
        input [31:0]idat,
        output reg[31:0]odat
    );

    reg[31:0] kdat;

    always @(posedge clk) begin
        if (RegWrite) kdat <= idat;
    end

    always @(posedge clk) begin
        odat <= kdat;
    end

endmodule
