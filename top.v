`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:
// Design Name:
// Module Name:    top
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

module top (
        input clk, rst,
        input [6:0] switch,
        input [1:0] btn,
        output [15:0] segment,
        output [11:0] anode
    );

    //clock count
    reg [15:0] clk_cnt;

    //PC register
    wire [1:0] btn_out;
    wire [31:0] inst_one;
    wire [31:0] pc_0, pc_4, pc_new;

    //CPU controller
    wire [1:0] ALUop;
    wire RegDst, RegWrite, ALUsrc, Branch, Jump;
    wire MemtoReg, MemRead, MemWrite;

    //Register File
    wire [4:0] i_wreg;
    wire [31:0] i_wdata, o_rdata1, o_rdata2;
    wire [31:0] reg_display; // local registers we choose to display

    //ALU
    wire [31:0] alu_op2, alu_result;
    wire zero_flag;
    wire carryout_flag;
    wire overflow_flag;

    //ALU controller
    wire [2:0] alu_ctrl;

    //sign extended
    wire [31:0] out_ext32;

    //and control signal
    wire brh_ctr;

    //jump signal
    wire [31:0] pc_4_j;
    wire [31:0] j_brh_0;

    //Data memory
    wire [31:0] Dmdata;

    //display module
    reg [15:0] display16num;
    reg [31:0] display32num;

    initial begin
        display16num = 16'b0;
        clk_cnt = 16'b0;
        display32num = 32'b0;
    end

    pc p(btn_out[0], rst, pc_new[10:2], pc_0[10:2]);
    pc4 p4(pc_0[10:2], pc_4[10:2]);
    inst in(pc_0[10:2], inst_one);

    adder32 add(pc_4, {out_ext32[29:0], 2'b00}, 1'b0, 1'b0, pc_4_j, carray_out_flag_j, overflow_flag_j);

    control sc(inst_one[31:26], ALUop, RegDst, RegWrite, Branch, Jump, MemtoReg, MemRead, MemWrite, ALUsrc, rst);

    regFile sg(btn_out[0], rst, inst_one[25:21], inst_one[20:16], switch[4:0], i_wreg, i_wdata, RegWrite, o_rdata1, o_rdata2, reg_display);

    ALUnit sa(o_rdata1, alu_op2, alu_ctrl, alu_result, zero_flag, carryout_flag, overflow_flag);

    ALUctr sac(ALUop, inst_one[5:0], alu_ctrl);

    pbdebounce pb(clk, btn, btn_out);

    mux2x1 #(5) sm0(inst_one[20:16], inst_one[15:11], RegDst, i_wreg); //W1
    mux2x1 sm1(o_rdata2, out_ext32, ALUsrc, alu_op2); //ALU operand2
    mux2x1 sm2(alu_result, Dmdata, MemtoReg, i_wdata); //Wdata
    mux2x1 sm3(pc_4, pc_4_j, brh_ctr, j_brh_0); //jump 0
    mux2x1 sm4(j_brh_0, {pc_4[31:28], inst_one[25:0], 2'b00}, Jump, pc_new); //back to pc

    extend ext(inst_one[15:0], out_ext32); //sign extended

    DataMem dm(clk, o_rdata2[31:0], alu_result[10:2], MemWrite, Dmdata[31:0]);

    and (brh_ctr, Branch, zero_flag); //control the branch

    display16bits m0(clk, pc_0[15:0], anode[3:0], segment[7:0]); //16-bit display
    display32bits m1(clk, display32num, anode[11:4], segment[15:8]);

    always @(posedge btn_out[0] or posedge rst) begin
        if(rst==1)
            clk_cnt = 16'b0;
        else begin
            clk_cnt = clk_cnt + 1;
        end
    end

    always @(switch) begin
        if(switch[6:5]==2'b00)
            display32num = reg_display;
        else if(switch[6:5]==2'b01)
            display32num = inst_one;
        else if(switch[6:5]==2'b11)
            display32num = Dmdata;
    end

endmodule
