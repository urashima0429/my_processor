module adjust_seven_segment (
        input [3:0] in,
        output selecter,
        output [7:0] out );
         
        function [7:0] b;
        input [3:0] a;
        begin
                case (a)
                        4'b0000:        b = 8'b11111100;
                        4'b0001:        b = 8'b01100000;
                        4'b0010:        b = 8'b11011010;
                        4'b0011:        b = 8'b11110010;
                        4'b0100:        b = 8'b01100110;
                        4'b0101:        b = 8'b10110110;
                        4'b0110:        b = 8'b10111110;
                        4'b0111:        b = 8'b11100000;
                        4'b1000:        b = 8'b11111110;
                        4'b1001:        b = 8'b11110110;
                        4'b1010:        b = 8'b11101110;
                        4'b1011:        b = 8'b00111110;
                        4'b1100:        b = 8'b00011010;
                        4'b1101:        b = 8'b01111010;
                        4'b1110:        b = 8'b10011110;
                        4'b1111:        b = 8'b10001110;
                endcase
        end
        endfunction
        
        assign selecter = 1'b0;
        assign out = b(in);
        
endmodule
