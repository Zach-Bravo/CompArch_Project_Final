module adderFour(next, outAddr);

input [31:0] next;

output reg [31:0] outAddr;

always@(next) begin

outAddr = next + 32'd4;

end

endmodule 