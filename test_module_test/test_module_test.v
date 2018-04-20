module test_module_test(
	input clock, reset, exec,
	output reg [7:0] display1, display2, display3, display4, display5, display6, display7, display8,
	output reg selecter);

	function [7:0] adjustSevenSegment4_8;
        input [3:0] a;
        begin
                case (a)
                        4'b0000:        adjustSevenSegment4_8 = 8'b11111100;
                        4'b0001:        adjustSevenSegment4_8 = 8'b01100000;
                        4'b0010:        adjustSevenSegment4_8 = 8'b11011010;
                        4'b0011:        adjustSevenSegment4_8 = 8'b11110010;
                        4'b0100:        adjustSevenSegment4_8 = 8'b01100110;
                        4'b0101:        adjustSevenSegment4_8 = 8'b10110110;
                        4'b0110:        adjustSevenSegment4_8 = 8'b10111110;
                        4'b0111:        adjustSevenSegment4_8 = 8'b11100000;
                        4'b1000:        adjustSevenSegment4_8 = 8'b11111110;
                        4'b1001:        adjustSevenSegment4_8 = 8'b11110110;
                        4'b1010:        adjustSevenSegment4_8 = 8'b11101110;
                        4'b1011:        adjustSevenSegment4_8 = 8'b00111110;
                        4'b1100:        adjustSevenSegment4_8 = 8'b00011010;
                        4'b1101:        adjustSevenSegment4_8 = 8'b01111010;
                        4'b1110:        adjustSevenSegment4_8 = 8'b10011110;
                        4'b1111:        adjustSevenSegment4_8 = 8'b10001110;
								default:			 adjustSevenSegment4_8 = 8'b10010010;
                endcase
        end
        endfunction
	
	function [7:0] adjustSevenSegment3_8;
        input [2:0] a;
        begin
                case (a)
                        3'b0000:        adjustSevenSegment3_8 = 8'b11111100;
                        3'b0001:        adjustSevenSegment3_8 = 8'b01100000;
                        3'b0010:        adjustSevenSegment3_8 = 8'b11011010;
                        3'b0011:        adjustSevenSegment3_8 = 8'b11110010;
                        3'b0100:        adjustSevenSegment3_8 = 8'b01100110;
								3'b0101:        adjustSevenSegment3_8 = 8'b10110110;
                        3'b0110:        adjustSevenSegment3_8 = 8'b10111110;
                        3'b0111:        adjustSevenSegment3_8 = 8'b11100000;
								default:			 adjustSevenSegment3_8 = 8'b10010010;
                endcase
        end
   endfunction
	
	function [7:0] adjustSevenSegment2_8;
        input [1:0] a;
        begin
                case (a)
                        2'b000:        adjustSevenSegment2_8 = 8'b11111100;
                        2'b001:        adjustSevenSegment2_8 = 8'b01100000;
                        2'b010:        adjustSevenSegment2_8 = 8'b11011010;
                        2'b011:        adjustSevenSegment2_8 = 8'b11110010;
								default:			adjustSevenSegment2_8 = 8'b10010010;
                endcase
        end
   endfunction
	
	function [7:0] adjustSevenSegment1_8;
        input a;
        begin
                case (a)
                        1'b00:        	adjustSevenSegment1_8 = 8'b11111100;
                        1'b01:        	adjustSevenSegment1_8 = 8'b01100000;
								default:			adjustSevenSegment1_8 = 8'b10010010;
                endcase
        end
   endfunction
	
	
	
	
	
	/*
		add module to test from here
	*/
			wire [2:0] phaseIn, phasePass, phaseOut;
			wire register_reset, p1, p2, p3, p4, p5;
			
			assign phasePass = phaseOut;
			assign phaseIn = phasePass;
			
			phase_counter phase_counter(clock, reset, phaseOut);
			control_unit control_unit(clock, reset, exec, phaseIn, register_reset, p1, p2, p3, p4, p5);

	
	
	/* 
	
	*/
	
	
	
	
	
	
	
	//add parameter to check
	always @* begin
		display1 = adjustSevenSegment3_8(phaseIn);
		display2 = adjustSevenSegment3_8(phaseIn);
		display3 = adjustSevenSegment1_8(p1);
		display4 = adjustSevenSegment1_8(register_reset);
		display5 = adjustSevenSegment3_8(phaseIn);
		display6 = adjustSevenSegment3_8(phaseIn);
		display7 = adjustSevenSegment3_8(phaseIn);
		display8 = adjustSevenSegment3_8(phaseIn);
	end
	
	initial begin
		selecter <= 1'b1;
	end
	
endmodule