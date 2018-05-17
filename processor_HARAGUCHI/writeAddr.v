module writeAddr_regi (
	input clock, 
	input reset, 
	input [2:0] addr_in,
	output reg [2:0] addr_out);
	
	always @(posedge clock or negedge reset) begin
		if (reset == 1'b0) begin
			addr_out <= 1'b0;
		end else if (clock == 1'b1) begin
			addr_out <= addr_in;
		end
	end
	
endmodule
