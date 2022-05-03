module FullAddOne(x, y, Ci, z1, Co);
	
	output reg z1, Co;
	input x, y, Ci;

	//assign z = x^y^Ci;
	//(~(A&B&Cin))|(Cin&(A|B))
	//assign Co = (Ci&(x^y)) | (x&y);
	//(A&B) | (Cin&((A|B)&(~(A&B))))
	
	always@(x, y, Ci)begin
		z1 = (x^y)^Ci;
		Co = (Ci&(x^y)) | (x&y);
	end
	
endmodule 

module FullAdder(A, B, Cin, S, status);
					  
	parameter N = 32;
	input [N-1:0] A, B;
	input Cin;
			
	output  [N-1:0] S;
	output reg [3:0] status;
	
	wire [N:0] carry;
	wire [N-1:0] a1, b1;
	assign a1 = A;
	assign b1 = B;
	
	assign carry[0] = Cin;
	genvar i;
	generate
		for(i=0; i< N; i=i+1) begin: fa
		FullAddOne u0 (a1[i], b1[i], carry[i], S[i], carry[i+1]);
		end
	endgenerate
	
	always@(A[31], B[31],S,carry[32] ) begin
		if(((~A[31])&(~B[31])&S[31]) | (A[31]&B[31]&(~S[31]))) begin
		
			status[0] <= 1;
		
		end else begin
		
			status[0] <= 0;
		
		end
		if(S[31] == 1) begin
		
			status[1] <= 1;
		
		end else begin
		
			status[1] <= 0;
		
		end
		if(S == 32'b0) begin
		
			status[2] <= 1;
		
		end else begin
		
			status[2] <= 0;
		
		end
		status[3] <= carry[32];
	end
	
	/*
	Cout Becomes The Following Cin
	status[0] = V (Overflow)
	status[1] = N (Negative)
	status[2] = Z (Zero)
	status[3] = C (Carry)
	*/
	
endmodule 