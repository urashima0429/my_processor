module program_counter(
	input p1, reset,
	input  [15:0]  in,
	output reg [15:0] out);
	
	always @(posedge p1 or negedge reset) begin
		
		//reset register on reset pushed
		if(reset == 1'b0) begin 
			out <= 0;
	
		//store value on phase1 activated
		end else if (p1 == 1'b1) begin
			out <= in;
	
		end
	end
	
endmodule
