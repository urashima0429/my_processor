package sort;

public class sort {

	private static int num = 12; //1023
	private static int address = 7; //1025
	private static int size = 16;
	private static int R0 = 0;
	private static int R1 = 0;
	private static int R2 = 0;
	private static int R3 = 0; 
	private static int R4 = 0;
	private static int R5 = 0;
	private static int R6 = 0;
	private static final int R7 = 0;
	
	private static int[][] data = {
			{0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},//0
			{0,1,0,1,0,0,1,0,1,0,0,1,0,0,0,0},
			{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
			{1,1,0,0,0,0,0,0,0,0,0,0,1,0,1,0},
			{0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},//0
			{0,1,0,1,0,0,1,0,1,0,0,1,0,0,0,0},
			
			{0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
			{0,1,0,1,0,0,1,0,1,0,0,1,0,0,0,0},
			{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
			{1,1,0,0,0,0,0,0,0,0,0,0,1,0,1,0},
			{0,1,1,0,0,0,0,1,0,0,0,0,0,0,0,0},
			{0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0},
			{0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,1},
			{0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0},
			{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
			{0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0},
			{0,1,1,0,0,0,0,0,0,1,0,1,0,0,0,1},
			{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}//15
	};
	
	 public static void main(String args[]){
		 
		 //R4 =! 0
		 
		 R2 = num;//1023
		 R3 = address; //1025
		 R4 = R2 + R3 -1; //2047

		 
		 //R4 == 15
	
			 R5 = address - 1;
			 //R4 - R5 < 0
			 while(R5 < R4) {
				 
				 int R1[] = data[R5];
				 //SRL R1 15 < 0
				 if (R1[15] == 0) {
					 
					 R6 = R5;
					 
					 // R6 - R3 < 0 or
					 // LD R0 R6 11111111
					 // SLR R0 00001111
					 while (R6 > address -1 && data[R6-1][15] == 1) {
						 data[R6] = data[R6-1];
						 R6--;
					 }
					 
					 data[R6] = R1;
				 } 
				 R5 = R5 + 1;
			 }
			 
		 
		 
		 
		 //R4 == 14
			 R5 = address - 1;
			 //address + num -1 < R5
			 while(R5 < R4) {
				 
				 int R1[] = data[R5];
				 if (R1[14] == 0) {
					 
					 R6 = R5;
					 
					 while (R6 > address -1 && data[R6-1][14] == 1) {
						 data[R6] = data[R6-1];
						 R6--;
					 }
					 
					 data[R6] = R1;
				 } 
				 R5 = R5 + 1;
			 }
			 
		 //R4 == 13 
			 R5 = address - 1;
			 //address + num -1 < R5
			 while(R5 < R4) {
				 
				 int R1[] = data[R5];
				 if (R1[13] == 0) {
					 
					 R6 = R5;
					 
					 while (R6 > address -1 && data[R6-1][13] == 1) {
						 data[R6] = data[R6-1];
						 R6--;
					 }
					 
					 data[R6] = R1;
				 } 
				 R5 = R5 + 1;
			 }
			 
		 //R4 == 12			 
			 R5 = address - 1;
			 //address + num -1 < R5
			 while(R5 < R4) {
				 
				 int R1[] = data[R5];
				 if (R1[12] == 0) {
					 
					 R6 = R5;
					 
					 while (R6 > address -1 && data[R6-1][12] == 1) {
						 data[R6] = data[R6-1];
						 R6--;
					 }
					 
					 data[R6] = R1;
				 } 
				 R5 = R5 + 1;
			 }
		 
		 //R4 == 11 
			 R5 = address - 1;
			 //address + num -1 < R5
			 while(R5 < R4) {
				 
				 int R1[] = data[R5];
				 if (R1[11] == 0) {
					 
					 R6 = R5;
					 
					 while (R6 > address -1 && data[R6-1][11] == 1) {
						 data[R6] = data[R6-1];
						 R6--;
					 }
					 
					 data[R6] = R1;
				 } 
				 R5 = R5 + 1;
			 }
			 R4 = R4 - 1;
		 
		 //R4 == 10			 
			 R5 = address - 1;
			 //address + num -1 < R5
			 while(R5 < R4) {
				 
				 int R1[] = data[R5];
				 if (R1[10] == 0) {
					 
					 R6 = R5;
					 
					 while (R6 > address -1 && data[R6-1][10] == 1) {
						 data[R6] = data[R6-1];
						 R6--;
					 }
					 
					 data[R6] = R1;
				 } 
				 R5 = R5 + 1;
			 }
		 
		 //R4 == 9
			 R5 = address - 1;
			 //address + num -1 < R5
			 while(R5 < R4) {
				 
				 int R1[] = data[R5];
				 if (R1[9] == 0) {
					 
					 R6 = R5;
					 
					 while (R6 > address -1 && data[R6-1][9] == 1) {
						 data[R6] = data[R6-1];
						 R6--;
					 }
					 
					 data[R6] = R1;
				 } 
				 R5 = R5 + 1;
			 }
		 
		 //R4 == 8			 
			 R5 = address - 1;
			 //address + num -1 < R5
			 while(R5 < R4) {
				 
				 int R1[] = data[R5];
				 if (R1[8] == 0) {
					 
					 R6 = R5;
					 
					 while (R6 > address -1 && data[R6-1][8] == 1) {
						 data[R6] = data[R6-1];
						 R6--;
					 }
					 
					 data[R6] = R1;
				 } 
				 R5 = R5 + 1;
			 }
		 
		 //R4 == 7	 
			 R5 = address - 1;
			 //address + num -1 < R5
			 while(R5 < R4) {
				 
				 int R1[] = data[R5];
				 if (R1[7] == 0) {
					 
					 R6 = R5;
					 
					 while (R6 > address -1 && data[R6-1][7] == 1) {
						 data[R6] = data[R6-1];
						 R6--;
					 }
					 
					 data[R6] = R1;
				 } 
				 R5 = R5 + 1;
			 }
		 
		 //R4 == 6 
			 R5 = address - 1;
			 //address + num -1 < R5
			 while(R5 < R4) {
				 
				 int R1[] = data[R5];
				 if (R1[6] == 0) {
					 
					 R6 = R5;
					 
					 while (R6 > address -1 && data[R6-1][6] == 1) {
						 data[R6] = data[R6-1];
						 R6--;
					 }
					 
					 data[R6] = R1;
				 } 
				 R5 = R5 + 1;
			 }

		 //R4 == 5
			 R5 = address - 1;
			 //address + num -1 < R5
			 while(R5 < R4) {
				 
				 int R1[] = data[R5];
				 if (R1[5] == 0) {
					 
					 R6 = R5;
					 
					 while (R6 > address -1 && data[R6-1][5] == 1) {
						 data[R6] = data[R6-1];
						 R6--;
					 }
					 
					 data[R6] = R1;
				 } 
				 R5 = R5 + 1;
			 }
		 
		 //R4 == 4 
			 R5 = address - 1;
			 //address + num -1 < R5
			 while(R5 < R4) {
				 
				 int R1[] = data[R5];
				 if (R1[4] == 0) {
					 
					 R6 = R5;
					 
					 while (R6 > address -1 && data[R6-1][4] == 1) {
						 data[R6] = data[R6-1];
						 R6--;
					 }
					 
					 data[R6] = R1;
				 } 
				 R5 = R5 + 1;
			 }
		 
		 //R4 == 3
			 R5 = address - 1;
			 //address + num -1 < R5
			 while(R5 < R4) {
				 
				 int R1[] = data[R5];
				 if (R1[3] == 0) {
					 
					 R6 = R5;
					 
					 while (R6 > address -1 && data[R6-1][3] == 1) {
						 data[R6] = data[R6-1];
						 R6--;
					 }
					 
					 data[R6] = R1;
				 } 
				 R5 = R5 + 1;
			 }
		 
		 //R4 == 2
			 R5 = address - 1;
			 //address + num -1 < R5
			 while(R5 < R4) {
				 
				 int R1[] = data[R5];
				 if (R1[2] == 0) {
					 
					 R6 = R5;
					 
					 while (R6 > address -1 && data[R6-1][2] == 1) {
						 data[R6] = data[R6-1];
						 R6--;
					 }
					 
					 data[R6] = R1;
				 } 
				 R5 = R5 + 1;
			 }
			
		 //R4 == 1
			 R5 = address - 1;
			 //address + num -1 < R5
			 while(R5 < R4) {
				 
				 int R1[] = data[R5];
				 if (R1[1] == 0) {
					 
					 R6 = R5;
					 
					 while (R6 > address -1 && data[R6-1][1] == 1) {
						 data[R6] = data[R6-1];
						 R6--;
					 }
					 
					 data[R6] = R1;
				 } 
				 R5 = R5 + 1;
			 }
		
		 //R4 == 0
		 R5 = address - 1;
		 while(R5 < address + num -1) {
			 
			 int R1[] = data[R5];
			 if (R1[0] == 1) {
				 
				 
				 R6 = R5;
				 
				 while (R6 > address - 1 && data[R6-1][0] == 0) {
					 data[R6] = data[R6-1];
					 R6--;
				 }
				 
				 data[R6] = R1;
			 }
			 R5 = R5 + 1;
		 }
		 
		 
		 
		 for (int p = 0; p < address + num -1 ; p++) {
			 if (p == address -1) {
				 System.out.println("");
			 }
			 int number = 0;
			 if (data[p][0] == 1) {
				 number = (int) Math.pow(2, 16);
			 }else {
				 number = 0;
			 }
			 for (int q = 0; q < size; q++) {
				 System.out.print(data[p][q]);
				 if (data[p][0] == 1) {
					 number -= data[p][q] * Math.pow(2, size-q-1);
				 }
				 
				 else {
					 number += data[p][q] * Math.pow(2, size-q-1);
				 }
				 
			 }
			 System.out.print("\t");
			 if(data[p][0] == 1) {
				 System.out.println("-" + number);
				 
			 } else {
				 System.out.println(number);
			 }
		 }
	 }
}
