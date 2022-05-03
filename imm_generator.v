module imm_generator(in, imm);

input [11:0] in;
output [31:0] imm;

assign imm[31:12] = {20{in[11]}};
assign imm[11:0] = in;

endmodule 