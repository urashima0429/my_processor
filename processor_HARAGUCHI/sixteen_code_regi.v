module sixteen_bit_code_regi (
	input clock, 
	input reset, 
	input [15:0] in,
	output reg [15:0] out);
	
	always @(posedge clock or negedge reset) begin
		if (reset == 1'b0) begin
			out <= 16'b0000000000000000;
		end else if (clock == 1'b1) begin
			out <= in;
		end
	end
	
endmodule
