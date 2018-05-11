module input_clock(
	input [15:0] in,
	input clock,
	output reg [15:0] out);
	
	always @(posedge clock) begin
		out <= in;
	end
	
endmodule
