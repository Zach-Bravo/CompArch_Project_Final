module smallRAM (wr, Di, CS, address, clk, Do);

    input CS, wr, clk;
    input [5:0] address; 
    input [7:0] Di;
    output reg[7:0] Do;


    reg [7:0] memArray [0:63];
    reg [7:0] memOut;
    
    
    always @(posedge clk) 
        begin
            if(CS)
            memArray[address] = Di;
        end
    
    always @(posedge clk)
        begin
            memOut = memArray[address];
            
            Do = (CS && wr) ? memOut:8'b0;
        end

endmodule

/*module smallRAM(wr, Di, CS, address, clk, Do);

    input CS, wr, clk;
    input [5:0] address; 
    input [7:0] Di;
    output reg[7:0] Do;


    reg [7:0] memArray [0:63];
    reg [7:0] memOut;
    
    
    always @(posedge clk) 
        begin
            if(CS && wr)
            memArray[address] = Di;
        end
    
    always @(posedge clk)
        begin
            memOut = memArray[address];
            
            Do = (CS && !wr) ? memOut:8'b0;
        end

endmodule*/


/*module smallRAM(rw, dataIn, CS, address, clk, dataOut);

	input rw;
	input [7:0] dataIn;
	input [5:0] address;
	input CS;
	input clk;

	parameter adr_width=6;
	
	parameter ram_depth= 1 << adr_width;

	reg[7:0]memOut;
	//reg[7:0]mem[0:ram_depth-1];
	reg [7:0]mem[63:0];
	
	output [7:0] dataOut;


	always@(rw) begin 
	if(CS && rw)  //Write
	mem[address] = dataIn;
	end


	always@(clk) begin 
	memOut = mem[address]; //Read
	end
	assign dataOut = CS?memOut:8'b0;
	//assign dataOut = CS?mem[address]:8'b0;


endmodule */