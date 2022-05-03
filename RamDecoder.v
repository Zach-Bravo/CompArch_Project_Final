module RamDecoder(in, o);
input [1:0] in;
output reg [3:0] o;

//always @ (in)begin
always @ (*)begin
	case(in)
		2'b00 : o= 4'b0001;
		2'b01 : o= 4'b0010;
		2'b10 : o= 4'b0100;
		2'b11 : o= 4'b1000;	
default : o = 4'bxxxx;
	
endcase
end 		
endmodule 