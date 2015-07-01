`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:
// Design Name:
// Module Name:    mux8x1
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

module mux8x1(
        input [31:0]A,
        input [31:0]B,
        input [31:0]C,
        input [31:0]D,
        input [31:0]E,
        input [31:0]F,
        input [31:0]G,
        input [31:0]H,
        input [2:0]ctrl,
        output [31:0]S
    );

    wire [31:0]ta, tb, tc, td,te,tf,tg,th;

    and(ta[0], A[0], ~ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(ta[1], A[1], ~ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(ta[2], A[2], ~ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(ta[3], A[3], ~ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(ta[4], A[4], ~ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(ta[5], A[5], ~ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(ta[6], A[6], ~ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(ta[7], A[7], ~ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(ta[8], A[8], ~ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(ta[9], A[9], ~ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(ta[10], A[10], ~ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(ta[11], A[11], ~ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(ta[12], A[12], ~ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(ta[13], A[13], ~ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(ta[14], A[14], ~ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(ta[15], A[15], ~ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(ta[16], A[16], ~ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(ta[17], A[17], ~ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(ta[18], A[18], ~ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(ta[19], A[19], ~ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(ta[20], A[20], ~ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(ta[21], A[21], ~ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(ta[22], A[22], ~ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(ta[23], A[23], ~ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(ta[24], A[24], ~ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(ta[25], A[25], ~ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(ta[26], A[26], ~ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(ta[27], A[27], ~ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(ta[28], A[28], ~ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(ta[29], A[29], ~ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(ta[30], A[30], ~ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(ta[31], A[31], ~ctrl[0], ~ctrl[1], ~ctrl[2]);

    and(tb[0], B[0], ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(tb[1], B[1], ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(tb[2], B[2], ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(tb[3], B[3], ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(tb[4], B[4], ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(tb[5], B[5], ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(tb[6], B[6], ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(tb[7], B[7], ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(tb[8], B[8], ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(tb[9], B[9], ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(tb[10], B[10], ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(tb[11], B[11], ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(tb[12], B[12], ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(tb[13], B[13], ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(tb[14], B[14], ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(tb[15], B[15], ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(tb[16], B[16], ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(tb[17], B[17], ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(tb[18], B[18], ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(tb[19], B[19], ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(tb[20], B[20], ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(tb[21], B[21], ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(tb[22], B[22], ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(tb[23], B[23], ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(tb[24], B[24], ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(tb[25], B[25], ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(tb[26], B[26], ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(tb[27], B[27], ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(tb[28], B[28], ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(tb[29], B[29], ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(tb[30], B[30], ctrl[0], ~ctrl[1], ~ctrl[2]);
    and(tb[31], B[31], ctrl[0], ~ctrl[1], ~ctrl[2]);

    and(tc[0], C[0], ~ctrl[0], ctrl[1], ~ctrl[2]);
    and(tc[1], C[1], ~ctrl[0], ctrl[1], ~ctrl[2]);
    and(tc[2], C[2], ~ctrl[0], ctrl[1], ~ctrl[2]);
    and(tc[3], C[3], ~ctrl[0], ctrl[1], ~ctrl[2]);
    and(tc[4], C[4], ~ctrl[0], ctrl[1], ~ctrl[2]);
    and(tc[5], C[5], ~ctrl[0], ctrl[1], ~ctrl[2]);
    and(tc[6], C[6], ~ctrl[0], ctrl[1], ~ctrl[2]);
    and(tc[7], C[7], ~ctrl[0], ctrl[1], ~ctrl[2]);
    and(tc[8], C[8], ~ctrl[0], ctrl[1], ~ctrl[2]);
    and(tc[9], C[9], ~ctrl[0], ctrl[1], ~ctrl[2]);
    and(tc[10], C[10], ~ctrl[0], ctrl[1], ~ctrl[2]);
    and(tc[11], C[11], ~ctrl[0], ctrl[1], ~ctrl[2]);
    and(tc[12], C[12], ~ctrl[0], ctrl[1], ~ctrl[2]);
    and(tc[13], C[13], ~ctrl[0], ctrl[1], ~ctrl[2]);
    and(tc[14], C[14], ~ctrl[0], ctrl[1], ~ctrl[2]);
    and(tc[15], C[15], ~ctrl[0], ctrl[1], ~ctrl[2]);
    and(tc[16], C[16], ~ctrl[0], ctrl[1], ~ctrl[2]);
    and(tc[17], C[17], ~ctrl[0], ctrl[1], ~ctrl[2]);
    and(tc[18], C[18], ~ctrl[0], ctrl[1], ~ctrl[2]);
    and(tc[19], C[19], ~ctrl[0], ctrl[1], ~ctrl[2]);
    and(tc[20], C[20], ~ctrl[0], ctrl[1], ~ctrl[2]);
    and(tc[21], C[21], ~ctrl[0], ctrl[1], ~ctrl[2]);
    and(tc[22], C[22], ~ctrl[0], ctrl[1], ~ctrl[2]);
    and(tc[23], C[23], ~ctrl[0], ctrl[1], ~ctrl[2]);
    and(tc[24], C[24], ~ctrl[0], ctrl[1], ~ctrl[2]);
    and(tc[25], C[25], ~ctrl[0], ctrl[1], ~ctrl[2]);
    and(tc[26], C[26], ~ctrl[0], ctrl[1], ~ctrl[2]);
    and(tc[27], C[27], ~ctrl[0], ctrl[1], ~ctrl[2]);
    and(tc[28], C[28], ~ctrl[0], ctrl[1], ~ctrl[2]);
    and(tc[29], C[29], ~ctrl[0], ctrl[1], ~ctrl[2]);
    and(tc[30], C[30], ~ctrl[0], ctrl[1], ~ctrl[2]);
    and(tc[31], C[31], ~ctrl[0], ctrl[1], ~ctrl[2]);

    and(td[0], D[0], ctrl[0], ctrl[1], ~ctrl[2]);
    and(td[1], D[1], ctrl[0], ctrl[1], ~ctrl[2]);
    and(td[2], D[2], ctrl[0], ctrl[1], ~ctrl[2]);
    and(td[3], D[3], ctrl[0], ctrl[1], ~ctrl[2]);
    and(td[4], D[4], ctrl[0], ctrl[1], ~ctrl[2]);
    and(td[5], D[5], ctrl[0], ctrl[1], ~ctrl[2]);
    and(td[6], D[6], ctrl[0], ctrl[1], ~ctrl[2]);
    and(td[7], D[7], ctrl[0], ctrl[1], ~ctrl[2]);
    and(td[8], D[8], ctrl[0], ctrl[1], ~ctrl[2]);
    and(td[9], D[9], ctrl[0], ctrl[1], ~ctrl[2]);
    and(td[10], D[10], ctrl[0], ctrl[1], ~ctrl[2]);
    and(td[11], D[11], ctrl[0], ctrl[1], ~ctrl[2]);
    and(td[12], D[12], ctrl[0], ctrl[1], ~ctrl[2]);
    and(td[13], D[13], ctrl[0], ctrl[1], ~ctrl[2]);
    and(td[14], D[14], ctrl[0], ctrl[1], ~ctrl[2]);
    and(td[15], D[15], ctrl[0], ctrl[1], ~ctrl[2]);
    and(td[16], D[16], ctrl[0], ctrl[1], ~ctrl[2]);
    and(td[17], D[17], ctrl[0], ctrl[1], ~ctrl[2]);
    and(td[18], D[18], ctrl[0], ctrl[1], ~ctrl[2]);
    and(td[19], D[19], ctrl[0], ctrl[1], ~ctrl[2]);
    and(td[20], D[20], ctrl[0], ctrl[1], ~ctrl[2]);
    and(td[21], D[21], ctrl[0], ctrl[1], ~ctrl[2]);
    and(td[22], D[22], ctrl[0], ctrl[1], ~ctrl[2]);
    and(td[23], D[23], ctrl[0], ctrl[1], ~ctrl[2]);
    and(td[24], D[24], ctrl[0], ctrl[1], ~ctrl[2]);
    and(td[25], D[25], ctrl[0], ctrl[1], ~ctrl[2]);
    and(td[26], D[26], ctrl[0], ctrl[1], ~ctrl[2]);
    and(td[27], D[27], ctrl[0], ctrl[1], ~ctrl[2]);
    and(td[28], D[28], ctrl[0], ctrl[1], ~ctrl[2]);
    and(td[29], D[29], ctrl[0], ctrl[1], ~ctrl[2]);
    and(td[30], D[30], ctrl[0], ctrl[1], ~ctrl[2]);
    and(td[31], D[31], ctrl[0], ctrl[1], ~ctrl[2]);

    and(te[0], A[0], ~ctrl[0], ~ctrl[1], ctrl[2]);
    and(te[1], E[1], ~ctrl[0], ~ctrl[1], ctrl[2]);
    and(te[2], E[2], ~ctrl[0], ~ctrl[1], ctrl[2]);
    and(te[3], E[3], ~ctrl[0], ~ctrl[1], ctrl[2]);
    and(te[4], E[4], ~ctrl[0], ~ctrl[1], ctrl[2]);
    and(te[5], E[5], ~ctrl[0], ~ctrl[1], ctrl[2]);
    and(te[6], E[6], ~ctrl[0], ~ctrl[1], ctrl[2]);
    and(te[7], E[7], ~ctrl[0], ~ctrl[1], ctrl[2]);
    and(te[8], E[8], ~ctrl[0], ~ctrl[1], ctrl[2]);
    and(te[9], E[9], ~ctrl[0], ~ctrl[1], ctrl[2]);
    and(te[10], E[10], ~ctrl[0], ~ctrl[1], ctrl[2]);
    and(te[11], E[11], ~ctrl[0], ~ctrl[1], ctrl[2]);
    and(te[12], E[12], ~ctrl[0], ~ctrl[1], ctrl[2]);
    and(te[13], E[13], ~ctrl[0], ~ctrl[1], ctrl[2]);
    and(te[14], E[14], ~ctrl[0], ~ctrl[1], ctrl[2]);
    and(te[15], E[15], ~ctrl[0], ~ctrl[1], ctrl[2]);
    and(te[16], E[16], ~ctrl[0], ~ctrl[1], ctrl[2]);
    and(te[17], E[17], ~ctrl[0], ~ctrl[1], ctrl[2]);
    and(te[18], E[18], ~ctrl[0], ~ctrl[1], ctrl[2]);
    and(te[19], E[19], ~ctrl[0], ~ctrl[1], ctrl[2]);
    and(te[20], E[20], ~ctrl[0], ~ctrl[1], ctrl[2]);
    and(te[21], E[21], ~ctrl[0], ~ctrl[1], ctrl[2]);
    and(te[22], E[22], ~ctrl[0], ~ctrl[1], ctrl[2]);
    and(te[23], E[23], ~ctrl[0], ~ctrl[1], ctrl[2]);
    and(te[24], E[24], ~ctrl[0], ~ctrl[1], ctrl[2]);
    and(te[25], E[25], ~ctrl[0], ~ctrl[1], ctrl[2]);
    and(te[26], E[26], ~ctrl[0], ~ctrl[1], ctrl[2]);
    and(te[27], E[27], ~ctrl[0], ~ctrl[1], ctrl[2]);
    and(te[28], E[28], ~ctrl[0], ~ctrl[1], ctrl[2]);
    and(te[29], E[29], ~ctrl[0], ~ctrl[1], ctrl[2]);
    and(te[30], E[30], ~ctrl[0], ~ctrl[1], ctrl[2]);
    and(te[31], E[31], ~ctrl[0], ~ctrl[1], ctrl[2]);

    and(tf[0], F[0], ctrl[0], ~ctrl[1], ctrl[2]);
    and(tf[1], F[1], ctrl[0], ~ctrl[1], ctrl[2]);
    and(tf[2], F[2], ctrl[0], ~ctrl[1], ctrl[2]);
    and(tf[3], F[3], ctrl[0], ~ctrl[1], ctrl[2]);
    and(tf[4], F[4], ctrl[0], ~ctrl[1], ctrl[2]);
    and(tf[5], F[5], ctrl[0], ~ctrl[1], ctrl[2]);
    and(tf[6], F[6], ctrl[0], ~ctrl[1], ctrl[2]);
    and(tf[7], F[7], ctrl[0], ~ctrl[1], ctrl[2]);
    and(tf[8], F[8], ctrl[0], ~ctrl[1], ctrl[2]);
    and(tf[9], F[9], ctrl[0], ~ctrl[1], ctrl[2]);
    and(tf[10], F[10], ctrl[0], ~ctrl[1], ctrl[2]);
    and(tf[11], F[11], ctrl[0], ~ctrl[1], ctrl[2]);
    and(tf[12], F[12], ctrl[0], ~ctrl[1], ctrl[2]);
    and(tf[13], F[13], ctrl[0], ~ctrl[1], ctrl[2]);
    and(tf[14], F[14], ctrl[0], ~ctrl[1], ctrl[2]);
    and(tf[15], F[15], ctrl[0], ~ctrl[1], ctrl[2]);
    and(tf[16], F[16], ctrl[0], ~ctrl[1], ctrl[2]);
    and(tf[17], F[17], ctrl[0], ~ctrl[1], ctrl[2]);
    and(tf[18], F[18], ctrl[0], ~ctrl[1], ctrl[2]);
    and(tf[19], F[19], ctrl[0], ~ctrl[1], ctrl[2]);
    and(tf[20], F[20], ctrl[0], ~ctrl[1], ctrl[2]);
    and(tf[21], F[21], ctrl[0], ~ctrl[1], ctrl[2]);
    and(tf[22], F[22], ctrl[0], ~ctrl[1], ctrl[2]);
    and(tf[23], F[23], ctrl[0], ~ctrl[1], ctrl[2]);
    and(tf[24], F[24], ctrl[0], ~ctrl[1], ctrl[2]);
    and(tf[25], F[25], ctrl[0], ~ctrl[1], ctrl[2]);
    and(tf[26], F[26], ctrl[0], ~ctrl[1], ctrl[2]);
    and(tf[27], F[27], ctrl[0], ~ctrl[1], ctrl[2]);
    and(tf[28], F[28], ctrl[0], ~ctrl[1], ctrl[2]);
    and(tf[29], F[29], ctrl[0], ~ctrl[1], ctrl[2]);
    and(tf[30], F[30], ctrl[0], ~ctrl[1], ctrl[2]);
    and(tf[31], F[31], ctrl[0], ~ctrl[1], ctrl[2]);

    and(tg[0], G[0], ~ctrl[0], ctrl[1], ctrl[2]);
    and(tg[1], G[1], ~ctrl[0], ctrl[1], ctrl[2]);
    and(tg[2], G[2], ~ctrl[0], ctrl[1], ctrl[2]);
    and(tg[3], G[3], ~ctrl[0], ctrl[1], ctrl[2]);
    and(tg[4], G[4], ~ctrl[0], ctrl[1], ctrl[2]);
    and(tg[5], G[5], ~ctrl[0], ctrl[1], ctrl[2]);
    and(tg[6], G[6], ~ctrl[0], ctrl[1], ctrl[2]);
    and(tg[7], G[7], ~ctrl[0], ctrl[1], ctrl[2]);
    and(tg[8], G[8], ~ctrl[0], ctrl[1], ctrl[2]);
    and(tg[9], G[9], ~ctrl[0], ctrl[1], ctrl[2]);
    and(tg[10], G[10], ~ctrl[0], ctrl[1], ctrl[2]);
    and(tg[11], G[11], ~ctrl[0], ctrl[1], ctrl[2]);
    and(tg[12], G[12], ~ctrl[0], ctrl[1], ctrl[2]);
    and(tg[13], G[13], ~ctrl[0], ctrl[1], ctrl[2]);
    and(tg[14], G[14], ~ctrl[0], ctrl[1], ctrl[2]);
    and(tg[15], G[15], ~ctrl[0], ctrl[1], ctrl[2]);
    and(tg[16], G[16], ~ctrl[0], ctrl[1], ctrl[2]);
    and(tg[17], G[17], ~ctrl[0], ctrl[1], ctrl[2]);
    and(tg[18], G[18], ~ctrl[0], ctrl[1], ctrl[2]);
    and(tg[19], G[19], ~ctrl[0], ctrl[1], ctrl[2]);
    and(tg[20], G[20], ~ctrl[0], ctrl[1], ctrl[2]);
    and(tg[21], G[21], ~ctrl[0], ctrl[1], ctrl[2]);
    and(tg[22], G[22], ~ctrl[0], ctrl[1], ctrl[2]);
    and(tg[23], G[23], ~ctrl[0], ctrl[1], ctrl[2]);
    and(tg[24], G[24], ~ctrl[0], ctrl[1], ctrl[2]);
    and(tg[25], G[25], ~ctrl[0], ctrl[1], ctrl[2]);
    and(tg[26], G[26], ~ctrl[0], ctrl[1], ctrl[2]);
    and(tg[27], G[27], ~ctrl[0], ctrl[1], ctrl[2]);
    and(tg[28], G[28], ~ctrl[0], ctrl[1], ctrl[2]);
    and(tg[29], G[29], ~ctrl[0], ctrl[1], ctrl[2]);
    and(tg[30], G[30], ~ctrl[0], ctrl[1], ctrl[2]);
    and(tg[31], G[31], ~ctrl[0], ctrl[1], ctrl[2]);

    and(th[0], H[0], ctrl[0], ctrl[1], ctrl[2]);
    and(th[1], H[1], ctrl[0], ctrl[1], ctrl[2]);
    and(th[2], H[2], ctrl[0], ctrl[1], ctrl[2]);
    and(th[3], H[3], ctrl[0], ctrl[1], ctrl[2]);
    and(th[4], H[4], ctrl[0], ctrl[1], ctrl[2]);
    and(th[5], H[5], ctrl[0], ctrl[1], ctrl[2]);
    and(th[6], H[6], ctrl[0], ctrl[1], ctrl[2]);
    and(th[7], H[7], ctrl[0], ctrl[1], ctrl[2]);
    and(th[8], H[8], ctrl[0], ctrl[1], ctrl[2]);
    and(th[9], H[9], ctrl[0], ctrl[1], ctrl[2]);
    and(th[10], H[10], ctrl[0], ctrl[1], ctrl[2]);
    and(th[11], H[11], ctrl[0], ctrl[1], ctrl[2]);
    and(th[12], H[12], ctrl[0], ctrl[1], ctrl[2]);
    and(th[13], H[13], ctrl[0], ctrl[1], ctrl[2]);
    and(th[14], H[14], ctrl[0], ctrl[1], ctrl[2]);
    and(th[15], H[15], ctrl[0], ctrl[1], ctrl[2]);
    and(th[16], H[16], ctrl[0], ctrl[1], ctrl[2]);
    and(th[17], H[17], ctrl[0], ctrl[1], ctrl[2]);
    and(th[18], H[18], ctrl[0], ctrl[1], ctrl[2]);
    and(th[19], H[19], ctrl[0], ctrl[1], ctrl[2]);
    and(th[20], H[20], ctrl[0], ctrl[1], ctrl[2]);
    and(th[21], H[21], ctrl[0], ctrl[1], ctrl[2]);
    and(th[22], H[22], ctrl[0], ctrl[1], ctrl[2]);
    and(th[23], H[23], ctrl[0], ctrl[1], ctrl[2]);
    and(th[24], H[24], ctrl[0], ctrl[1], ctrl[2]);
    and(th[25], H[25], ctrl[0], ctrl[1], ctrl[2]);
    and(th[26], H[26], ctrl[0], ctrl[1], ctrl[2]);
    and(th[27], H[27], ctrl[0], ctrl[1], ctrl[2]);
    and(th[28], H[28], ctrl[0], ctrl[1], ctrl[2]);
    and(th[29], H[29], ctrl[0], ctrl[1], ctrl[2]);
    and(th[30], H[30], ctrl[0], ctrl[1], ctrl[2]);
    and(th[31], H[31], ctrl[0], ctrl[1], ctrl[2]);

    or(S[0], ta[0], tb[0], tc[0], td[0], te[0], tf[0], tg[0], th[0]);
    or(S[1], ta[1], tb[1], tc[1], td[1], te[1], tf[1], tg[1], th[1]);
    or(S[2], ta[2], tb[2], tc[2], td[2], te[2], tf[2], tg[2], th[2]);
    or(S[3], ta[3], tb[3], tc[3], td[3], te[3], tf[3], tg[3], th[3]);
    or(S[4], ta[4], tb[4], tc[4], td[4], te[4], tf[4], tg[4], th[4]);
    or(S[5], ta[5], tb[5], tc[5], td[5], te[5], tf[5], tg[5], th[5]);
    or(S[6], ta[6], tb[6], tc[6], td[6], te[6], tf[6], tg[6], th[6]);
    or(S[7], ta[7], tb[7], tc[7], td[7], te[7], tf[7], tg[7], th[7]);
    or(S[8], ta[8], tb[8], tc[8], td[8], te[8], tf[8], tg[8], th[8]);
    or(S[9], ta[9], tb[9], tc[9], td[9], te[9], tf[9], tg[9], th[9]);
    or(S[10], ta[10], tb[10], tc[10], td[10], te[10], tf[10], tg[10], th[10]);
    or(S[11], ta[11], tb[11], tc[11], td[11], te[11], tf[11], tg[11], th[11]);
    or(S[12], ta[12], tb[12], tc[12], td[12], te[12], tf[12], tg[12], th[12]);
    or(S[13], ta[13], tb[13], tc[13], td[13], te[13], tf[13], tg[13], th[13]);
    or(S[14], ta[14], tb[14], tc[14], td[14], te[14], tf[14], tg[14], th[14]);
    or(S[15], ta[15], tb[15], tc[15], td[15], te[15], tf[15], tg[15], th[15]);
    or(S[16], ta[16], tb[16], tc[16], td[16], te[16], tf[16], tg[16], th[16]);
    or(S[17], ta[17], tb[17], tc[17], td[17], te[17], tf[17], tg[17], th[17]);
    or(S[18], ta[18], tb[18], tc[18], td[18], te[18], tf[18], tg[18], th[18]);
    or(S[19], ta[19], tb[19], tc[19], td[19], te[19], tf[19], tg[19], th[19]);
    or(S[20], ta[20], tb[20], tc[20], td[20], te[20], tf[20], tg[20], th[20]);
    or(S[21], ta[21], tb[21], tc[21], td[21], te[21], tf[21], tg[21], th[21]);
    or(S[22], ta[22], tb[22], tc[22], td[22], te[22], tf[22], tg[22], th[22]);
    or(S[23], ta[23], tb[23], tc[23], td[23], te[23], tf[23], tg[23], th[23]);
    or(S[24], ta[24], tb[24], tc[24], td[24], te[24], tf[24], tg[24], th[24]);
    or(S[25], ta[25], tb[25], tc[25], td[25], te[25], tf[25], tg[25], th[25]);
    or(S[26], ta[26], tb[26], tc[26], td[26], te[26], tf[26], tg[26], th[26]);
    or(S[27], ta[27], tb[27], tc[27], td[27], te[27], tf[27], tg[27], th[27]);
    or(S[28], ta[28], tb[28], tc[28], td[28], te[28], tf[28], tg[28], th[28]);
    or(S[29], ta[29], tb[29], tc[29], td[29], te[29], tf[29], tg[29], th[29]);
    or(S[30], ta[30], tb[30], tc[30], td[30], te[30], tf[30], tg[30], th[30]);
    or(S[31], ta[31], tb[31], tc[31], td[31], te[31], tf[31], tg[31], th[31]);


endmodule
