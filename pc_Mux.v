module pc_Mux(PCsrc, potNext1, potNext2, PC_next);

input PCsrc;
input [31:0] potNext1;
input [31:0] potNext2;

output [31:0] PC_next;
/*
always @(PCsrc) begin
case(PCsrc)

1'b0: PC_next <= potNext1; //+4
1'b1: PC_next <= potNext2; //Jump

endcase
end
*//*
always @(PCsrc) begin

if(PCsrc == 1) begin
PC_next <= potNext2;
end else begin
PC_next <= potNext1;
end

end*/

assign PC_next= PCsrc?potNext2:potNext1;

endmodule 