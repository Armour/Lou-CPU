`timescale 1ns / 1ps
module ctrl(
        input clk,
        input rst,
        input [5:0] OP,
        output RegDst,
        output RegWrite,
        output ALUSrcA,
        output ALUctrInst,
        output IorD,
        output IRWrite,
        output MemRead,
        output MemWrite,
        output MemtoReg,
        output PCWriteCond,
        output PCWrite,
        output PCCondSrc,   // choose beq/bne
        output wire [1:0] ALUOp,
        output wire [1:0] ALUSrcB,
        output wire [1:0] PCSource,
        output reg [3:0] state,
        output wire RaWrite
    );

    wire [14:0] status;

    parameter IF     = 4'b0000, ID    = 4'b0001, EX_LS  = 4'b0010,
              MEM_RD = 4'b0011, WB_LS = 4'b0100, MEM_ST = 4'b0101,
              EX_R   = 4'b0110, WB_R  = 4'b0111, BR_CPN = 4'b1000,
              J_CPN = 4'b1001,  BN_CPN= 4'b1010, ADDI_2 = 4'b1011,
              ADDI_W = 4'b1100, JAL   = 4'b1101, XAO_I  = 4'b1110;

    initial begin
        state <= 4'b1111;
    end

    always @(posedge clk or posedge rst) begin
        if (rst == 1)
            state <= 4'b1111;
        else begin
            case (state)
                IF: //state 0
                begin
                    state <= ID;
                end
                ID: //state 1
                begin
                    case (OP[5:0])
                        6'b000000: //R-Type
                            state <= EX_R;
                        6'b000010: //Jump
                            state <= J_CPN;
                        6'b001000:
                            state <= ADDI_2;
                        6'b001100,
                        6'b001101,
                        6'b001110:
                            state <= XAO_I;
                        6'b100011,
                        6'b101011: //Load or Store
                            state <= EX_LS;
                        6'b000100: //BEQ
                            state <= BR_CPN;
                        6'b000101: //BNE
                            state <= BN_CPN;
                        6'b000011: //Jal
                            state <= JAL;
                        default:
                            state <= EX_R;
                    endcase
                end
                EX_LS://state 2
                begin
                    case (OP[5:0])
                        6'b100011:
                            state <= MEM_RD; //LW, goto 3
                        6'b101011:
                            state <= MEM_ST; //SW, goto 5
                    endcase
                end
                MEM_RD: //state 3
                begin
                    state <= WB_LS;
                end

                WB_LS: //state 4
                begin
                    state <= IF;
                end

                MEM_ST: //state 5
                begin
                    state <= IF;
                end

                EX_R: //state 6, excution of R-Type
                begin
                    state <= WB_R;
                end

                ADDI_2:
                begin
                    state <= ADDI_W;
                end

                XAO_I:
                begin
                    state <= ADDI_W;
                end

                WB_R: //state 7, write back register
                begin
                    state <= IF;
                end

                BR_CPN: //state 8
                begin
                    state <= IF;
                end

                J_CPN: //state 9
                begin
                    state <= IF;
                end

                BN_CPN:
                begin
                    state <= IF;
                end

                JAL: //state 10
                begin
                    state <= J_CPN;
                end

                default:
                    state <= IF;
            endcase
        end
    end

    assign status[0] = (state==4'b0000);
    assign status[1] = (state==4'b0001);
    assign status[2] = (state==4'b0010);
    assign status[3] = (state==4'b0011);
    assign status[4] = (state==4'b0100);
    assign status[5] = (state==4'b0101);
    assign status[6] = (state==4'b0110);
    assign status[7] = (state==4'b0111);
    assign status[8] = (state==4'b1000);
    assign status[9] = (state==4'b1001);
    assign status[10]= (state==4'b1010);
    assign status[11]= (state==4'b1011);
    assign status[12]= (state==4'b1100);
    assign status[13]= (state==4'b1101);
    assign status[14]= (state==4'b1110);


    assign RegDst = status[7];
    assign RegWrite = status[4] | status[7] | status[12] | status[13];
    assign ALUSrcA = status[2] | status[6] | status[8] | status[10] | status[11];
    assign ALUctrInst = status[14];
    assign IorD = status[3] | status[5];
    assign IRWrite = status[0];
    assign MemRead = status[0] | status[3]|status[5];
    assign MemWrite = status[5];
    assign MemtoReg = status[4];
    assign PCWriteCond = status[8] | status[10];
    assign PCWrite = status[0] | status[9];
    assign PCCondSrc = status[8];
    assign ALUOp = {status[6] | status[14], status[8] | status[14]};
    assign ALUSrcB = {status[1] | status[2] | status[11], status[0] | status[1]};
    assign PCSource = {status[9], status[8] | status[10]};
    assign RaWrite = status[13];

endmodule
