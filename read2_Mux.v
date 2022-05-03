
module read2_Mux(ALUsrc, RS2_full, IMM_full, Read2);

input ALUsrc;
input [31:0] RS2_full;
input [31:0] IMM_full;

output [31:0] Read2;

assign Read2= ALUsrc? IMM_full:RS2_full;


endmodule
/*module read2_Mux(ALUsrc, RS2_full, IMM_full, Read2);

input ALUsrc;
input [31:0] RS2_full;
input [31:0] IMM_full;

output reg [31:0] Read2;
/* This part was commented
always @(ALUsrc) begin
case(ALUsrc)

1'b0: Read2 <= RS2_full;
1'b1: Read2 <= IMM_full;

endcase
end
*/
/*always @(ALUsrc) begin

if(ALUsrc == 1) begin
Read2 <= IMM_full;
end else begin
Read2 <= RS2_full;
end

end

endmodule */