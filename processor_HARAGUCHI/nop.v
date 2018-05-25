module nop(
	input [15:0] inst_in,
	input flush,
	output reg [15:0] inst_out);
	
	always @* begin
	
		if (flush == 1'b1) begin
			inst_out <= 16'b1000100000000000; // r(0) = r(0) + 0; (nop instruction)
		end else begin
			inst_out <= inst_in;
		end
	
	end
	
endmodule	
