`timescale 1ns/1ps
module top (
        input wire clk, rst,
        input wire [7:0] switch,
        input wire btn,
        output [15:0] segment,
        output [11:0] anode
    );
    
    //debounce module of btns
	wire btn_out;
	pbdebounce pb0(clk,btn,btn_out);
	wire [3:0]state;
	//Signals about the controller
	wire ALUsrcA, RegWrite, RegDst,IRwrite,MemToReg, MemRead, MemWrite,IorD, PCwrite, PCWriteCond;
	wire [1:0] PCsrc,ALUop, ALUsrcB;
	//PC module
	wire PCwrite0;
	wire [31:0] PC, PCin;
	wire PCsignal;   //PC write enable
	//Memory Module
	wire [31:0] MemAddr;
	wire [31:0] mem_out_data;
	//RegFile Module
	wire [4:0] rf_write_addr;   //the write address of memory
	wire [31:0] rf_write_data;  //the write data of memory
	wire[31:0] RegFileOut1, RegFileOut2, RegFileOut3;
	
	//ALU module
	wire [2:0] ALUsignal; //control signal of ALU
	wire [31:0] ALUnum[1:0];
	wire [31:0] ALUres,ALUregnum;
	wire ALUzero, ALUcarryout,ALUoverflow;
	
	//register module
	wire[31:0] RegAOut, RegBOut, ext32,ext32sft;	
	wire [31:0] instruction, data;  //the instructions and data read from the memory  
	
	//display numbers
	reg[31:0] display32bits;
	wire [31:0] display32bitswire; 
	
   and(PCwrite0,PCWriteCond,ALUzero);
   and(PCsignal,PCwrite0,PCwrite);
	
	//Multiplexers
	mux2x1 #(5) mux0(instruction[20:16],instruction[15:11],RegDst,rf_write_addr);  //select the R2 of RegFile
	mux2x1 mux1(ALUregnum,data,MemToReg,rf_write_data);   //select the data to  write into the RegFile
   mux2x1 mux2(PC,RegAOut,ALUsrcA,ALUnum[0]); //select the first operand of ALU
	mux2x1 mux3(PC,ALUregnum,IorD,MemAddr);  //select the address to the Memory
   mux4x1 mux4(RegBOut,32'h4,ext32,ext32sft,ALUsrcB,ALUnum[1]); //select the second operand of ALU
   mux4x1 mux5(ALUres,ALUregnum,{PC[31:28],instruction[25:0],2'b00},1'bx,PCsrc,PCin); //select address of the next instruction
	
	//controller
	ctrl c0(clk,rst,instruction[31:26],RegDst,RegWrite,ALUsrcA,IorD,IRwrite,MemRead,MemWrite,MemToReg,PCWriteCond,PCwrite,ALUop,ALUSrcB,PCsrc,state);
	/*This part should be replaced by the memory part, which has the read enable and write enable*/
	//DataMem dm(clk, o_rdata2[31:0], alu_result[10:2], MemWrite, Dmdata[31:0]);
	IDmem mem(btn_out,MemRead,MemWrite,MemAddr[10:2],RegBOut,mem_out_data);   //the shared memory between instruction and data
	
	//Registers
	register PCreg(clk,PCsignal,PCin,PC);	
	register IR(clk,IRwrite,mem_out_data,instruction);   //instruction register and data register 
	register DR(clk,1,mem_out_data,data);
   register rfreg1(clk,1'b1,RegFileOut1,RegAOut);
   register rfreg2(clk,1'b1,RegFileOut2,RegBOut);
   register ALUout(clk,1'b1,ALUres,ALUregnum);
	//RegFile
	regFile rf(btn_out,rst,instruction[25:21],instruction[20:16],switch[4:0],rf_write_addr,rf_write_data,RegWrite,RegFileOut1,RegFileOut2,RegFileOut3);
	//address extension
    extend ext(instruction[15:0],ext32);
    shift sft(ext32,ext32sft);
    //ALU modules
    ALUctr ALucontrol(ALUop,instruction[5:0],ALUsignal);
    ALUnit ALU(ALUnum[0],ALUnum[1],ALUsignal,ALUres,ALUzero,ALUcarryout,ALUoverflow);

	display16bits disp0(clk,PC[15:0],anode[3:0],segment[7:0]);
	display32bits disp1(clk,display32bits,anode[11:4],segment[15:8]);
	always @(switch) begin
        if(switch[7:5]==3'b000)                //read one register in the RegFile
            display32bits = RegFileOut3;
        else if(switch[7:5]==3'b001)				//instruction
				display32bits = instruction;
        else if(switch[7:5]==3'b010)				//data		
            display32bits = data;
			else if(switch[7:5]==3'b011)          //RegAout
				display32bits = RegAOut;
			else if(switch[7:5]==3'b100)				//RegBOut
				display32bits = RegBOut;
			else if(switch[7:5]==3'b101)				//ALUres
				display32bits = ALUres;
			else if(switch[7:5]==3'b110)            //PCin
				display32bits = PCin;
			else if(switch[7:5]==3'b111)
				display32bits = {PCwrite, PCWriteCond,PCsrc, PCsignal,IorD, MemRead, MemWrite, MemToReg, IRwrite,RegWrite,RegDst,ALUop,ALUsrcB,ALUsrcA,ALUzero, ALUcarryout,ALUoverflow};
    end
endmodule
