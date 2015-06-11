`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    14:49:30 06/10/2015
// Design Name:
// Module Name:    adder4
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
module adder4(
        input[3:0] A,B,
        input Cin, mode,
        output[3:0] S,
        output CF, OF
    );

    /*
    * wire t1, t2, t3;
    * fullAdder fa0(A[0], B[0], Cin, mode, S[0], t1);
    * fullAdder fa1(A[1], B[1], t1, mode, S[1], t2);
    * fullAdder fa2(A[2], B[2], t2, mode, S[2], t3);
    * fullAdder fa3(A[3], B[3], t3, mode, S[3], CF);
    * xor(OF, t3, CF);
    */

    wire[3:0] xb, p, g;

    xor(xb[0], B[0], mode); // xbi = bi xor mode
    xor(xb[1], B[1], mode);
    xor(xb[2], B[2], mode);
    xor(xb[3], B[3], mode);

    and(g[0], A[0], xb[0]);    // gi = ai and xbi
    and(g[1], A[1], xb[1]);
    and(g[2], A[2], xb[2]);
    and(g[3], A[3], xb[3]);

    or(p[0], A[0], xb[0]); // pi = ai or xbi
    or(p[1], A[1], xb[1]);
    or(p[2], A[2], xb[2]);
    or(p[3], A[3], xb[3]);

    xor(S[0], A[0], xb[0], Cin); // c0 = Cin

    wire u1, u2;
    and(u1, p[0], Cin);
    or(u2, g[0], u1);
    xor(S[1], A[1], xb[1], u2); // c1 = g0 + p0c0

    wire v1, v2, v3;
    and(v1, p[1], g[0]);
    and(v2, p[1], p[0], Cin);
    or(v3, g[1], v1, v2);
    xor(S[2], A[2], xb[2], v3); // c2 = g1 + p1c0 + p1p0c0

    wire w1, w2, w3, w4;
    and(w1, p[2], g[1]);
    and(w2, p[2], p[1], g[0]);
    and(w3, p[2], p[1], p[0], Cin);
    or(w4, g[2], w1, w2, w3);
    xor(S[3], A[3], xb[3], w4); // c3 = g2 + p2g1 + p2p1g0 + p2p1p0c0

    wire x1, x2, x3, x4;
    and(x1, p[3], g[2]);
    and(x2, p[3], p[2], g[1]);
    and(x3, p[3], p[2], p[1], g[0]);
    and(x4, p[3], p[2], p[1], p[0], Cin);
    or(CF, g[3], x1, x2, x3, x4);    // c4 = g3g2 + p2p2g1 + p3p2g1 + p3p2p1p0c0

    xor(Of, w4, CF);

endmodule
