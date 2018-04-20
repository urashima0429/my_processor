module regfile (
	input writeOrder, // if (writeOrder == 1'b1) then p5 (write) else p2 (read)
	input [2:0] readAddr1, readAddr2, writeAddr,
	input [15:0] writeData,
	output [15:0] readData1, readData2);
	
	reg [15:0] r [0:7]; // seven registers
	
	always begin
		if (writeOrder == 1'b1) begin
			r[writeAddr] <= writeData;
		end
	end
	
	assign readData1 = r[readAddr1];
	assign readData2 = r[readAddr2];

endmodule
