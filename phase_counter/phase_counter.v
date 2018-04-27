module phase_counter (
	input clock, reset,
	output reg [2:0] phase);
	
	
	always @(negedge clock or negedge reset) begin

		if (reset == 1'b0) begin
			phase <= 3'b000;
			
		end else if (phase == 3'b100) begin 
			phase <= 3'b000;
		
		end else begin
			phase <= phase + 3'd1;
		
		end

	end

endmodule