// BR wo copy&paste sita dake. yo check.

module AR (
	input p3, // if (p3 == 1'b1) then update all data
	input reset, // if (reset == 1'b1) then format all data
	input clock,
	input [15:0] data_from_regfile,
	output reg [15:0] data_to_ALU);
	
	always @(posedge clock or posedge reset) begin
		if (reset == 1'b1) begin
			data_to_ALU <= 16'b0000000000000000;
		end else if (p3 == 1'b1) begin
			data_to_ALU <= data_from_regfile;
		end
	end
	
endmodule
