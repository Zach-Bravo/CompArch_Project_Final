module full_datapath_CU(clk, reset, PC_next, finalout);

//Input CU Controls: RegWrite, ALUsrc, MemRW, PCsrc, MemToReg

wire [3:0] opcode;
wire RegWrite, MemRW, MemtoReg, PCsrc, ALUsrc; //1 or 0
wire [1:0] Imm_select;

output [31:0] PC_next; 
output [31:0] finalout;

input clk, reset;

//Block to Block inputs/outputs
//PC: PCin=32bit, PCout=32bit
wire [31:0] PC_address;

//READ/ROM PCout-> in, RS1/RS2/RD out, IMM out.
wire [31:0] ROMout;
wire [4:0] RD, RS1, RS2;
wire [11:0] IMM;
//IMM Gen IMM-> in, IMM_full out.
wire [31:0] IMM_full;
//Read2 Mux RS2 & IMM_full -> in, Read2 out.
//RegFile
wire [31:0] Read1;
wire [31:0] Read2;
wire [31:0] RS2_data;
//ALU
wire [31:0] result;
wire carry;
//MEM 
wire [3:0] status;
wire [3:0] decay;
//wire [31:0]regRW_data;


wire [31:0] RAMout;

//PC Mux potNext1 & potNext2 (updated + Jump) -> PC_out
wire [31:0] potNext1;
wire [31:0] potNext2;


//PC u1 (address, clk, reset, PC_address);
PC u1 (PC_next, clk, reset, PC_address);

//adderFour(next, outAddr);
adderFour u2 (PC_address, potNext1);

//ROM  (addr, dout);
ROM u3 (PC_address, ROMout);

//control_Unit(clk,  reset, in,     status, ALUop,  PCsrc, ALUsrc, Imm_select, WB,       REG_rw,   MEM_rw,carry)
control_Unit u4(clk, reset, ROMout, status, opcode, PCsrc, ALUsrc, Imm_select, MemtoReg, RegWrite, MemRW, carry);

//instructionDecoder(in,rd, rs1,rs2,imm);
instructionDecoder_CU u5(ROMout, RD, RS1, RS2);

IMM_Mux u6(Imm_select, ROMout, IMM);

//module imm_generator(in, imm);
imm_generator u7(IMM, IMM_full);

//RegFile (I, clk, reset, rs1, rs2, rd, writeEn, out, out1);
RegFile u8(finalout, clk, reset, RS1, RS2, RD, RegWrite, Read1, RS2_data);		


//Mux -> 0 = RS2, 1 = IMM
read2_Mux u9(ALUsrc, RS2_data, IMM_full, Read2);
//read2_Mux  (ALUsrc, RS2_data, IMM_full, Read2);

//ALU(A, B, opcode, STATUS, FINAL,Cin); status[2] = zero value
ALU u10(Read1, Read2, opcode, status, result, carry);

//RAM (Din,      address,     Dout,   clk,    rw);
RAM u11(RS2_data, result[7:0], RAMout, clk, MemRW);

//Mux -> MemMux
mem_Mux u12(MemtoReg, result, RAMout, finalout);


//Adder -> Jump/Branch
FullAdder u13(PC_address, IMM_full, carry, potNext2, decay);

//Mux -> Next PCout aka PC_next
pc_Mux u14(PCsrc, potNext1, potNext2, PC_next);


endmodule


