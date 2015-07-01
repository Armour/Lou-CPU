`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:
// Design Name:
// Module Name:    xor32
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

module xor32(result, num1, num2);
    input [31:0]num1, num2;
    output [31:0]result;

    XOR2 xor0(.I0(num1[0]),.I1(num2[0]),.O(result[0]));
    XOR2 xor1(.I0(num1[1]),.I1(num2[1]),.O(result[1]));
    XOR2 xor2(.I0(num1[2]),.I1(num2[2]),.O(result[2]));
    XOR2 xor3(.I0(num1[3]),.I1(num2[3]),.O(result[3]));
    XOR2 xor4(.I0(num1[4]),.I1(num2[4]),.O(result[4]));
    XOR2 xor5(.I0(num1[5]),.I1(num2[5]),.O(result[5]));
    XOR2 xor6(.I0(num1[6]),.I1(num2[6]),.O(result[6]));
    XOR2 xor7(.I0(num1[7]),.I1(num2[7]),.O(result[7]));
    XOR2 xor8(.I0(num1[8]),.I1(num2[8]),.O(result[8]));
    XOR2 xor9(.I0(num1[9]),.I1(num2[9]),.O(result[9]));
    XOR2 xor10(.I0(num1[10]),.I1(num2[10]),.O(result[10]));
    XOR2 xor11(.I0(num1[11]),.I1(num2[11]),.O(result[11]));
    XOR2 xor12(.I0(num1[12]),.I1(num2[12]),.O(result[12]));
    XOR2 xor13(.I0(num1[13]),.I1(num2[13]),.O(result[13]));
    XOR2 xor14(.I0(num1[14]),.I1(num2[14]),.O(result[14]));
    XOR2 xor15(.I0(num1[15]),.I1(num2[15]),.O(result[15]));
    XOR2 xor16(.I0(num1[16]),.I1(num2[16]),.O(result[16]));
    XOR2 xor17(.I0(num1[17]),.I1(num2[17]),.O(result[17]));
    XOR2 xor18(.I0(num1[18]),.I1(num2[18]),.O(result[18]));
    XOR2 xor19(.I0(num1[19]),.I1(num2[19]),.O(result[19]));
    XOR2 xor20(.I0(num1[20]),.I1(num2[20]),.O(result[20]));
    XOR2 xor21(.I0(num1[21]),.I1(num2[21]),.O(result[21]));
    XOR2 xor22(.I0(num1[22]),.I1(num2[22]),.O(result[22]));
    XOR2 xor23(.I0(num1[23]),.I1(num2[23]),.O(result[23]));
    XOR2 xor24(.I0(num1[24]),.I1(num2[24]),.O(result[24]));
    XOR2 xor25(.I0(num1[25]),.I1(num2[25]),.O(result[25]));
    XOR2 xor26(.I0(num1[26]),.I1(num2[26]),.O(result[26]));
    XOR2 xor27(.I0(num1[27]),.I1(num2[27]),.O(result[27]));
    XOR2 xor28(.I0(num1[28]),.I1(num2[28]),.O(result[28]));
    XOR2 xor29(.I0(num1[29]),.I1(num2[29]),.O(result[29]));
    XOR2 xor30(.I0(num1[30]),.I1(num2[30]),.O(result[30]));
    XOR2 xor31(.I0(num1[31]),.I1(num2[31]),.O(result[31]));

endmodule
