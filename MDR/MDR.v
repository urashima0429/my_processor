module MDR (
	input p5, reset,
	input [15:0] data_from_memory,
	output reg [15:0] data_to_regfile);

	always @(posedge p5 or negedge reset) begin
		if (reset == 1'b0) begin
			data_to_regfile <= 16'b0000000000000000;
		end else if (p5 == 1'b1) begin
			data_to_regfile <= data_from_memory;//coment
		end
	end
	
endmodule
