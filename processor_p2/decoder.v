module decoder (
	input [15:0] in,
	output [1:0] op1,
	output [2:0] Rs_Ra_op2, Rd_Rb_cond,
	output [3:0] op3_dFront, dBack);
	
	assign op1 = in[15:14];
	assign Rs_Ra_op2 = in[13:11];
	assign Rd_Rb_cond = in[10:8];
	assign op3_dFront = in[7:4];
	assign dBack = in[3:0];
	
endmodule

/*
module decoder (
        input [15:0]   in,
        output [1:0]  op1, 
        output [2:0]  op2, 
        output [3:0]  op3, 
        output [3:0]   Ra, 
        output [3:0]   Rs, 
        output [3:0]   Rd, 
        output [3:0]   Rb, 
        output [7:0]    d, 
        output [2:0] cond);
        
        
        
//      begin
//              //calculation or input/output operation
//			  case(in[15:14]) 
//						 2'b11:  
//									op1 <= in[15:14];
//									op2 <= 0;
//									op3 <= in[ 7: 4];
//									Ra  <= 0;
//									Rs  <= in[13:11];
//									Rd  <= in[10: 8];
//									Rb  <= 0;
//									d   <= in[ 7: 0];
//									cond<= 0;
//									
//						 2'b10:
//									//branch conditionally
//									if(in[13:11] == 3'b111) begin
//											  op1 <= in[15:14];
//											  op2 <= in[13:11];
//											  op3 <= 0;
//											  Ra  <= 0;
//											  Rs  <= 0;
//											  Rd  <= 0;
//											  Rb  <= 0;
//											  d   <= in[7:0];
//											  cond<= in[10:8];
//											  
//									//load immediatete or branch unconditionally
//									end else begin 
//											  op1 <= in[15:14];
//											  op2 <= in[13:11];
//											  op3 <= 0;
//											  Ra  <= 0;
//											  Rs  <= 0;
//											  Rd  <= 0;
//											  Rb  <= in[10: 8];
//											  d   <= in[ 7: 0];
//											  cond<= 0;
//											  
//									end
//						 
//						 //load or store operation
//						 2'b01:
//									op1 <= in[15:14];
//									op2 <= 0;
//									op3 <= 0;
//									Ra  <= in[13:11];
//									Rs  <= 0;
//									Rd  <= 0;
//									Rb  <= in[10: 8];
//									d   <= in[ 7: 0];
//									cond<= 0;
//									
//						 //load or store operation
//						 2'b00:
//									op1 <= in[15:14];
//
//									op2 <= 0;
//									op3 <= 0;
//									Ra  <= in[13:11];
//									Rs  <= 0;
//									Rd  <= 0;
//									Rb  <= in[10: 8];
//									d   <= in[ 7: 0];
//									cond<= 0;
//			  
//			end
//		end
endmodule

*/