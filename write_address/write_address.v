module write_address(
	input [1:0] op1,
	input [2:0] Rd_Rb, Ra_op2,
	input [3:0] op3,
	//input [2:0] phase,
	output reg [2:0] write_add,
	output reg writeOrder);
	
	always @* begin
		case (op1)
			0: write_add <= Ra_op2;
			1: write_add <= Rd_Rb; // don't care
			2: write_add <= Rd_Rb;
			3: write_add <= Rd_Rb;
			default: write_add <= Rd_Rb;
		endcase
		
		/*
		if(phase == 3'b100)begin
			if(op1 == 2'b11) begin
				case (op3)
					0: writeOrder <= 1'b1;
					1: writeOrder <= 1'b1;
					2: writeOrder <= 1'b1;
					3: writeOrder <= 1'b1;
					4: writeOrder <= 1'b1;
					5: writeOrder <= 1'b1;
					6: writeOrder <= 1'b1;
					7: writeOrder <= 1'b0;
					8: writeOrder <= 1'b1;
					9: writeOrder <= 1'b1;
					10: writeOrder <= 1'b1;
					11: writeOrder <= 1'b1;
					12: writeOrder <= 1'b1;
					13: writeOrder <= 1'b0;
					14: writeOrder <= 1'b0;
					15: writeOrder <= 1'b0;
					default: writeOrder <= 1'b0;
				endcase
			end else if(op1 == 2'b10) begin
				if(Ra_op2 == 3'b000) begin
					writeOrder <= 1'b1;
				end else begin
					writeOrder <= 1'b0;
				end
			end else begin
				writeOrder <= 1'b1;
			end
		end else begin
			writeOrder <= 1'b0;
		end*/
		
		
		if(op1 == 2'b11) begin
			case (op3)
				0: writeOrder <= 1'b1;
				1: writeOrder <= 1'b1;
				2: writeOrder <= 1'b1;
				3: writeOrder <= 1'b1;
				4: writeOrder <= 1'b1;
				5: writeOrder <= 1'b1;
				6: writeOrder <= 1'b1;
				7: writeOrder <= 1'b0;
				8: writeOrder <= 1'b1;
				9: writeOrder <= 1'b1;
				10: writeOrder <= 1'b1;
				11: writeOrder <= 1'b1;
				12: writeOrder <= 1'b1;
				13: writeOrder <= 1'b0;
				14: writeOrder <= 1'b0;
				15: writeOrder <= 1'b0;
				default: writeOrder <= 1'b0;
			endcase
		end else if(op1 == 2'b10) begin
			if(Ra_op2 == 3'b000) begin
				writeOrder <= 1'b1;
			end else begin
				writeOrder <= 1'b0;
			end
		end else begin
			writeOrder <= 1'b1;
		end
		
	end
		
endmodule	
	