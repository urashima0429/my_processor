module proseccor(
	input [15:0] in,
	input clock, reset, exec,
	output [15:0] out);
	
	// define wire and reg
	// control unit
	wire [2:0] phase;
	wire p1, p2, p3, p4, p5;
	wire register_reset;
	// phase 1
	reg [15:0] PC_out;
	wire [15:0] plus1_out;
	// phase 2
	wire [15:0] inst_from_memory;
	reg [15:0] inst_to_decoder;
	wire [1:0] op1;
	wire [2:0] Rs_Ra_op2, Rd_Rb_cond;
	wire [3:0] op3_dFront, dBack;
	wire [15:0] readData1, readData2;
	// phase 3
	reg [15:0] 
	
	
	// main
	// control unit
	phase_counter PhaC(.clock(clock), .reset(reset), .phase(phase[2:0]));
	control_unit CU(.clock(clock), .reset(reset), .exec(exec), .phase(phase[2:0]), .register_reset(register_reset), .p1(p1), .p2(p2), .p3(p3), .p4(p4), p5(p5));
	
	// phase 1
	program_counter ProC(.p1(p1), .reset(reset), .in(), .out(PC_out[15:0])); // in is not defined. to do.
	adder_for_program_counter plus1(.in(PC_out[15:0]), .out(plus1_out[15:0]));
	
	// phase 2
	instruction_register IR(.p2(p2), .reset(reset), .clock(clock), .inst_from_memory(inst_from_memory[15:0]), .inst_to_decoder(inst_to_decoder[15:0]));
	decoder DC(.in(inst_to_decoder[15:0]), .op1(op1), .Rs_Ra_op2(Rs_Ra_op2), .Rd_Rb_cond(Rd_Rb_cond), .op3_dFront(op3_dFront), .dBack(dBack));
	regfile RF(.writeOder(), .readAddr1(Rs_Ra_op2), .readAddr2(Rd_Rb_cond), .writeAddr(), .writeDara(), .readData1(readData1), .readDara2(readData2)); // writeOrder and writeAddr and writeData are not defined. to do.
	
	// phase 3
	BR br0(.p3(p3), .reset(reset), .clock(clock), .data_from_regifile(readData1), .data_to_ALU());
	
	