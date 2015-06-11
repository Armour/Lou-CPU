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
        input Rst,
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

    reg [31:0]iRegf[31:0];
    reg [31:0]oRegf[31:0];

    assign Adat = oRegf[regA];
    assign Bdat = oRegf[regB];
    assign Cdat = oRegf[regC];

    always @(Wdat) begin
        if (RegWrite) begin
            iRegf[regW] <= (regW == 5'b00000) ? 32'b0 : Wdat;
        end
    end

    integer i;
    always @(posedge btn) begin
        if (Rst) begin
            for (i=0; i<32; i=i+1) begin
                oRegf[i] <= i;
                iRegf[i] <= i;
            end
        end
        else begin
            oRegf[regA] <= iRegf[regA];
            oRegf[regB] <= iRegf[regB];
            oRegf[regC] <= iRegf[regC];
        end
    end

endmodule
