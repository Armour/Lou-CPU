`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    15:14:12 06/10/2015
// Design Name:
// Module Name:    adder32
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
module adder32(
        input[31:0] A, B,
        input Cin, mode,
        output[31:0] S,
        output CF, OF
    );

    wire t1, t2, t3, t4, t5, t6, t7;
    adder4 add1(A[3:0], B[3:0], Cin, mode, S[3:0], t1, w1);
    adder4 add2(A[7:4], B[7:4], t1, mode, S[7:4], t2, w2);
    adder4 add3(A[11:8], B[11:8], t2, mode, S[11:8], t3, w3);
    adder4 add4(A[15:12], B[15:12], t3, mode, S[15:12], t4, w4);
    adder4 add5(A[19:16], B[19:16], t4, mode, S[19:16], t5, w5);
    adder4 add6(A[23:20], B[23:20], t5, mode, S[23:20], t6, w6);
    adder4 add7(A[27:24], B[27:24], t6, mode, S[27:24], t7, w7);
    adder4 add8(A[31:28], B[31:28], t7, mode, S[31:28], CF, OF);

endmodule
