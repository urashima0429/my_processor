module fowarding_unit(
	input clock,
	input [2:0] read_addr_from_p2_A, read_addr_from_p2_B,
	input [2:0] write_addr_from_p3, write_addr_from_p4, write_addr_from_p5,
	input [15:0] data_from_p3, data_from_p4, data_from_p5,
	input write_p3, write_p4, write_p5,	
	output reg [15:0] fowarding_data_A, fowarding_data_B,
	output reg to_foward_or_not_A, to_foward_or_not_B
	);

	always @(negedge clock) begin
	
		if (clock == 1'b0) begin
		
			if (read_addr_from_p2_A == write_addr_from_p3) begin
				if (write_p3 == 1'b1) begin
					fowarding_data_A <= data_from_p3;
					to_foward_or_not_A <= 1'b1;
				end else begin 
					fowarding_data_B <= 16'b0000000000000000;	
					to_foward_or_not_B <= 1'b0;
				end
			end else if (read_addr_from_p2_A == write_addr_from_p4) begin
				if (write_p4 == 1'b1) begin
					fowarding_data_A <= data_from_p4;
					to_foward_or_not_A <= 1'b1;
				end else begin
					fowarding_data_A <= 16'b0000000000000000;	
					to_foward_or_not_A <= 1'b0;
				end
			end else if (read_addr_from_p2_A == write_addr_from_p5) begin
				if (write_p5 == 1'b1) begin
					fowarding_data_A <= data_from_p5;
					to_foward_or_not_A <= 1'b1;
				end else begin
					fowarding_data_A <= 16'b0000000000000000;	
					to_foward_or_not_A <= 1'b0;
				end
			end else begin
				fowarding_data_A <= 16'b0000000000000000;	
				to_foward_or_not_A <= 1'b0;
			end
			
			
			if (read_addr_from_p2_B == write_addr_from_p3) begin
				if (write_p3 == 1'b1) begin
					fowarding_data_B <= data_from_p3;
					to_foward_or_not_B <= 1'b1;
				end else begin 
					fowarding_data_B <= 16'b0000000000000000;	
					to_foward_or_not_B <= 1'b0;
				end
			end else if (read_addr_from_p2_B == write_addr_from_p4) begin
				if (write_p4 == 1'b1) begin
					fowarding_data_B <= data_from_p4;
					to_foward_or_not_B <= 1'b1;
				end else begin
					fowarding_data_B <= 16'b0000000000000000;	
					to_foward_or_not_B <= 1'b0;
				end
			end else if (read_addr_from_p2_B == write_addr_from_p5) begin
				if (write_p5 == 1'b1) begin
					fowarding_data_B <= data_from_p5;
					to_foward_or_not_B <= 1'b1;
				end else begin
					fowarding_data_B <= 16'b0000000000000000;	
					to_foward_or_not_B <= 1'b0;
				end
			end else begin
				fowarding_data_B <= 16'b0000000000000000;	
				to_foward_or_not_B <= 1'b0;
			end
			
		end
		
	end
	
	
endmodule
	