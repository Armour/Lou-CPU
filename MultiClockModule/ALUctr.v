`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    15:38:30 06/10/2015
// Design Name:
// Module Name:    ALUctr
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
module ALUctr(
        input[1:0] ALUop,
        input[5:0] Func,
        output[2:0] ALUoper
    );

    wire t1;
    and (t1, Func[1], ALUop[1]);
    or (ALUoper[2], t1, ALUop[0]);
    or (ALUoper[1], ~Func[2], ~ALUop[1]);
    and (ALUoper[0], Func[0], ALUop[1]);
endmodule
