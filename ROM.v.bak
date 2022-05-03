module ROM(addr, dout, clk);

input [7:0] addr;
input clk;
output reg [31:0] dout;

always@(posedge clk) begin
	case(addr)
		8'd00: dout = 32'h00450693; //0
		8'd04: dout = 32'h00100713; //4
		8'd08: dout = 32'h00b76463; //8
		8'd12: dout = 32'h00008067; //c
		8'd16: dout = 32'h0006a803; //10
		8'd20: dout = 32'h00068613; //14
		8'd24: dout = 32'h00070793; //18
		8'd28: dout = 32'hffc62883; //1c
		8'd32: dout = 32'h01185a63; //20
		8'd36: dout = 32'h01162023; //24
		8'd40: dout = 32'hfff78793; //28
		8'd44: dout = 32'hffc60613; //2c
		8'd48: dout = 32'hfe0796e3; //30
		8'd52: dout = 32'h00279793; //34
		8'd56: dout = 32'h00f507b3; //38
		8'd60: dout = 32'h0107a023; //3c
		8'd64: dout = 32'h00170713; //40
		8'd68: dout = 32'h00468693; //44
		8'd72: dout = 32'hfc1ff06f; //48
	
		default: dout = 32'd0;

	endcase 
end

endmodule 