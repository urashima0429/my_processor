module branch_prediction(
	input clock,
	input jump_or_not,
	output reg flush);
	
	always @(posedge clock) begin
		if (jump_or_not == 1'b1) begin
			flush <= 1'b1;
		end else begin
			flush <= 1'b0;
		end
	end
	
endmodule
