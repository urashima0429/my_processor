module input_clock(
	input [15:0] in,
	input clock,
	output reg [15:0] out);
	
	always @(negedge clock) begin
		out <= in;
	end
	
endmodule
