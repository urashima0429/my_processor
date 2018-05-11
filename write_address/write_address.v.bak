module write_address(
	input [1:0] op1,
	input [2:0] Rd_Rb, Ra,
	output reg [2:0] write_add);
	
	always @* begin
		case (op1)
			0: write_add <= Ra;
			1: write_add <= Rd_Rb; // don't care
			2: write_add <= Rd_Rb;
			3: write_add <= Rd_Rb;
			default: write_add <= Rd_Rb;
		endcase
	end
		
endmodule	
	