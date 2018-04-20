module program_counter(
	input p1, reset,
	input  [15:0]  in,
	output reg [15:0] out);
	
	always @(posedge p1 or negedge reset) begin
		
		//store value on phase1 activated
		if (p1 == 1'b1) begin
			out <= in;
			
		//reset register on reset pushed 
		end else if (reset == 1'b1) begin 
			out <= 0;
	
		end
	end
	
endmodule	