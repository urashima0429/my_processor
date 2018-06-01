module aaa(
	input [31:0] in,
	output [15:0] out1,
	output [15:0] out2);
	
	assign out1 = in[15:0];
	assign out2 = in[31:16];
	
endmodule