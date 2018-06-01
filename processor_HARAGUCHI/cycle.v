module cycle(
	input clock,
	input reset,
	output reg [15:0] out);

	always @(posedge clock or negedge reset) begin
		if (reset == 1'b0) begin
			out <= 16'b0000000000000000;
		end else begin
			out <= out + 16'b000000000001;
		end
	end

endmodule
