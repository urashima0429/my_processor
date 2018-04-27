module control_unit (
	input clock, reset, exec,
	input [2:0] phase,
	input halt,
	output register_reset,
	output reg p1, p2, p3, p4, p5);
	
	reg running = 0;

	assign register_reset = reset;

	always @(posedge exec or negedge reset) begin
		
		//start and stop running on exec pushed	
		if (exec == 1'b1) begin 
			running <= ~running;
		end else if(halt == 1'b1) begin
			running <= ~running;
		
		//stop running on reset pushed			
		end else if (reset == 1'b1) begin 
			running <= 0;
			
		end
	end
	
	//activate phases on running
	always @* begin
		if (running == 1) begin 
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
			p1 <= 1'b0;
			p2 <= 1'b0;
			p3 <= 1'b0;
			p4 <= 1'b0;
			p5 <= 1'b0;
		end
	end	
	
endmodule
