module DR (
	input p4, reset,
	input [15:0] data_from_ALU,
	output reg [15:0] data_to_memory);
	
	always @(posedge p4 or negedge reset) begin
		if (reset == 1'b0) begin
			data_to_memory <= 16'b0000000000000000;
		end else if (p4 == 1'b1) begin
			data_to_memory <= data_from_ALU;
		end
	end
	
endmodule
