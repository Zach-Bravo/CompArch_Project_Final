module full_datapath_testbench;

//inputs
//reg [31:0] address;
reg clk, reset, RegWrite, MemRW, MemtoReg, PCsrc, ALUsrc;
reg [3:0] opcode;
//Opcode will have to be [2:0] in final project

//outputs
wire [31:0] PC_next;
wire [31:0] finalout;
//wire [31:0] Read1, Read2;

//(address, clk, reset, opcode, ALUsrc, RegWrite, MemRW, MemtoReg, PCsrc, I, PC_next)
full_datapath dut(.clk(clk), .reset(reset), .opcode(opcode), 
						.ALUsrc(ALUsrc), .RegWrite(RegWrite), .MemRW(MemRW), 
						.MemtoReg(MemtoReg), .PCsrc(PCsrc), .PC_next(PC_next), .finalout(finalout));


						
initial begin
//Alternate Clk, Switch Off Reset From 1 to 0 and keep at 0 for rest of operations
//address always starts at 0, take output and put into next input 
//ALUsrc (read2_Mux) 1 = IMM, 0 = RS2
//RegWrite 1 = write, 0 = nothing
//MemRW (SW) 1 = Write Also, 0 = Just Read
//MemtoReg (mem_Mux) 1 = RAMout data, 0 = result (from ALU operation)
//PCsrc (pc_Mux) 1 = Jump (Not Using), 0 = +4
//opcode -> read ALU, not writing here :)

	reset = 1;
	clk = 0;

	
	#150;
	
	clk = 1;
	
	#150;
	
	clk = 0;
	reset = 0;
	
	#150;
	
	//Setup
	
	clk = 1;
	reset = 1;
	
	ALUsrc = 1;
	RegWrite = 1;
	MemtoReg = 1;
	PCsrc = 0;
	opcode = 0001;
	MemRW = 0;
	
	#150;
	
	clk = 0;
	
	#150;
	
	
	//Test Addi save to Reg
	
	clk = 1;
	reset = 0;
	
	ALUsrc = 1;
	RegWrite = 1;
	MemtoReg = 0; //ALU result value
	PCsrc = 0; //+4
	opcode = 0001; //Add
	MemRW = 0; //Don't Write
	
	#150;
	
	clk = 0;
	
	/*
	#150;
	
	clk = 1;
	
	#150;
	
	clk = 0;*/
	
	//Test SW
	
	#150;
	
	clk = 1;
	
	ALUsrc = 1; //Used for 0(x14), but IMM = 13 so using different opcode to result in 0
	RegWrite = 0; //Don't write to reg
	MemtoReg = 1; //MEM out value
	PCsrc = 0;
	opcode = 0000; // should give 0
	MemRW = 1;
	
	#150;
	
	
	clk = 0;
	
	//Test LW -> ALU opcode and other doesn't matter, check datapath block 
	//memtoreg should be 1
	//RegWrite should be 1
	//All else should be 0
	#150;
	
	clk = 1;
	
	ALUsrc = 1;
	RegWrite = 1;
	MemtoReg = 1; //MEM out Value
	PCsrc = 0;
	opcode = 0000; // should give 0
	MemRW = 0;
	
	#150;
	
	clk = 0;
	
	
	#150;
	
	clk = 0;
	
	#150;
	
	$stop;
	

end


wire [31:0] PC_address, ROMout, Read1, Read2, RS2_data, IMM_full, RAMout, result;
wire [4:0] RD, RS1, RS2;


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

endmodule 