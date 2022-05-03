module RAM (Din, address, Dout, clk, rw);

input [31:0] Din;
input [7:0] address;
input clk, rw;

output [31:0] Dout;


wire [3:0] CS;
wire [31:0] dout0, dout1, dout2, dout3; //for each output of 64x8 ram

//instantating decoder:
//module decoder2to4(in, ou0, ou1, ou2, ou3);

RamDecoder u0(address[7:6], CS);

/*
isntantating 64x8 ram:
"call 16 times. 32 btis for each row and column. dout[3:0] = row & Din[31:0] = column."
*/

//smallRAM (rw, dataIn, CS, address[5:0], clk, dataOut);

smallRAM m0(rw, Din[7:0], CS[0], address[5:0], clk, dout0[7:0]);
smallRAM m1(rw, Din[15:8], CS[0], address[5:0], clk, dout0[15:8]);
smallRAM m2(rw, Din[23:16], CS[0], address[5:0], clk, dout0[23:16]);
smallRAM m3(rw, Din[31:24], CS[0], address[5:0], clk, dout0[31:24]);

smallRAM m4(rw, Din[7:0], CS[1], address[5:0], clk, dout1[7:0]);
smallRAM m5(rw, Din[15:8], CS[1], address[5:0], clk, dout1[15:8]);
smallRAM m6(rw, Din[23:16], CS[1], address[5:0], clk, dout1[23:16]);
smallRAM m7(rw, Din[31:24], CS[1], address[5:0], clk, dout1[31:24]);

smallRAM m8(rw, Din[7:0], CS[2], address[5:0], clk, dout2[7:0]);
smallRAM m9(rw, Din[15:8], CS[2], address[5:0], clk, dout2[15:8]);
smallRAM m10(rw, Din[23:16], CS[2], address[5:0], clk, dout2[23:16]);
smallRAM m11(rw, Din[31:24], CS[2], address[5:0], clk, dout2[31:24]);

smallRAM m12(rw, Din[7:0], CS[3], address[5:0], clk, dout3[7:0]);
smallRAM m13(rw, Din[15:8], CS[3], address[5:0], clk, dout3[15:8]);
smallRAM m14(rw, Din[23:16], CS[3], address[5:0], clk, dout3[23:16]);
smallRAM m15(rw, Din[31:24], CS[3], address[5:0], clk, dout3[31:24]);


//selecting specific row for output
assign Dout= CS[0]? dout0: 'bz;
assign Dout= CS[1]? dout1: 'bz;
assign Dout= CS[2]? dout2: 'bz;
assign Dout= CS[3]? dout3: 'bz;

endmodule
