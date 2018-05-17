module code_regi (
	input clock, 
	input reset, 
	input [1:0] op1_in,
	input [2:0] Rs_Ra_op2_in, Rd_Rb_cond_in,
	input [3:0] op3_dFront_in, dBack_in,
	output reg [1:0] op1_out,
	output reg [2:0] Rs_Ra_op2_out, Rd_Rb_cond_out,
	output reg [3:0] op3_dFront_out, dBack_out);
	
	always @(posedge clock or negedge reset) begin
		if (reset == 1'b0) begin
			op1_out <= 2'b00;
			Rs_Ra_op2_out <= 3'b000;
			Rd_Rb_cond_out <= 3'b000;
			op3_dFront_out <= 4'b0000;
			dBack_out <= 4'b0000;
		end else if (clock == 1'b1) begin
			op1_out <= op1_in;
			Rs_Ra_op2_out <= Rs_Ra_op2_in;
			Rd_Rb_cond_out <= Rd_Rb_cond_in;
			op3_dFront_out <= op3_dFront_in;
			dBack_out <= dBack_in;
		end
	end
	
endmodule
