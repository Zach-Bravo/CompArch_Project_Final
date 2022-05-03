module RegFile (I, clk, reset, rs1, rs2, rd, writeEn, out, out1);

input clk, reset, writeEn;
input [4:0] rs1, rs2, rd;
input [31:0] I;
output [31:0] out, out1;


wire [31:0] o;
//Each x wire is an individual register
wire [31:0] x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, x18, x19, x20, x21, x22, x23, x24,x25, x26, x27, x28, x29, x30, x31, x32;

//instantiating decoder
RegDecoder d0(writeEn, rd, o);

//module Register(load, clk, reset, out, inReg);
//Register u1(o[0], clk, reset, x1, I);


Register u2(o[1], clk, reset, x2, I);
Register u3(o[2], clk, reset, x3, I);
Register u4(o[3], clk, reset, x4, I);
Register u5(o[4], clk, reset, x5, I);
Register u6(o[5], clk, reset, x6, I);
Register u7(o[6], clk, reset, x7, I);
Register u8(o[7], clk, reset, x8, I);
Register u9(o[8], clk, reset, x9, I);
Register u10(o[9], clk, reset, x10, I);
Register u11(o[10], clk, reset, x11, I);
Register u12(o[11], clk, reset, x12, I);
Register u13(o[12], clk, reset, x13, I);
Register u14(o[13], clk, reset, x14, I);
Register u15(o[14], clk, reset, x15, I);
Register u16(o[15], clk, reset, x16, I);
Register u17(o[16], clk, reset, x17, I);
Register u18(o[17], clk, reset, x18, I);
Register u19(o[18], clk, reset, x19, I);
Register u20(o[19], clk, reset, x20, I);
Register u21(o[20], clk, reset, x21, I);
Register u22(o[21], clk, reset, x22, I);
Register u23(o[22], clk, reset, x23, I);
Register u24(o[23], clk, reset, x24, I);
Register u25(o[24], clk, reset, x25, I);
Register u26(o[25], clk, reset, x26, I);
Register u27(o[26], clk, reset, x27, I);
Register u28(o[27], clk, reset, x28, I);
Register u29(o[28], clk, reset, x29, I);
Register u30(o[29], clk, reset, x30, I);
Register u31(o[30], clk, reset, x31, I);
Register u32(o[31], clk, reset, x32, I);

assign x1 = 32'b0;

//instantiating Multiplexer
RegMux m0(x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, x18, x19, x20, x21, x22, x23, x24,x25, x26, x27, x28, x29, x30, x31, x32, rs1, out);
RegMux m1(x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, x18, x19, x20, x21, x22, x23, x24,x25, x26, x27, x28, x29, x30, x31, x32, rs2, out1);

endmodule 