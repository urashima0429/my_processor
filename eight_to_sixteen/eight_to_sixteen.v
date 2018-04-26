module eight_to_sixteen (
	input [7:0] eight,
	output [15:0] sixteen);

	assign sixteen = {8'b00000000, eight};
	
endmodule
	