`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:
// Design Name:
// Module Name:    pbdebonce
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
module pbdebounce(
        input wire clk,
        input wire button,
        output reg button_out
    );

    reg [7:0] pbshift;
    wire clk_1ms;

    timer_1ms m0(clk, clk_1ms);

    always@(posedge clk_1ms)
    begin
        pbshift=pbshift<<1;//左移1位
        pbshift[0]=button;
        if (pbshift==0)
            button_out=0;
        if (pbshift==8'hFF)// pbshift八位全为1
            button_out=1;
    end

endmodule

