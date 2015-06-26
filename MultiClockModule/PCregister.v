`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:13:58 06/24/2015 
// Design Name: 
// Module Name:    PCregister 
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
module PCregister(
        input clk,
        input RegWrite,
        input [31:0]idat,
        output reg[31:0]odat
    );
    reg[31:0] kdat;

    always @(negedge clk) begin
        if (RegWrite) kdat <= idat;
    end

    always @(posedge clk) begin
		odat = kdat;
    end


endmodule
