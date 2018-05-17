module IDEX_regi (
	input clock, 
	input reset, 
	input sw1_in, sw2_in, sw3_in, sw4_in, sw5_in, sw6_in, sw7_in, writeOrder_in,
	output reg sw1_out, sw2_out, sw3_out, sw4_out, sw5_out, sw6_out, sw7_out, writeOrder_out);
	
	always @(posedge clock or negedge reset) begin
		if (reset == 1'b0) begin
			sw1_out <= 1'b0;
			sw2_out <= 1'b0;
			sw3_out <= 1'b0;
			sw4_out <= 1'b0;
			sw5_out <= 1'b0;
			sw6_out <= 1'b0;
			sw7_out <= 1'b0; 
			writeOrder_out <= 1'b0;
		end else if (clock == 1'b1) begin
			sw1_out <= sw1_in;
			sw2_out <= sw2_in;
			sw3_out <= sw3_in;
			sw4_out <= sw4_in;
			sw5_out <= sw5_in;
			sw6_out <= sw6_in;
			sw7_out <= sw7_in;
			writeOrder_out <= writeOrder_in;
		end
	end
	
endmodule
