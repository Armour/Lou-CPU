`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    14:58:38 05/27/2015
// Design Name:
// Module Name:    regFile
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
module regFile(
        input btn,
        input rst,
        input [4:0]regA,
        input [4:0]regB,
        input [4:0]regC,
        input [4:0]regW,
        input [31:0]Wdat,
        input RegWrite,
        output [31:0]Adat,
        output [31:0]Bdat,
        output [31:0]Cdat
    );

    reg [31:0]RegMem[31:0];

    assign Adat = RegMem[regA];
    assign Bdat = RegMem[regB];
    assign Cdat = RegMem[regC];

    always @(negedge btn or posedge rst) begin
		if (rst == 1'b1) begin
			RegMem[0] = {32{1'b0}};
			RegMem[1] = {32{1'b0}};
			RegMem[2] = {32{1'b0}};
			RegMem[3] = {32{1'b0}};
			RegMem[4] = {32{1'b0}};
			RegMem[5] = {32{1'b0}};
			RegMem[6] = {32{1'b0}};
			RegMem[7] = {32{1'b0}};
			RegMem[8] = {32{1'b0}};
			RegMem[9] = {32{1'b0}};
			RegMem[10] = {32{1'b0}};
			RegMem[11] = {32{1'b0}};
			RegMem[12] = {32{1'b0}};
			RegMem[13] = {32{1'b0}};
			RegMem[14] = {32{1'b0}};
			RegMem[15] = {32{1'b0}};
			RegMem[16] = {32{1'b0}};
			RegMem[17] = {32{1'b0}};
			RegMem[18] = {32{1'b0}};
			RegMem[19] = {32{1'b0}};
			RegMem[20] = {32{1'b0}};
			RegMem[21] = {32{1'b0}};
			RegMem[22] = {32{1'b0}};
			RegMem[23] = {32{1'b0}};
			RegMem[24] = {32{1'b0}};
			RegMem[25] = {32{1'b0}};
			RegMem[26] = {32{1'b0}};
			RegMem[27] = {32{1'b0}};
			RegMem[28] = {32{1'b0}};
			RegMem[29] = {32{1'b0}};
			RegMem[30] = {32{1'b0}};
			RegMem[31] = {32{1'b0}};
		end
		else if (RegWrite) 
			RegMem[regW]= (regW == {5{1'b0}})? {32{1'b0}}: Wdat;
    end

endmodule
