module control_unit (
	input clock, reset, exec,
	input [2:0] phase,
	input halt,
	output register_reset,
	output p1, p2, p3, p4, p5);
	
	reg running = 1'b1;


	assign register_reset = reset;
	assign p1 = clock & (phase == 3'b000) & running;
	assign p2 = clock & (phase == 3'b001) & running;
	assign p3 = clock & (phase == 3'b010) & running;
	assign p4 = clock & (phase == 3'b011) & running;
	assign p5 = clock & (phase == 3'b100) & running;

	always @(posedge clock) begin
	
		
		//start and stop running on exec pushed	
		if (exec == 1'b0) begin 
			running <= ~running;

		//stop running on reset pushed			
		end else if (reset == 1'b0) begin
			running <= 0;
			
		end else if (halt == 1'b1) begin
			running <= ~running;
		end 
	end
	

	
endmodule
