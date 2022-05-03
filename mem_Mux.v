module mem_Mux(MemtoReg, result, RAMout, regRW_data);

input MemtoReg;
input [31:0] result;
input [31:0] RAMout;

output [31:0] regRW_data;
//Swapped result and RAMout to fit the Control Unit
assign regRW_data= MemtoReg?result:RAMout;
/*
always @(MemtoReg) begin
case(MemtoReg)

1'b0: regRW_data <= RAMout; //SW
1'b1: regRW_data <= result; //Arithmetic
 
endcase
end
*/
/*
always @(MemtoReg) begin

if(MemtoReg == 1) begin
regRW_data <= result;
end else begin
regRW_data <= RAMout;
end

end*/

endmodule 