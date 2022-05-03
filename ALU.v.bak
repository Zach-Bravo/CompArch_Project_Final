module ALU_LAB(A, B,opcode , STATUS, FINAL,Cin);
input [31:0]A;
input [31:0]B; 
input [3:0]opcode;
input Cin;
output [31:0] FINAL;
output[3:0] STATUS;
wire [31:0] ANDout, ORout, NORout, XORout, left, right, ADD;
assign ANDout = A && B;    //AND
assign ORout = A ||B;    //OR 
assign NORout = ~ORout; //Nor
assign XORout = A ^^ B;  // XOR

assign left = A << B; //Left shift 
assign right = A >> B;  //Right shift
assign mux8 = 32'b0;

//FullAdder(A, B, Cin, S, status);
FullAdder m1(.A(A),.B(B), .Cin(Cin), .S(ADD), .status(STATUS));	

//Multiplexer(x1, x2, x3, x4, x5, x6, x7,x8 ,opcode, out);
Multiplexer m0(.x1(ADD), .x2(XORout), .x3(ANDout), .x4(ORout), .x5(NORout), .x6(right), .x7(left),.x8(mux8), .opcode(opcode), .out(FINAL));


// 0001 add
//0010 XOR
// 0011 AND
//0100 OR
//0101 NOR
//0110 Right shift
//0111 Left shift 



endmodule 