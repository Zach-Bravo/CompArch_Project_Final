module PC(next, clk, reset, outAddr);

input clk;
input [31:0] next;
input reset;

output reg [31:0] outAddr;

always@(posedge clk) begin

if(reset) begin

outAddr = 32'b0;

end else begin

outAddr = next;

end
end

endmodule 