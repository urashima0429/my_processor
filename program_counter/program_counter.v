module program_counter(
	input  [15:0]  in,
	output reg [15:0] out);
	
	always @* begin
		out <= in;
	end
	
endmodule	