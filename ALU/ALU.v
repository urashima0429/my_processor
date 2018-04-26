module ALU (
	input [15:0] in1, in2, // in1 = Rd, in2 = Rs
	input [3:0] opcode, d,
	output [15:0] out, // out = in2 = Rd
	output S, Z, C, V,
	output HLT);

	wire [16:0] plus_result = {in1[15], in1} + {in2[15], in2};
	wire [16:0] minus_result = {in1[15], in1} - {in2[15], in2};
	
	wire [15:0] SLL_result = (in2 << d);
	wire [15:0] SLR_result = (in2 << d) | (in2 >> 16 - d);
	wire [15:0] SRL_result = (in2 >> d);
	wire [15:0] SRR_result = SRR(in2, d);
	
	
	function [15:0] SRR;
	input [15:0] a;
	input [3:0] d;
	begin
		if(d[0] == 1'b1) begin
			SRR = {a[15], a[15:1]};
		end else begin
			SRR = a;
		end
		if(d[1] == 1'b1) begin
			SRR = {{2{SRR[15]}}, SRR[15:2]};
		end else begin
			SRR = SRR;
		end
		if(d[2] == 1'b1) begin
			SRR = {{4{SRR[15]}}, SRR[15:4]};
		end else begin
			SRR = SRR;
		end
		if(d[3] == 1'b1)begin
			SRR = {{8{SRR[15]}}, SRR[15:8]};
		end else begin
			SRR = SRR;
		end
	end
	endfunction
	
	function [15:0] out_value; // define out value
	input [15:0] Rd, Rs;
	input [3:0] d;
	begin
		case (opcode) 
			0: out_value = Rd + Rs; // add
			1: out_value = Rd - Rs; // sub
			2: out_value = Rd & Rs; // and
			3: out_value = Rd | Rs; // or
			4: out_value = Rd ^ Rs; // xor
			5: out_value = 16'b0000000000000000; // don't care?
			6: out_value = Rs;
			7: out_value = 16'b0000000000000000; // don't care!!
			8: out_value = (Rs << d); // SLL
			9: out_value = (Rs << d) | (Rs >> 16 - d); // SLR
			10: out_value = (Rs >> d); // SRL
			11: out_value = SRR(Rs, d);//(Rs >> d) | {in2[15], 15'b000000000000000}; // SRR
			12: out_value = 16'b0000000000000000; //don't care?
			13: out_value = 16'b0000000000000000; // don't care?
			14: out_value = 16'b0000000000000000; // don't care!!
			15: out_value = 16'b0000000000000000; // don't care?
			default: out_value = 16'b0000000000000000;
		endcase
	end
	endfunction
	
	function S_value; //define S value
	input [15:0] Rd, Rs;
	input [3:0] d;
	begin
		case (opcode)
			0: S_value = plus_result[16];
			1: S_value = minus_result[16];
			2: S_value = Rd[15] & Rs[15];
			3: S_value = Rd[15] | Rs[15];
			4: S_value = Rd[15] ^ Rs[15];
			5: S_value = minus_result[16];
			6: S_value = Rd[15];
			7: S_value = 1'b0; // don't care!!
			8: S_value = SLL_result[15];
			9: S_value = SLR_result[15];
			10: S_value = SRL_result[15];
			11: S_value = SRR_result[15];
			12: S_value = 1'b0;
			13: S_value = 1'b0;
			14: S_value = 1'b0; // don't care!!
			15: S_value = 1'b0;
			default: S_value = 1'b0;
		endcase
	end
	endfunction
	
	function Z_value; //define Z value
	input [15:0] Rd, Rs;
	input [3:0] d; 
	begin
		case (opcode)
			0: Z_value = ((Rd + Rs) ==  16'b0000000000000000);
			1: Z_value = ((Rd - Rs) ==  16'b0000000000000000);
			2: Z_value = ((Rd & Rs) == 16'b0000000000000000);
			3: Z_value = ((Rd | Rs) == 16'b0000000000000000);
			4: Z_value = ((Rd ^ Rs) == 16'b0000000000000000);
			5: Z_value = ((Rd - Rs) ==  16'b0000000000000000);
			6: Z_value = (Rd == 16'b0000000000000000);
			7: Z_value = 1'b0; // don't care!!
			8: Z_value = ((Rs << d) == 16'b0000000000000000);
			9: Z_value = (((Rs << d) | (Rs >> 16 - d)) == 16'b0000000000000000);
			10: Z_value = ((Rs >> d) == 16'b0000000000000000);
			11: Z_value = SRR(Rs, d);//(((Rs >> d) | {in2[15], 15'b000000000000000}) == 16'b0000000000000000);
			12: Z_value = 1'b0;
			13: Z_value = 1'b0;
			14: Z_value = 1'b0; // don't care!!
			15: Z_value = 1'b0;
			default: Z_value = 1'b0;
		endcase
	end
	endfunction
	
	function C_value; //define C value
	input [15:0] Rd, Rs;
	input [3:0] d;
	begin
		if(d == 4'b0000)begin
			case (opcode) 
				0: C_value = plus_result[16] ^ plus_result[15];
				1: C_value = minus_result[16] ^ minus_result[15];
				2: C_value = 1'b0;
				3: C_value = 1'b0;
				4: C_value = 1'b0;
				5: C_value = minus_result[16] ^ minus_result[15];
				6: C_value = 1'b0;
				7: C_value = 1'b0; // don't care!!
				8: C_value = 1'b0;
				9: C_value = 1'b0;
				10: C_value = 1'b0;
				11: C_value = 1'b0;
				12: C_value = 1'b0; // don't care?
				13: C_value = 1'b0; // don't care?
				14: C_value = 1'b0; // don't care!!
				15: C_value = 1'b0; // don't care?
				default: C_value = 1'b0;
			endcase
		end else begin
			case (opcode) 
				0: C_value = plus_result[16] ^ plus_result[15];
				1: C_value = minus_result[16] ^ minus_result[15];
				2: C_value = 1'b0;
				3: C_value = 1'b0;
				4: C_value = 1'b0;
				5: C_value = minus_result[16] ^ minus_result[15];
				6: C_value = 1'b0;
				7: C_value = 1'b0; // don't care!!
				8: C_value = in2[15-d+1];
				9: C_value = 1'b0;
				10: C_value = in2[d-1];
				11: C_value = in2[d-1];
				12: C_value = 1'b0; // don't care?
				13: C_value = 1'b0; // don't care?
				14: C_value = 1'b0; // don't care!!
				15: C_value = 1'b0; // don't care?
				default: C_value = 1'b0;
			endcase
		end
	end
	endfunction
	
	function V_value; //define V value
	input [15:0] Rd, Rs;
	input [3:0] d; 
	begin
		case (opcode)
			0: V_value = plus_result[16] ^ plus_result[15]; 
			1: V_value = minus_result[16] ^ minus_result[15];
			2: V_value = 1'b0;
			3: V_value = 1'b0;
			4: V_value = 1'b0;
			5: V_value = minus_result[16] ^ minus_result[15];
			6: V_value = 1'b0;
			7: V_value = 1'b0; // don't care!!
			8: V_value = 1'b0;
			9: V_value = 1'b0;
			10: V_value = 1'b0;
			11: V_value = 1'b0;
			12: V_value = 1'b0;
			13: V_value = 1'b0;
			14: V_value = 1'b0; // don't care!!
			15: V_value = 1'b0;
			default: V_value = 1'b0;
		endcase
	end
	endfunction
	
	function HLT_value; //define HLT value
	input [3:0] opcode;
	begin
		if(opcode == 4'b1111) begin
			HLT_value = 1'b1;
		end else begin
			HLT_value = 1'b0;
		end
	end
	endfunction
	
	assign out = out_value(in1, in2, d);
	assign S = S_value(in1, in2, d);
	assign Z = Z_value(in1, in2, d);
	assign C = C_value(in1, in2, d);
	assign V = V_value(in1, in2, d);
	assign HLT = HLT_value(opcode);
	
endmodule



/*
module ALU (
	input [15:0] in1, in2, // in1 = Rd, in2 = Rs
	input [3:0] opcode, d,
	input [15:0] switch_IN,
	output [15:0] out, // out = in2 = Rd
	output S, Z, C, V,
	output [7:0] LED_OUT,
	output HLT);
	
	wire [16:0] plus_result = {in1[15], in1} + {in2[15], in2};
	wire [16:0] minus_result = {in1[15], in1} - {in2[15], in2};
	
	function [15:0] out_value; // define out value
	input [15:0] Rd, Rs, switch_IN;
	input [3:0] d;
	begin
		case (opcode) 
			0: out_value = Rd + Rs; // add
			1: out_value = Rd - Rs; // sub
			2: out_value = Rd & Rs; // and
			3: out_value = Rd | Rs; // or
			4: out_value = Rd ^ Rs; // xor
			5: out_value = Rd; // don't care?
			6: out_value = Rs;
			7: out_value = Rd; // don't care!!
			8: out_value = (Rs << d); // SLL
			9: out_value = (Rs << d) | (Rs >> 15 - d); // SLR
			10: out_value = (Rs >> d); // SRL
			11: out_value = (Rs >>> d); // SRR
			12: out_value = switch_IN;
			13: out_value = Rd; // don't care?
			14: out_value = Rd; // don't care!!
			15: out_value = Rd; // don't care?
			default: out_value = Rd;
		endcase
	end
	endfunction
	
	function S_value; //define S value // henkana? to do
	input [15:0] Rd, Rs, switch_IN;
	input [3:0] d;
	begin
		case (opcode)
			0: S_value = plus_result[15];
			1: S_value = minus_result[15];
			2: S_value = 1'b0;
			3: S_value = 1'b0;
			4: S_value = 1'b0;
			5: S_value = minus_result[15];
			6: S_value = 1'b0;
			7: S_value = 1'b0; // don't care!!
			8: S_value = 1'b0;
			9: S_value = 1'b0;
			10: S_value = 1'b0;
			11: S_value = 1'b0;
			12: S_value = 1'b0;
			13: S_value = switch_IN[15];
			14: S_value = 1'b0; // don't care!!
			15: S_value = 1'b0;
			default: S_value = 1'b0;
		endcase
	end
	endfunction
		
	function Z_value; //define Z value
	input [15:0] Rd, Rs, switch_IN;
	input [3:0] d; 
	begin
		case (opcode)
			0: Z_value = ((Rd + Rs) ==  16'b0000000000000000);
			1: Z_value = ((Rd - Rs) ==  16'b0000000000000000);
			2: Z_value = ((Rd & Rs) == 16'b0000000000000000);
			3: Z_value = ((Rd | Rs) == 16'b0000000000000000);
			4: Z_value = ((Rd ^ Rs) == 16'b0000000000000000);
			5: Z_value = ((Rd - Rs) ==  16'b0000000000000000);
			6: Z_value = (Rs == 16'b0000000000000000);
			7: Z_value = 1'b0; // don't care!!
			8: Z_value = ((Rs << d) == 16'b0000000000000000);
			9: Z_value = (((Rs << d) | (Rs >> 15 - d)) == 16'b0000000000000000);
			10: Z_value = ((Rs >> d) == 16'b0000000000000000);
			11: Z_value = ((Rs >>> d) == 16'b0000000000000000);
			12: Z_value = (switch_IN == 16'b0000000000000000);
			13: Z_value = (Rs == 16'b0000000000000000);
			14: Z_value = 1'b0; // don't care!!
			15: Z_value = 1'b0;
			default: Z_value = 1'b0;
		endcase
	end
	endfunction
	
	function C_value; //define C value
	input [15:0] Rd, Rs;
	input [3:0] d;
	begin
		if(d == 4'b0000)begin
			case (opcode) 
				0: C_value = plus_result[16];
				1: C_value = minus_result[16];
				2: C_value = 1'b0;
				3: C_value = 1'b0;
				4: C_value = 1'b0;
				5: C_value = minus_result[16];
				6: C_value = 1'b0;
				7: C_value = 1'b0; // don't care!!
				8: C_value = 1'b0;
				9: C_value = 1'b0;
				10: C_value = 1'b0;
				11: C_value = 1'b0;
				12: C_value = 1'b0; // don't care?
				13: C_value = 1'b0; // don't care?
				14: C_value = 1'b0; // don't care!!
				15: C_value = 1'b0; // don't care?
				default: C_value = 1'b0;
			endcase
		end else begin
			case (opcode) 
				0: C_value = plus_result[16];
				1: C_value = minus_result[16];
				2: C_value = 1'b0;
				3: C_value = 1'b0;
				4: C_value = 1'b0;
				5: C_value = minus_result[16];
				6: C_value = 1'b0;
				7: C_value = 1'b0; // don't care!!
				8: C_value = in2[15-d+1];
				9: C_value = 1'b0;
				10: C_value = in2[d-1];
				11: C_value = in2[d-1];
				12: C_value = 1'b0; // don't care?
				13: C_value = 1'b0; // don't care?
				14: C_value = 1'b0; // don't care!!
				15: C_value = 1'b0; // don't care?
				default: C_value = 1'b0;
			endcase
		end
	end
	endfunction
	
	function V_value; //define V value
	input [15:0] Rd, Rs, switch_IN;
	input [3:0] d; 
	begin
		case (opcode)
			0: V_value = plus_result[16]; // 0 ~ 5 henkana? to do. 
			1: V_value = minus_result[16];
			2: V_value = 1'b0;
			3: V_value = 1'b0;
			4: V_value = 1'b0;
			5: V_value = minus_result[16];
			6: V_value = 1'b0;
			7: V_value = 1'b0; // don't care!!
			8: V_value = 1'b0;
			9: V_value = 1'b0;
			10: V_value = 1'b0;
			11: V_value = 1'b0;
			12: V_value = 1'b0;
			13: V_value = 1'b0;
			14: V_value = 1'b0; // don't care!!
			15: V_value = 1'b0;
			default: V_value = 1'b0;
		endcase
	end
	endfunction
	
	function [7:0] LED_OUT_value; //define LED_OUT value //only 1 bit?  //to do
	input [15:0] Rs;
	begin 
		if(opcode == 4'b1101) begin
			case (Rs)
				0: LED_OUT_value = 8'b11111100; // 0
				1: LED_OUT_value = 8'b01100000; // 1
				2: LED_OUT_value = 8'b11011010; // 2
				3: LED_OUT_value = 8'b11110010; // 3
				4: LED_OUT_value = 8'b01100110; // 4
				5: LED_OUT_value = 8'b10110110; // 5
				6: LED_OUT_value = 8'b10111110; // 6
				7: LED_OUT_value = 8'b11100000; // 7
				8: LED_OUT_value = 8'b11111110; // 8
				9: LED_OUT_value = 8'b11110110; // 9
				10: LED_OUT_value = 8'b11101110; // A
				11: LED_OUT_value = 8'b00111110; // B
				12: LED_OUT_value = 8'b00011010; // C
				13: LED_OUT_value = 8'b01111010; // D
				14: LED_OUT_value = 8'b10011110; // E
				15: LED_OUT_value = 8'b10001110; // F
				default: LED_OUT_value = 8'b11111100;
			endcase
		end else begin
			LED_OUT_value = 8'b00000000;
		end
	end
	endfunction
		
	function HLT_value; //define HLT value
	input [3:0] opcode;
	begin
		if(opcode == 4'b1111) begin
			HLT_value = 1'b1;
		end else begin
			HLT_value = 1'b0;
		end
	end
	endfunction
	
	assign out = out_value(in1, in2, switch_IN, d);
	assign S = S_value(in1, in2, switch_IN, d);
	assign Z = Z_value(in1, in2, switch_IN, d);
	assign C = C_value(in1, in2, d);
	assign V = V_value(in1, in2, switch_IN, d);
	assign LED_OUT = LED_OUT_value(in2);
	assign HLT = HLT_value(opcode);
	
endmodule
*/

/* 
module ALU ( //kari
	input [15:0] in1, in2,
	output [15:0] out);
	
	assign out = in1 + in2;
	
endmodule
*/