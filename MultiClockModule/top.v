`timescale 1ns/1ps
module top (
        input wire clk, rst,
        input wire [9:0] switch,
        input wire btn,
        output [15:0] segment,
        output [11:0] anode
    );

    //debounce module of btns
    wire btn_out;
    wire btn_out_1ns;
    wire btn_out_2ns;
    wire btn_out_4ns;
    wire btn_out_6ns;
    wire btn_out_8ns;
    pbdebounce pb0(clk, btn, btn_out);

    //Signals about the controller
    wire ALUsrcA, RegWrite, RegDst, IRwrite, MemToReg, MemRead, MemWrite, IorD, PCwrite, PCWriteCond, PCCondSrc, ALUctrInst, RaWrite;
    wire [1:0] PCsrc, ALUop, ALUsrcB;
    wire [3:0]state;

    //PC Bne/Beq AND gate
    wire Bneq;  //beq or bne?

    //PC module
    wire PCwrite0;
    wire [31:0] PC, PCin;
    wire PCsignal;   //PC write enable

    //Memory Module
    wire [31:0] MemAddr;
    wire [31:0] mem_out_data;

    //RegFile Module
    wire [4:0]  rf_write_addr, rf_write_addr_final;   //the write address of memory
    wire [31:0] rf_write_data, rf_write_data_final;  //the write data of memory
    wire[31:0] RegFileOut1, RegFileOut2, RegFileOut3;

    //ALU module
    wire [3:0] ALUsignal; //control signal of ALU
    wire [31:0] ALUnum[1:0];
    wire [31:0] ALUres,ALUregnum;
    wire [5:0] ALUinst;
    wire ALUzero, ALUcarryout, ALUoverflow;

    //register module
    wire[31:0] RegAOut, RegBOut;
    wire [31:0] instruction, data;  //the instructions and data read from the memory
    //extension module
    wire [31:0]  ext32,ext32sft;
    //display numbers
    reg[31:0] display32bits;
    wire [31:0] display32bitswire;

    //registers
    PCregister PCreg(btn_out,PCsignal,PCin,PC);
    register IR(btn_out_4ns,IRwrite,mem_out_data,instruction);   //instruction register and data register
    register DR(btn_out_4ns,1'b1,mem_out_data,data);
    register rfreg1(btn_out,1'b1,RegFileOut1,RegAOut);
    register rfreg2(btn_out,1'b1,RegFileOut2,RegBOut);
    register ALUout(btn_out,1'b1,ALUres,ALUregnum);

    and(PCwrite0,PCWriteCond,Bneq);
    or(PCsignal,PCwrite0,PCwrite);

    //Multiplexers
    mux2x1 #(5) mux0(instruction[20:16],instruction[15:11],RegDst,rf_write_addr);  //select the R2 of RegFile
    mux2x1 mux1(ALUregnum,data,MemToReg,rf_write_data);   //select the data to  write into the RegFile
    mux2x1 mux2(PC,RegAOut,ALUsrcA,ALUnum[0]); //select the first operand of ALU
    mux2x1 mux3(PC,ALUregnum,IorD,MemAddr);  //select the address to the Memory
    mux4x1 mux4(RegBOut,32'h4,ext32,ext32sft,ALUsrcB,ALUnum[1]); //select the second operand of ALU
    mux4x1 mux5(ALUres,ALUregnum,{PC[31:28],instruction[25:0],2'b00},1'bx,PCsrc,PCin); //select address of the next instruction
    mux2x1 #(1) mux6(~ALUzero, ALUzero, PCCondSrc, Bneq);
    mux2x1 #(6) mux7(instruction[5:0], instruction[31:26], ALUctrInst, ALUinst[5:0]);
    mux2x1 mux8(rf_write_data,PCin, RaWrite, rf_write_data_final);
    mux2x1 #(5) mux9(rf_write_addr, 5'b1111, RaWrite, rf_write_addr_final);

    //controller
    ctrl c0(btn_out,rst,instruction[31:26],RegDst,RegWrite,ALUsrcA,ALUctrInst,IorD,IRwrite,MemRead,MemWrite,MemToReg,PCWriteCond,PCwrite,PCCondSrc,ALUop,ALUsrcB,PCsrc,state,RaWrite);
    IP6261114 mem(~(btn_out),MemRead,MemWrite,MemAddr[10:2],RegBOut,mem_out_data);   //the shared memory between instruction and data

    //RegFil
    regFile rf(btn_out,rst,instruction[25:21],instruction[20:16],switch[4:0],rf_write_addr_final,rf_write_data_final,RegWrite,RegFileOut1,RegFileOut2,RegFileOut3);
    //address extension
    extend ext(instruction[15:0],ext32);
    shift sft(ext32,ext32sft);

    //ALU modules
    ALUctr ALucontrol(ALUop, ALUinst[5:0], ALUsignal);
    ALUnit ALU(ALUnum[0],ALUnum[1],ALUsignal,ALUres,ALUzero,ALUcarryout,ALUoverflow);

    //display module
    display16bits disp0(clk,PC[15:0],anode[3:0],segment[7:0]);
    display32bits disp1(clk,display32bits,anode[11:4],segment[15:8]);
    always @(switch) begin
        if(switch[9:5]==5'b00000)                //read one register in the RegFile
            display32bits = RegFileOut3;
        else if(switch[9:5]==5'b00001)                //instruction
                display32bits = instruction;
        else if(switch[9:5]==5'b00010)                //data
                display32bits = data;
            else if(switch[9:5]==5'b00011)          //ALU operands
                display32bits = ALUnum[0];
            else if(switch[9:5]==5'b00100)                //ALU operands
                display32bits = ALUnum[1];
            else if(switch[9:5]==5'b00101)                //ALUres
                display32bits = ALUres;
            else if(switch[9:5]==5'b00110)            //PCin
                display32bits = rf_write_data_final;
            else if(switch[9:5]==5'b00111)
                display32bits = mem_out_data;
            else if(switch[9:5]==5'b01000)
                display32bits = RegAOut;
            else if(switch[9:5]==5'b01001)
                display32bits = RegBOut;
            else if(switch[9:5]==5'b01010)
                display32bits=PCin;
            else if(switch[9:5]==5'b01011)
                display32bits = MemAddr[10:2];
            else if(switch[9:5]==5'b01100)
                display32bits=ALUregnum;
    end
endmodule
