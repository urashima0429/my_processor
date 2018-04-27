module adder_for_program_counter(
	input  [15:0]  in,
	output [15:0] out);
	
	assign out = in + 16'b0000000000000001;
	
endmodule