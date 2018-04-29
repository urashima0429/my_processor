module addr_select(
	input p1, clock,
	input [15:0] pc, dr,
	output reg [15:0] address);
	
	always @(negedge clock or posedge p1) begin//@(posedge p1 or posedge clock) begin
		if (p1 == 1'b1) begin
			 address <= pc;
		end else begin
			address <= dr;
		end
	end
	
endmodule
