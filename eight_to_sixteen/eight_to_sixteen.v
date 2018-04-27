module eight_to_sixteen (
	input [3:0]  dFront, dBack,
	output [15:0] sixteen);

	assign sixteen = {8'b00000000, dFront, dBack};
	
endmodule
	