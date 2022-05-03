module instructionDecoder_CU(in,rd, rs1,rs2);


input [31:0]in;

output [4:0]rd;
output [4:0]rs1;
output [4:0]rs2;
//output [11:0]imm;

assign rd=in[11:7];
assign rs1=in[19:15];
assign rs2=in[24:20];
//assign imm=in[31:20];

endmodule 