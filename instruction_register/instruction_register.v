module instruction_register (
	input p2, // if (p2 == 1'b1) then update all data
	input reset, // if (reset == 1'b1) then format all data
	input [15:0] inst_from_memory,
	output reg [15:0] inst_to_decoder);
	
	always @(posedge p2 or negedge reset) begin
		if (reset == 1'b0) begin
			inst_to_decoder <= 16'b0000000000000000;
		end else if (p2 == 1'b1) begin
			inst_to_decoder <= inst_from_memory;
		end
	end
	
endmodule	
	