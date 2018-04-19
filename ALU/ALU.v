module ALU (
	input [15:0] in1, in2,
	output [15:0] out);
	
	assign out = in1 + in2;
	
endmodule




/* to do
module ALU (
	input [15:0] in1, in2, // in1 = Rd, in2 = Rs
	input [3:0] opcode, d,
	input [3:0] IN,
	output [15:0] out, // out = in2
	output S, Z, C, V,
	output [7:0] OUT,
	output HLT);
	
	case (opcode) // define out value
		0: out = in1 + in2; // add
		1: out = in1 - in2; // sub
		2: out = in1 & in2; // and
		3: out = in1 | in2; // or
		4: out = in1 ^ in2; // xor
		5: out = in1;
		6: out = in2;
		7: out = in1; // don't care?
		8: out = // SLL
		9: out = // SLR
		10: out = // SRL //shift = '>>'
		11: out = // SRR
		12: out = IN;
		13: out = in1; // don't care?
		14: out = in1; // don't care?
		15: out = in1; // don't care?
		default: out = in1;
	endcase
*/
	