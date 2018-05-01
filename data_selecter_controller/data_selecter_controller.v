module data_selecter_controller(
	input [15:0] op,
	output reg switch1, switch2, switch3, switch4, switch5, switch6);
	
	always @* begin
	
		if(op[15:14] == 2'b11) begin
		
			//Operation, input and output
			if (op[7:4] == 4'b1100) begin
				switch1 <= 0;
				switch2 <= 0;
				switch3 <= 0;
				switch4 <= 1;
				switch5 <= 0;
				switch6 <= 0;
			end else begin
				switch1 <= 0;
				switch2 <= 0;
				switch3 <= 0;
				switch4 <= 0;
				switch5 <= 0;
				switch6 <= 0;
			end
			
		end else if (op[15:14] == 2'b10) begin
			//conditional branch
			if (op[13:11] == 3'b000) begin //if (op[13:11] == 3'b111) begin
				switch1 <= 0;//1
				switch2 <= 1;
				switch3 <= 1;
				switch4 <= 0;
				switch5 <= 1;
				switch6 <= 0;
			//Immediate load unconditional branch
			end else begin
				switch1 <= 1;
				switch2 <= 1;
				switch3 <= 1;
				switch4 <= 0;
				switch5 <= 1;
				switch6 <= 0;
			end
		
		//Load store
		end else if (op[15:14] == 2'b00) begin	
			switch1 <= 0;
			switch2 <= 0;
			switch3 <= 0;
			switch4 <= 0;
			switch5 <= 0;
			switch6 <= 0;
			
		end else if (op[15:14] == 2'b01) begin	
			switch1 <= 0;
			switch2 <= 0;
			switch3 <= 0;
			switch4 <= 0;
			switch5 <= 0;
			switch6 <= 1;
			
			
		end else begin
			switch1 <= 0;
			switch2 <= 0;
			switch3 <= 0;
			switch4 <= 0;
			switch5 <= 0;
			switch6 <= 0;
		end
		
	end
	
endmodule