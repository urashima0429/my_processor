module ALU (
	input [15:0] in1, in2, // in1 = Rd = Rb = PC + 1, in2 = Rs = sign_ext(d)
	input [3:0] opcode, d,
	input [1:0] op1,
	input [2:0] op2, cond,
	input S_in, Z_in, C_in, V_in, 
	output reg [15:0] out, // out = in2 = Rd
	output reg S, Z, C, V,
	output reg HLT);

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
			7: S_value = S_in; // don't care!!
			8: S_value = SLL_result[15];
			9: S_value = SLR_result[15];
			10: S_value = SRL_result[15];
			11: S_value = SRR_result[15];
			12: S_value = S_in;
			13: S_value = S_in;
			14: S_value = S_in; // don't care!!
			15: S_value = S_in;
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
			7: Z_value = Z_in; // don't care!!
			8: Z_value = ((Rs << d) == 16'b0000000000000000);
			9: Z_value = (((Rs << d) | (Rs >> 16 - d)) == 16'b0000000000000000);
			10: Z_value = ((Rs >> d) == 16'b0000000000000000);
			11: Z_value = SRR(Rs, d);//(((Rs >> d) | {in2[15], 15'b000000000000000}) == 16'b0000000000000000);
			12: Z_value = Z_in;
			13: Z_value = Z_in;
			14: Z_value = Z_in; // don't care!!
			15: Z_value = Z_in;
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
				7: C_value = C_in; // don't care!!
				8: C_value = 1'b0;
				9: C_value = 1'b0;
				10: C_value = 1'b0;
				11: C_value = 1'b0;
				12: C_value = C_in; // don't care?
				13: C_value = C_in; // don't care?
				14: C_value = C_in; // don't care!!
				15: C_value = C_in; // don't care?
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
				7: C_value = C_in; // don't care!!
				8: C_value = in2[15-d+1];
				9: C_value = 1'b0;
				10: C_value = in2[d-1];
				11: C_value = in2[d-1];
				12: C_value = C_in; // don't care?
				13: C_value = C_in; // don't care?
				14: C_value = C_in; // don't care!!
				15: C_value = C_in; // don't care?
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
			7: V_value = V_in; // don't care!!
			8: V_value = 1'b0;
			9: V_value = 1'b0;
			10: V_value = 1'b0;
			11: V_value = 1'b0;
			12: V_value = V_in;
			13: V_value = V_in;
			14: V_value = V_in; // don't care!!
			15: V_value = V_in;
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
	
	
	
	always @* begin
		if(op1 == 2'b11) begin
			out = out_value(in1, in2, d);
			S = S_value(in1, in2, d);
			Z = Z_value(in1, in2, d);
			C = C_value(in1, in2, d);
			V = V_value(in1, in2, d);
			HLT = HLT_value(opcode);
		end else if(op1 == 2'b10) begin
			if(op2 == 3'b100) begin
				out = in1 + in2;
				S = S_in;
				Z = Z_in;
				C = C_in;
				V = V_in;
				HLT = 1'b0;
			end else if(op2 == 3'b111) begin
				if(cond == 3'b000) begin
					if(Z_in == 1'b1) begin
						out = in1 + in2;
						S = S_in;
						Z = Z_in;
						C = C_in;
						V = V_in;
						HLT = 1'b0;
					end else begin
						out = in1;
						S = S_in;
						Z = Z_in;
						C = C_in;
						V = V_in;
						HLT = 1'b0;
					end
				end else if(cond == 3'b001) begin
					if(S_in ^ Z_in == 1'b1) begin
						out = in1 + in2;
						S = S_in;
						Z = Z_in;
						C = C_in;
						V = V_in;
						HLT = 1'b0;
					end else begin
						out = in1;
						S = S_in;
						Z = Z_in;
						C = C_in;
						V = V_in;
						HLT = 1'b0;
					end
				end else if(cond == 3'b010) begin
					if(Z_in || (S_in ^ V_in) == 1'b1) begin
						out = in1 + in2;
						S = S_in;
						Z = Z_in;
						C = C_in;
						V = V_in;
						HLT = 1'b0;
					end else begin
						out = in1;
						S = S_in;
						Z = Z_in;
						C = C_in;
						V = V_in;
						HLT = 1'b0;
					end
				end else begin
					if(Z_in == 1'b0) begin
						out = in1 + in2;
						S = S_in;
						Z = Z_in;
						C = C_in;
						V = V_in;
						HLT = 1'b0;
					end else begin
						out = in1;
						S = S_in;
						Z = Z_in;
						C = C_in;
						V = V_in;
						HLT = 1'b0;
					end
				end
			end else begin
				out = in2;//in1
				S = S_in;
				Z = Z_in;
				C = C_in;
				V = V_in;
				HLT = 1'b0; 
			end
		end else begin
			out = in1 + in2;
			S = S_in;
			Z = Z_in;
			C = C_in;
			V = V_in;
			HLT = 1'b0;
		end
	end
		
	
endmodule
