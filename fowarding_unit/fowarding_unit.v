module fowarding_unit(
	input clock,
	input [2:0] read_addr_from_p2_A, read_addr_from_p2_B,
	input [2:0] write_addr_from_p3, write_addr_from_p4, write_addr_from_p5,
	input [15:0] data_from_p3, data_from_p4, data_from_p5,
	//input write_p3, write_p4, write_p5,
	input [1:0] op1_p2,
	input [3:0] op3_p2, 	
	output reg [15:0] fowarding_data_A, fowarding_data_B,
	output reg to_foward_or_not_A, to_foward_or_not_B
	);
	
	/*
	always @(negedge clock) begin
	
		if(read_addr_from_p2_A == write_addr_from_p3) begin
			fowarding_data_A <= data_from_p3;		
			if(op1_p2 == 2'b10) begin
				to_foward_or_not_A <= 1'b0;
			end else begin
				to_foward_or_not_A <= 1'b1;
			end
		end else if	(read_addr_from_p2_A == write_addr_from_p4) begin
			fowarding_data_A <= data_from_p4;		
			if(op1_p2 == 2'b10) begin
				to_foward_or_not_A <= 1'b0;
			end else begin
				to_foward_or_not_A <= 1'b1;
			end
		end else if (read_addr_from_p2_A == write_addr_from_p5) begin
			fowarding_data_A <= data_from_p5;		
			if(op1_p2 == 2'b10) begin
				to_foward_or_not_A <= 1'b0;
			end else begin
				to_foward_or_not_A <= 1'b1;
			end
		end else begin
			fowarding_data_A <= 16'b0000000000000000;		
			to_foward_or_not_A <= 1'b0;
		end
		
		if(read_addr_from_p2_B == write_addr_from_p3) begin
			fowarding_data_B <= data_from_p3;		
			if(read_addr_from_p2_A == 3'b001) begin // read_addr_from_p2_A means op2
				to_foward_or_not_B <= 1'b1;
			end else if (read_addr_from_p2_A == 3'b010) begin
				to_foward_or_not_B <= 1'b1;
			end else begin
				to_foward_or_not_B <= 1'b0;
			end
		end else if	(read_addr_from_p2_A == write_addr_from_p4) begin
			fowarding_data_B <= data_from_p3;		
			if(read_addr_from_p2_A == 3'b001) begin // read_addr_from_p2_A means op2
				to_foward_or_not_B <= 1'b1;
			end else if (read_addr_from_p2_A == 3'b010) begin
				to_foward_or_not_B <= 1'b1;
			end else begin
				to_foward_or_not_B <= 1'b0;
			end
		end else if (read_addr_from_p2_A == write_addr_from_p5) begin
			fowarding_data_B <= data_from_p3;		
			if(read_addr_from_p2_A == 3'b001) begin // read_addr_from_p2_A means op2
				to_foward_or_not_B <= 1'b1;
			end else if (read_addr_from_p2_A == 3'b010) begin
				to_foward_or_not_B <= 1'b1;
			end else begin
				to_foward_or_not_B <= 1'b0;
			end;
		end else begin
			fowarding_data_B <= 16'b0000000000000000;		
			to_foward_or_not_B <= 1'b0;
		end
	
	end*/
	
	
	always @(negedge clock) begin //@* begin 
	
	/*
		if (op1_p2 == 2'b11) begin
			if (op3_p2 == 4'b1101) begin
				fowarding_data_A <= 16'b0000000000000000;	
				fowarding_data_B <= 16'b0000000000000000;	
				to_foward_or_not_A <= 1'b0;
				to_foward_or_not_B <= 1'b0;
			end
		end else begin*/
	
			if(read_addr_from_p2_A == write_addr_from_p3) begin
				fowarding_data_A <= data_from_p3;
				if(op1_p2 == 2'b10) begin
					to_foward_or_not_A <= 1'b0;
				end else begin
					to_foward_or_not_A <= 1'b1;
				end
			end else if(read_addr_from_p2_A != write_addr_from_p3) begin
				if(read_addr_from_p2_A == write_addr_from_p4) begin
					fowarding_data_A <= data_from_p4;
					if(op1_p2 == 2'b10) begin
						to_foward_or_not_A <= 1'b0;
					end else begin
						to_foward_or_not_A <= 1'b1;
					end
				end
			end else if(read_addr_from_p2_A != write_addr_from_p3) begin
				if(read_addr_from_p2_A != write_addr_from_p4) begin
					if(read_addr_from_p2_A == write_addr_from_p5) begin
						fowarding_data_A <= data_from_p5;
						if(op1_p2 == 2'b10) begin
							to_foward_or_not_A <= 1'b0;
						end else begin
							to_foward_or_not_A <= 1'b1;
						end
					end
				end
			end else begin
				fowarding_data_A <= 16'b0000000000000000;
				to_foward_or_not_A <= 1'b0;
			end
		
			if(read_addr_from_p2_B == write_addr_from_p3) begin
				fowarding_data_B <= data_from_p3;			
				if(op1_p2 == 2'b10) begin
					if(read_addr_from_p2_A == 3'b001) begin // read_addr_from_p2_A means op2
						to_foward_or_not_B <= 1'b1;
					end else if (read_addr_from_p2_A == 3'b010) begin
						to_foward_or_not_B <= 1'b1;
					end else begin
						to_foward_or_not_B <= 1'b0;
					end
				end else begin
					to_foward_or_not_B <= 1'b1;
				end
			end else if(read_addr_from_p2_B != write_addr_from_p3) begin
				if(read_addr_from_p2_B == write_addr_from_p4) begin
					fowarding_data_B <= data_from_p4;
					if(op1_p2 == 2'b10) begin
						if(read_addr_from_p2_A == 3'b001) begin // read_addr_from_p2_A means op2
							to_foward_or_not_B <= 1'b1;
						end else if (read_addr_from_p2_A == 3'b010) begin
							to_foward_or_not_B <= 1'b1;
						end else begin
							to_foward_or_not_B <= 1'b0;
						end
					end else begin
						to_foward_or_not_B <= 1'b1;
					end
				end
			end else if(read_addr_from_p2_B != write_addr_from_p3) begin
				if(read_addr_from_p2_B != write_addr_from_p4) begin
					if(read_addr_from_p2_B == write_addr_from_p5) begin
						fowarding_data_B <= data_from_p5;
						if(op1_p2 == 2'b10) begin
							if(read_addr_from_p2_A == 3'b001) begin // read_addr_from_p2_A means op2
								to_foward_or_not_B <= 1'b1;
							end else if (read_addr_from_p2_A == 3'b010) begin
								to_foward_or_not_B <= 1'b1;
							end else begin
								to_foward_or_not_B <= 1'b0;
							end
						end else begin
							to_foward_or_not_B <= 1'b1;
						end
					end
				end
			end else begin
				fowarding_data_B <= 16'b0000000000000000;
				to_foward_or_not_B <= 1'b0;
			end
			
		//end
		
	end
	
endmodule
	