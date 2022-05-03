module IMM_Mux(Imm_select, instruction, imm);

input Imm_select;
input [31:0] instruction;

output reg[11:0] imm;

always@(*) begin
case(Imm_select)
2'b00://R-type
begin 
imm=12'b0;
end
2'b01://I-type
begin 
imm=instruction[31:20];
end
2'b10://Branch
begin 
imm[11]=instruction[31];
imm[10:5]=instruction[30:25];
imm[4:1]=instruction[11:8];
imm[0]=instruction[7];
end
2'b11://S-Type
begin
imm[11:5]=instruction[31:25];
imm[4:0] =instruction[11:7];
end


endcase
end

endmodule