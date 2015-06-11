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
        output[2:0] ALUoper
    );

    wire t1, t2;
    or (t1, Func[0], Func[3]);
    and (t2, Func[1], ALUop[1]);
    or (ALUoper[2], t2, ALUop[0]);
    or (ALUoper[1], ~Func[2], ~ALUop[1]);
    and (ALUoper[0], t1, ALUop[1]);

    /*
     *always@(ALUop or Func) begin
     *    case(ALUop)
     *        2'b00:ALUoper=3'b010;
     *        2'b01:ALUoper=3'b110;
     *        2'b10:begin
     *            case(Func)
     *                6'd32:ALUoper=3'b010;//add
     *                6'd34:ALUoper=3'b110;//sub
     *                6'd36:ALUoper=3'b000;//and
     *                6'd37:ALUoper=3'b001;//or
     *                6'd42:ALUoper=3'b111;//slt
     *            endcase
     *        end
     *        default:ALUoper=3'b000;
     *    endcase
     *end
     */

endmodule
