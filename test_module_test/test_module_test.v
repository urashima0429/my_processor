module test_module_test(
	input clock, reset, exec,
	output reg [7:0] display1, display2, display3,
	output reg selecter);

	
	function [7:0] adjustSevenSegment3_8;
        input [2:0] a;
        begin
                case (a)
                        3'b0000:        adjustSevenSegment3_8 = 8'b11111100;
                        3'b0001:        adjustSevenSegment3_8 = 8'b01100000;
                        3'b0010:        adjustSevenSegment3_8 = 8'b11011010;
                        3'b0011:        adjustSevenSegment3_8 = 8'b11110010;
                        3'b0100:        adjustSevenSegment3_8 = 8'b01100110;
								default:			 adjustSevenSegment3_8 = 8'b11111111;
                endcase
        end
   endfunction
	
	function [7:0] adjustSevenSegment1_8;
        input a;
        begin
                case (a)
                        1'b00:        	adjustSevenSegment1_8 = 8'b11111100;
                        1'b01:        	adjustSevenSegment1_8 = 8'b01100000;
								default:			adjustSevenSegment1_8 = 8'b11111111;
                endcase
        end
   endfunction
	
	
	
	
	wire [2:0] phaseIn, phasePass, phaseOut;
	wire register_reset, p1, p2, p3, p4, p5;
	
	assign phasePass = phaseOut;
	assign phaseIn = phasePass;
	
	phase_counter phase_counter(clock, reset, phaseOut);
	control_unit control_unit(clock, reset, exec, phaseIn, register_reset, p1, p2, p3, p4, p5);

	always @* begin
		display1 = adjustSevenSegment3_8(phaseOut);
		display2 = adjustSevenSegment1_8(p1);
		display3 = adjustSevenSegment1_8(register_reset);
	end
	
	initial begin
		selecter <= 1'b1;
	end
	
endmodule