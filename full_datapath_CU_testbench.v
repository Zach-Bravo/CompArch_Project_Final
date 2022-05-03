module full_datapath_CU_testbench;

reg clk, reset;
wire [31:0] PC_next;
wire [31:0] finalout;

full_datapath_CU dut(clk, reset, PC_next, finalout);

initial begin

	reset = 1;
	clk = 0;

	#150;
	
	clk = 1; //0
	
	#150;
	
	clk = 0; 
	reset = 0;
	
	#150;
	
	clk = 1;
	reset = 1; //0
	
	#150;
	
	clk = 0;
	
	#150;
	
	clk = 1; //4
	reset = 0;
	
	#150;
	
	clk = 0;
	
	#150;
	
	clk = 1; //8
	
	#150;
	
	clk = 0;
	
	#150;
	
	clk = 1; //12
	
	#150;
	
	clk = 0;
	
	#150;
	
	clk = 1; //16
	
	#150;
	
	clk = 0;
	
	#150;
	$stop;
	
end


wire [31:0] PC_address, ROMout, Read1, Read2, RS2_data, IMM_full, RAMout, result;
wire [4:0] RD, RS1, RS2;
wire [3:0] opcode;
wire PCsrc, MemtoReg, ALUsrc, Imm_select;


assign PC_address = dut.PC_address;
assign ROMout = dut.ROMout;
assign Read1 = dut.Read1;
assign Read2 = dut.Read2;
assign RS2_data = dut.RS2_data;
assign IMM_full = dut.IMM_full;
assign RD = dut.RD;
assign RS1 = dut.RS1;
assign RS2 = dut.RS2;
assign RAMout = dut.RAMout;
assign result = dut.result;
assign PCsrc = dut.PCsrc;
assign MemtoReg = dut.MemtoReg;
assign ALUsrc = dut.ALUsrc;
assign Imm_select = dut.Imm_select;
assign opcode = dut.opcode;

endmodule 