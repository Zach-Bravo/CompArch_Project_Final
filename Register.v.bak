module Register(inReg, load, clk, reset, out);

//parameter N = 31;

input [31:0] inReg;
input load;
input clk;
input reset;

output reg [31:0] out;

always @(posedge clk or posedge reset)

if(load == 1)
out <= inReg;
else if(reset == 1)
out <= 32'b0;

endmodule 


/*
if(reset) 
	begin
	out <= 32b'0;
	end

else if(load)
	begin
	out <= inReg;
	end
*/
	