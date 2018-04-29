module AR (
	input p3, // if (p3 == 1'b1) then update all data
	input reset, // if (reset == 1'b0) then format all data
	input [15:0] data_from_regfile,
	output reg [15:0] data_to_ALU);
	
	always @(posedge p3 or negedge reset) begin
		if (reset == 1'b0) begin
			data_to_ALU <= 16'b0000000000000000;
		end else if (p3 == 1'b1) begin
			data_to_ALU <= data_from_regfile;
		end
	end
	
endmodule
