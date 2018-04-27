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
		if (exec == 1'b1) begin 
			running <= ~running;
<<<<<<< HEAD

=======
		
		//end else if(halt == 1'b1) begin
			//running <= ~running;
		
>>>>>>> a4d2a23fcde2905c1b0327a16a8820ade2b73909
		//stop running on reset pushed			
		end else if (reset == 1'b1) begin 
			running <= 0;
			
		end
		
	end
	
<<<<<<< HEAD

=======
	//activate phases on running
	always @* begin
		if (running == 1'b1) begin 
			case (phase)
			 3'b000: 
			 begin
				p1 <= 1'b1;
				p2 <= 1'b0;
				p3 <= 1'b0;
				p4 <= 1'b0;
				p5 <= 1'b0;
			 end
			 
			 3'b001:
			 begin
				p1 <= 1'b0;
				p2 <= 1'b1;
				p3 <= 1'b0;
				p4 <= 1'b0;
				p5 <= 1'b0;
			 end
			 
			 3'b010:
			 begin
				p1 <= 1'b0;
				p2 <= 1'b0;
				p3 <= 1'b1;
				p4 <= 1'b0;
				p5 <= 1'b0;
			 end
			 
			 3'b011:
			 begin
				p1 <= 1'b0;
				p2 <= 1'b0;
				p3 <= 1'b0;
				p4 <= 1'b1;
				p5 <= 1'b0;
			 end
			 
			 3'b100:
			 begin
				p1 <= 1'b0;
				p2 <= 1'b0;
				p3 <= 1'b0;
				p4 <= 1'b0;
				p5 <= 1'b1;
			end
			
			default:
			begin
				p1 <= 1'b0;
				p2 <= 1'b0;
				p3 <= 1'b0;
				p4 <= 1'b0;
				p5 <= 1'b0;
			end
			
			endcase
			
		end else begin
			p1 <= 1'b1;
			p2 <= 1'b1;
			p3 <= 1'b1;
			p4 <= 1'b1;
			p5 <= 1'b1;
		end
	end	
>>>>>>> a4d2a23fcde2905c1b0327a16a8820ade2b73909
	
endmodule
