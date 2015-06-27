`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    14:44:34 06/10/2015
// Design Name:
// Module Name:    fullAdder
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
module fullAdder(
        input a,b,c,mode,
        output s, cf
    );

    wire xb, t1, t2, t3;
    xor(xb, b, mode);
    xor(s, a, xb, c);
    and(t1, a, xb),
        (t2, xb, c),
        (t3, a, c);
    or (cf, t1, t2, t3);

endmodule
