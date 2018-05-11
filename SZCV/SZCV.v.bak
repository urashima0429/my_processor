module SZCV (
	input p4, reset, clock,
	input S_in, Z_in, C_in, V_in,
	output reg S_out, Z_out, C_out, V_out);
	
	always @(posedge clock or posedge reset) begin
		if (reset == 1'b1) begin
			S_out <= 1'b0;
			Z_out <= 1'b0;
			C_out <= 1'b0;
			V_out <= 1'b0;
		end else if (p4 == 1'b1) begin
			S_out <= S_in;
			Z_out <= Z_in;
			C_out <= C_in;
			V_out <= V_in;
		end
	end
	
endmodule
