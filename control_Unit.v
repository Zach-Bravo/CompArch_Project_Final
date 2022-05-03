module control_Unit(clk, reset, in, status, ALUop,pcsrc, Alusrc, Imm_select, WB, REG_rw,MEM_rw,carry);
//Control Unit set up for all type of instructions
input clk,reset;
input [31:0]in;
input [3:0]status;
output reg pcsrc,Alusrc,WB,REG_rw,MEM_rw,carry;
output reg [1:0]Imm_select;
output reg[3:0]ALUop;
wire [6:0] opcode;
assign opcode=in[6:0];
always @(*) begin
case (opcode)
	7'b 0000000: begin
	pcsrc = 1'b0;
	end
	7'b 0110011: begin  //R-type 
	//add x5,x6,x7
	
	
	pcsrc=1'b0;// using +4
	Alusrc=1'b0;// not using IMM
	Imm_select=2'b00;//Not used at all in add 
	REG_rw=1'b1; //right back to reg
	MEM_rw=1'b1; //still the RAM
	WB=1'b1; //write back to reg
	carry=1'b0;//no carry used for this instruction 
	
	
	
	ALUop = {in[30],in[14:12]};
	
   end

	//00000000100000000000011010010011
	
	7'b 0010011:begin //I-type
	
	pcsrc=1'b0;// using +4
	Alusrc=1'b1;//  using IMM
	Imm_select=2'b01;//value used to select the Imm[11:0]
	REG_rw=1'b1; //right back to reg
	MEM_rw=1'b0; //still the RAM
	WB=1'b1; //write back to reg
	carry=1'b0;//no carry used for this instruction 
	
	
	
	ALUop = { in[30],in[14:12]};
	end
	
	7'b 0000011:begin //I-type Load version
	
	pcsrc=1'b0;// using +4
	Alusrc=1'b1;//  using IMM
	Imm_select=2'b01;//value used to select the Imm[11:0]
	REG_rw=1'b1; //right back to reg
	MEM_rw=1'b0; //still the RAM
	WB=1'b0; //write mem value back to reg
	carry=1'b0;//no carry used for this instruction 
	
	
	
	ALUop = { in[30],in[14:12]};
	end
	
	
	
	7'b 1100011: begin//Branch
		
	Alusrc=1'b0;//not imm different for I type 
	Imm_select=2'b10;//used for the imm values of [4:1\|11] and [12|10:5]
	REG_rw=1'b1; //
	MEM_rw=1'b0; //
	WB=1'b1; //write back to reg
	carry=1'b0;
	ALUop=4'b0000;
		case(status[2])
			1'b0:begin 
				pcsrc =1'b0;
			end 
			1'b1:begin 
				pcsrc =1'b1;
			end 
		endcase
	end
	
	
	7'b 0100011:begin //S-type
	
		
	pcsrc=1'b0; //dont need to change pc counter
	Alusrc=1'b1;//need to add imm
	Imm_select=2'b11;//from data path different for I type 
	REG_rw=1'b1;  //need to read from reg
	MEM_rw=1'b1;  //need to store value in RAM
	WB=1'b0; //from the RAM
	carry=1'b0;
	ALUop=4'b0000;
	
			end 
	endcase
end 
endmodule	