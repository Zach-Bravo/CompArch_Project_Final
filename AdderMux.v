module AdderMux(x1, x2, x3, x4, x5, x6, x7,x8 ,opcode, out);

    parameter N = 32;

    input [N-1:0] x1, x2, x3, x4, x5, x6, x7, x8; 
    input [3:0] opcode;
    

    output reg [31:0] out;

    always @(opcode,x1,x2,x3,x4,x5,x6,x7,x8) begin

    case(opcode)

    4'b0001: out <= x1;
    4'b0010: out <= x2;
    4'b0011: out <= x3;
    4'b0100: out <= x4;
    4'b0101: out <= x5;
    4'b0110: out <= x6;
    4'b0111: out <= x7;
    4'b0000: out <= x8;


    endcase


    end

endmodule 