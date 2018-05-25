module data_selecter_controller(
	input [15:0] op,
	output reg switch1, switch2, switch3, switch4, switch5, switch6, switch7, writeOrder);
	
	always @* begin
	
		if(op[15:14] == 2'b11) begin
		
			//Operation, input and output
			if (op[7:4] == 4'b1100) begin
				switch1 <= 0;
				switch2 <= 0;
				switch3 <= 0;
				switch4 <= 1;
				switch5 <= 1;
				switch6 <= 0;
				switch7 <= 0;
			end else begin
				switch1 <= 0;
				switch2 <= 0;
				switch3 <= 0;
				switch4 <= 0;
				switch5 <= 0;
				switch6 <= 0;
				switch7 <= 0;
			end
			
		end else if (op[15:14] == 2'b10) begin
			//conditional branch
			if (op[13:11] == 3'b000) begin 
				switch1 <= 0;
				switch2 <= 0; // don't care?
				switch3 <= 1;
				switch4 <= 0;
				switch5 <= 0;
				switch6 <= 0;
				switch7 <= 0;
			end else if (op[13:11] == 3'b001) begin
				switch1 <= 0;
				switch2 <= 0; 
				switch3 <= 1;
				switch4 <= 0;
				switch5 <= 0;
				switch6 <= 0;
				switch7 <= 0;
			end else if(op[13:11] == 3'b010) begin
				switch1 <= 0;
				switch2 <= 0; 
				switch3 <= 1;
				switch4 <= 0;
				switch5 <= 0;
				switch6 <= 0;
				switch7 <= 0;
			end else if (op[13:11] == 3'b101) begin
				switch1 <= 1;
				switch2 <= 0; 
				switch3 <= 1;
				switch4 <= 0;
				switch5 <= 0;
				switch6 <= 0;
				switch7 <= 0;
			end else if (op[13:11] == 3'b110) begin
				switch1 <= 1;
				switch2 <= 1; 
				switch3 <= 1;
				switch4 <= 0;
				switch5 <= 0;
				switch6 <= 0;
				switch7 <= 1;			
			//Immediate load unconditional branch
			end else begin
				switch1 <= 1;
				switch2 <= 1;
				switch3 <= 1;
				switch4 <= 0;
				switch5 <= 0;
				switch6 <= 0;
				switch7 <= 0;
			end
		
		//Load store
		end else if (op[15:14] == 2'b00) begin	
			switch1 <= 0;
			switch2 <= 0;
			switch3 <= 1;
			switch4 <= 0;
			switch5 <= 1;
			switch6 <= 0;
			switch7 <= 0;
			
		end else if (op[15:14] == 2'b01) begin	
			switch1 <= 0;
			switch2 <= 0;
			switch3 <= 1;
			switch4 <= 0;
			switch5 <= 0;
			switch6 <= 1;
			switch7 <= 0;
			
			
		end else begin
			switch1 <= 0;
			switch2 <= 0;
			switch3 <= 0;
			switch4 <= 0;
			switch5 <= 0;
			switch6 <= 0;
			switch7 <= 0;
		end
		
		if(op[15:14] == 2'b11) begin
			case (op[7:4])
				0: writeOrder <= 1'b1;
				1: writeOrder <= 1'b1;
				2: writeOrder <= 1'b1;
				3: writeOrder <= 1'b1;
				4: writeOrder <= 1'b1;
				5: writeOrder <= 1'b0;//1'b1;
				6: writeOrder <= 1'b1;
				7: writeOrder <= 1'b0;
				8: writeOrder <= 1'b1;
				9: writeOrder <= 1'b1;
				10: writeOrder <= 1'b1;
				11: writeOrder <= 1'b1;
				12: writeOrder <= 1'b1;
				13: writeOrder <= 1'b0;
				14: writeOrder <= 1'b0;
				15: writeOrder <= 1'b0;
				default: writeOrder <= 1'b0;
			endcase
		end else if(op[15:14] == 2'b10) begin
			if(op[13:11] == 3'b000) begin
				writeOrder <= 1'b1;
			end else if (op[13:11] == 3'b001) begin
				writeOrder <= 1'b1;
			end else if (op[13:11] == 3'b010) begin
				writeOrder <= 1'b1;
			end else if (op[13:11] == 3'b101) begin
				writeOrder <= 1'b0;
			end else if (op[13:11] == 3'b110) begin
				writeOrder <= 1'b1;
			end else begin
				writeOrder <= 1'b0;
			end
		end else begin
			writeOrder <= 1'b1;
		end
		
	end
	
endmodule
