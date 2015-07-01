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
        output[3:0] ALUoper
    );

    wire R_type, I_type, Op_00, Op_01;
    wire Add_func, Sub_func, And_func, Or_func, Xor_func, Slt_func;
    wire oper0_1, oper0_2, oper0_3, oper0_4;
    wire oper1_1, oper1_2, oper1_3, oper1_4, oper1_5;
    wire oper2_1, oper2_2, oper2_3;
    wire oper3_1, oper3_2;

    and (Op_00, ALUop[0], ALUop[1]);
    and (Op_01, ~ALUop[0], ALUop[1]);
    and (R_type, ALUop[0], ~ALUop[1]);
    and (I_type, ~ALUop[0], ~ALUop[1]);

    and (Add_func, ~Func[2], ~Func[1], ~Func[0]); //x000
    and (Sub_func, ~Func[3], ~Func[2], Func[1], ~Func[0]); //0010
    and (And_func, Func[2], ~Func[1], ~Func[0]); //x100
    and (Or_func, Func[2], ~Func[1], Func[0]); //x101
    and (Xor_func, Func[2], Func[1], ~Func[0]); //x110
    and (Slt_func, Func[3], ~Func[2], Func[1], ~Func[0]); //1010

    and (oper0_1, Or_func, R_type);
    and (oper0_2, Or_func, I_type);
    and (oper0_3, Slt_func, R_type);
    and (oper0_4, Slt_func, I_type);
    or (ALUoper[0], oper0_1, oper0_2, oper0_3, oper0_4);

    and (oper1_1, Add_func, R_type);
    and (oper1_2, Add_func, I_type);
    and (oper1_3, Sub_func, R_type);
    and (oper1_4, Slt_func, R_type);
    and (oper1_5, Slt_func, I_type);
    or (ALUoper[1], Op_00, Op_01, oper1_1, oper1_2, oper1_3, oper1_4, oper1_5);

    and (oper2_1, Sub_func, R_type);
    and (oper2_2, Slt_func, R_type);
    and (oper2_3, Slt_func, I_type);
    or (ALUoper[2], Op_01, oper2_1, oper2_2, oper2_3);

    and (oper3_1, Xor_func, R_type);
    and (oper3_2, Xor_func, I_type);
    or (ALUoper[3], oper3_1, oper3_2);

endmodule
