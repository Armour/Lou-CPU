`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:
// Design Name:
// Module Name:    ALUnit
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

module ALUnit(Adat, Bdat, ALUoper, Result, zero, carryout, overflow);
    input [31:0] Adat;
    input [31:0] Bdat;
    output [31:0] Result;

    input [3:0] ALUoper;
    output zero, carryout, overflow;

    wire slt, caryt, overf;
    wire[31:0] andt, orxt, addsub, xort; //与、或、加减结��
    and32 an1(andt, Adat, Bdat); //AND
    or32 or1(orxt, Adat, Bdat); //OR
    xor32 xor0(xort,Adat,Bdat);
    adder32 add32(Adat, Bdat, ALUoper[2], ALUoper[2], addsub, caryt, overf); //Add/Sub
    xor(cyt, caryt, ALUoper[2]); //SUB
    xor(slt, overf, addsub[31]); //SLT

    mux8x1 mx8(andt, orxt, addsub, {31'h0,slt}, {ALUoper[3],ALUoper[1],ALUoper[0]}, xort, 32'h0, 32'h0, 32'h0, Result);

    and(carryout, ALUoper[1], ~ALUoper[0], cyt); //carryout
    and(overflow, ALUoper[1], ~ALUoper[0], overf); //overflow
    nor(zero, Result[0], Result[ 1], Result[ 2], Result[ 3],
              Result[ 4], Result[ 5], Result[ 6], Result[ 7],
              Result[ 8], Result[ 9], Result[10], Result[11],
              Result[12], Result[13], Result[14], Result[15],
              Result[16], Result[17], Result[18], Result[19],
              Result[20], Result[21], Result[22], Result[23],
              Result[24], Result[25], Result[26], Result[27],
              Result[28], Result[29], Result[30], Result[31]);

endmodule
