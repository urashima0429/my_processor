package assembly_SIMPLE;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;



public class assembly {
	
	private static String dir = "/export/home/016/a0165336/project/SIMPLE/src/assembly_SIMPLE/";
	private static String targetFile = "test.simple";
	private static String resultFile = "test.exe";
	
	
	private static Path path = FileSystems.getDefault().getPath(dir, targetFile);
	private static Map<String, String> reg = new HashMap<String, String>(){
		{
			put("R0", "000");
			put("R1", "001");
			put("R2", "010");
			put("R3", "011");
			put("R4", "100");
			put("R5", "101");
			put("R6", "110");
			put("R7", "111");
		}
	};
	private static Map<String, String> op2 = new HashMap<String, String>(){
		{
			put("LI",  "000");
			put("B",   "100");
			put("BE",  "111");
			put("BLT", "111");
			put("BLE", "111");
			put("BNE", "111");
		}
	};
	private static Map<String, String> op3 = new HashMap<String, String>(){
		{
			put("ADD", "0000");
			put("SUB", "0001");
			put("AND", "0010");
			put("OR",  "0011");
			put("XOR", "0100");
			put("CMP", "0101");
			put("MOV", "0110");
			put("SLL", "1000");
			put("SLR", "1001");
			put("SRL", "1010");
			put("SRA", "1011");
			put("IN",  "1100");
			put("OUT", "1101");
			put("HLT", "1111");
		}
	};
	private static Map<String, String> cond = new HashMap<String, String>(){
		{
			put("BE",  "000");
			put("BLT", "001");
			put("BLE", "010");
			put("BNE", "011");
		}
	};
	private static String defaultD = "0000";
	private static String defaultReg = "000";
	private static List<String> result = new ArrayList<String>(); 

	 public static void main(String args[]){

		   
	 	
		 try {
			 //read
			 List<String> lines = Files.lines(path, StandardCharsets.UTF_8).collect(Collectors.toList());
			 
			 
			 for(String s : lines) {
//				 System.out.println(s);
				 String[] tmp = s.split(" ", 0);
				
				 switch (tmp[0]) {
				 
				 //comment out
				 case "//":
					 break; 
					 
				/********************************
					op1 = 11 
				 ********************************/
				 case "ADD":
				 case "SUB":
				 case "AND":
				 case "OR" :
				 case "XOR":
				 case "CMP":
				 case "MOV":
					 result.add("11" + reg.get(tmp[2]) + reg.get(tmp[1]) + op3.get(tmp[0]) + defaultD);
					 break;
				
				 case "SLL":
				 case "SLR":
				 case "SRL":
				 case "SRA":
					 result.add("11" + defaultReg + reg.get(tmp[1]) + op3.get(tmp[0]) + tmp[2]);
					 break;
					 
				 case "IN" :
					 result.add("11" + defaultReg + reg.get(tmp[1]) +op3.get(tmp[0]) + defaultD );
					 break;
					 
				 case "OUT" :
					 result.add("11" + reg.get(tmp[1]) + defaultReg +op3.get(tmp[0]) + defaultD );
					 break;
					 
				 case "HLT" :
					 result.add("11" + defaultReg + defaultReg + op3.get(tmp[0]) + defaultD );
					 break;
					 
					 
				/********************************
					op1 = 00 
				 ********************************/
					 
				 case "LD":
					 result.add("00" + reg.get(tmp[1]) + reg.get(tmp[2]) + tmp[3]);
					 break;
				
				/********************************
					op1 = 01
				 ********************************/
				
				 case "ST":
					 result.add("01" + reg.get(tmp[1]) + reg.get(tmp[2]) + tmp[3]);
					 break;
				
				/********************************
					op1 = 10
				 ********************************/
						 
				 case "LI":
				 case "B":
					 result.add("10" + op2.get(tmp[0]) + reg.get(tmp[1]) + tmp[2]);
					 break;
					
				 case "BE":
				 case "BLT":
				 case "BLE":
				 case "BNE":
					 result.add("10" + op2.get(tmp[0]) + cond.get(tmp[0]) + tmp[1]);
					 break;
					 
				 default:
					 System.out.println("error:" + tmp[0]);
				 }
				 
			 }
			 
			 //create
			 if (!Files.exists(Paths.get(dir, resultFile))) {
				 Files.createFile(Paths.get(dir, resultFile));
				 
			//create again if it exists
			 } else {
				 Files.delete(Paths.get(dir, resultFile));
				 Files.createFile(Paths.get(dir, resultFile));
			 }
			 
			 //write
			 Files.write(Paths.get(dir, resultFile), result,
						Charset.forName("SHIFT_JIS"), StandardOpenOption.APPEND);
			
			 
		 } catch (IOException e) {
			 System.out.println(path);
			 e.printStackTrace();
		 }
		 
	 }
	

}
