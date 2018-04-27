module LED(
	input [15:0] in,
	input [1:0] op1,
	input [3:0] op3,
	output [31:0] out,
	output selecter); // if selecter is positive, then FLUSH!!
	
	function [7:0] decode4_8;
	input [3:0] a;
	begin
		if (op1 == 2'b11)begin
			if(op3 == 4'b1101) begin
				case (a)
					0: decode4_8 = 8'b11111100;
					1: decode4_8 = 8'b01100000;
					2: decode4_8 = 8'b11011010;
					3: decode4_8 = 8'b11110010;
					4: decode4_8 = 8'b01100110;
					5: decode4_8 = 8'b10110110;
					6: decode4_8 = 8'b10111110;
					7: decode4_8 = 8'b11100000;
					8: decode4_8 = 8'b11111110;
					9: decode4_8 = 8'b11110110;
					10: decode4_8 = 8'b11101110;
					11: decode4_8 = 8'b00111110;
					12: decode4_8 = 8'b00011010;
					13: decode4_8 = 8'b01111010;
					14: decode4_8 = 8'b10011110;
					15: decode4_8 = 8'b10001110;
					default: decode4_8 = 8'b11111100;
				endcase
			end
		end else begin
			decode4_8 = 8'b00000000;
		end
	end
	endfunction	
	
	assign out = {decode4_8(in[15:12]), decode4_8(in[11:8]), decode4_8(in[7:4]), decode4_8(in[3:0])};
	assign selecter = 1'b1;
	
endmodule
	