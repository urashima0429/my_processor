module data_selecter (
	input [15:0] data0, data1,
	input order,
	output reg [15:0] out);
	
	always @* begin
		if(order == 1'b0) begin
			out <= data0;
		end else begin
			out <= data1;
		end
	end

endmodule
