module cycle(
	input clock,
	input reset,
	output reg [31:0] out);

	always @(posedge clock or negedge reset) begin
		if (reset == 1'b0) begin
			out <= 32'b00000000000000000000000000000000;
		end else begin
			out <= out + 32'b000000000000000000000001;
		end
	end

endmodule
