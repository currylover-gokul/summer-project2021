module top_module(input [64:1]a,input [48:1]key,output[64:1]b);
    wire [32:1]l0,r0,p1,c1,sp1;
    wire [48:1]e1,f1;
    wire [64:1]a1;
    wire [6:1]sb1,sb2,sb3,sb4,sb5,sb6,sb7,sb8;
    wire [4:1]s1,s2,s3,s4,s5,s6,s7,s8;
initial_permutation I(a,l0,r0);
expansion E1(r0,e1);
assign f1 = e1 ^ key;
assign sb1=f1[48:43];
assign sb2=f1[42:37];
assign sb3=f1[36:31];
assign sb4=f1[30:25];
assign sb5=f1[24:19];
assign sb6=f1[18:13];
assign sb7=f1[12:7];
assign sb8=f1[6:1];
sbox1 S1(sb1,s1);
sbox2 S2(sb2,s2);
sbox3 S3(sb3,s3);
sbox4 S4(sb4,s4);
sbox5 S5(sb5,s5);
sbox6 S6(sb6,s6);
sbox7 S7(sb7,s7);
sbox8 S8(sb8,s8);
assign sp1={s1,s2,s3,s4,s5,s6,s7,s8};
permute P1(sp1,p1);
assign c1=p1^l0;
    assign b={r0,c1};
endmodule
module initial_permutation(
      plaintxt,
      left_out,
    right_out);
    
    input [64:1] plaintxt;
    output [32:1] left_out;
    output [32:1] right_out;
	 
	 reg [64:1] ip;
	 assign right_out= ip[32:1] ;           
	 assign left_out= ip[64:33];          
    always@(*)begin
	            ip[1]= plaintxt[58];
					ip[2]= plaintxt[50];
					ip[3]= plaintxt[42];
					ip[4]= plaintxt[34];
					ip[5]= plaintxt[26];
					ip[6]= plaintxt[18];
					ip[7]= plaintxt[10];
					ip[8]= plaintxt[2];
					ip[9]= plaintxt[60];
					ip[10]= plaintxt[52];
					ip[11]= plaintxt[44];
					
					ip[12]= plaintxt[36];
					ip[13]= plaintxt[28];
					ip[14]= plaintxt[20];
					ip[15]= plaintxt[12];
					ip[16]= plaintxt[4];
					ip[17]= plaintxt[62];
					ip[18]= plaintxt[54];
					ip[19]= plaintxt[46];
					ip[20]= plaintxt[38];
					ip[21]= plaintxt[30];
					ip[22]= plaintxt[22];
					
					ip[23]= plaintxt[14];
					ip[24]= plaintxt[6];
					ip[25]= plaintxt[64];
					ip[26]= plaintxt[56];
					ip[27]= plaintxt[48];
					ip[28]= plaintxt[40];
					ip[29]= plaintxt[32];
					ip[30]= plaintxt[24];
					ip[31]= plaintxt[16];
					ip[32]= plaintxt[8];
					
					ip[33]= plaintxt[57];
					ip[34]= plaintxt[49];
					ip[35]= plaintxt[41];
					ip[36]= plaintxt[33];
					ip[37]= plaintxt[25];
					ip[38]= plaintxt[17];
					ip[39]= plaintxt[9];
					ip[40]= plaintxt[1];
					ip[41]= plaintxt[59];
					ip[42]= plaintxt[51];
					
					ip[43]= plaintxt[43];
					ip[44]= plaintxt[35];
					ip[45]= plaintxt[27];
					ip[46]= plaintxt[19];
					ip[47]= plaintxt[11];
					ip[48]= plaintxt[3];
					ip[49]= plaintxt[61];
					ip[50]= plaintxt[53];
					ip[51]= plaintxt[45];
					ip[52]= plaintxt[37];
					
					ip[53]= plaintxt[29];
			  		ip[54]= plaintxt[21];
					ip[55]= plaintxt[13];
					ip[56]= plaintxt[5];
					ip[57]= plaintxt[63];
					ip[58]= plaintxt[55];
					ip[59]= plaintxt[47];
					ip[60]= plaintxt[39];
					ip[61]= plaintxt[31];
					ip[62]= plaintxt[23];
					ip[63]<= plaintxt[15];
					ip[64]<= plaintxt[7];							
    end
endmodule
module expansion(input [32:1] right,output reg[48:1] ouput);
	 wire [32:1] right;
	 always @ (right)
	 begin
	 
	                      ouput[1]<= right[32];
								 ouput[2]<= right[1];
								 ouput[3]<= right[2];
								 ouput[4]<= right[3];
								 ouput[5]<= right[4];
								 ouput[6]<= right[5];
								 ouput[7]<= right[4];
								 ouput[8]<= right[5];
								 ouput[9]<= right[6];
								 ouput[10]<= right[7];
								 
								 ouput[11]<= right[8];
								 ouput[12]<= right[9];
								 ouput[13]<= right[8];
								 ouput[14]<= right[9];
								 ouput[15]<= right[10];
								 ouput[16]<= right[11];
								 ouput[17]<= right[12];
								 ouput[18]<= right[13];
								 ouput[19]<= right[12];
								 ouput[20]<= right[13];
								 
								 ouput[21]<= right[14];
								 ouput[22]<= right[15];
								 ouput[23]<= right[16];
								 ouput[24]<= right[17];
								 ouput[25]<= right[16];
								 ouput[26]<= right[17];
								 ouput[27]<= right[18];
								 ouput[28]<= right[19];
								 ouput[29]<= right[20];
								 ouput[30]<= right[21];
								 
								 ouput[31]<= right[20];
								 ouput[32]<= right[21];
								 ouput[33]<= right[22];
								 ouput[34]<= right[23];
								 ouput[35]<= right[24];
								 ouput[36]<= right[25];
								 ouput[37]<= right[24];
								 ouput[38]<= right[25];
								 ouput[39]<= right[26];
								 ouput[40]<= right[27];
								 
								 ouput[41]<= right[28];
								 ouput[42]<= right[29];
								 ouput[43]<= right[28];
								 ouput[44]<= right[29];
								 ouput[45]<= right[30];
								 ouput[46]<= right[31];
								 ouput[47]<= right[32];
								 ouput[48]<= right[1];
	 
	 end
endmodule
module sbox1(input[6:1]a,output reg [4:1]b);
    wire [6:1]a1;
assign a1={a[6],a[1],a[5:2]};
    always @(*)begin
        case(a1)
6'b000000:  b <= 4'd14;             
	 6'b000001:  b <= 4'd4;             
	 6'b000010:  b <= 4'd13;            
	 6'b000011:  b <= 4'd1;             
	 6'b000100:  b <= 4'd2;             
	 6'b000101:  b <= 4'd15;             
	 6'b000110:  b <= 4'd11;             
	 6'b000111:  b <= 4'd8;             
	 6'b001000:  b <= 4'd3;             
	 6'b001001:  b <= 4'd10;             
	 6'b001010:  b <= 4'd6;             
	 6'b001011:  b <= 4'd12;             
	 6'b001100:  b <= 4'd5;             
	 6'b001101:  b <= 4'd9;             
	 6'b001110:  b <= 4'd0;             
	 6'b001111:  b <= 4'd7;             
	 6'b010000:  b <= 4'd0;             
	 6'b010001:  b <= 4'd15;             
	 6'b010010:  b <= 4'd7;             
	 6'b010011:  b <= 4'd4;             
	 6'b010100:  b <= 4'd14;             
	 6'b010101:  b <= 4'd2;             
	 6'b010110:  b <= 4'd13;             
	 6'b010111:  b <= 4'd1;             
	 6'b011000:  b <= 4'd10;             
	 6'b011001:  b <= 4'd6;             
	 6'b011010:  b <= 4'd12;             
	 6'b011011:  b <= 4'd11;             
	 6'b011100:  b <= 4'd9;             
	 6'b011101:  b <= 4'd5;             
	 6'b011110:  b <= 4'd3;             
	 6'b011111:  b <= 4'd8;             
     6'b100000:  b <= 4'd4;             
	 6'b100001:  b <= 4'd1;             
	 6'b100010:  b <= 4'd14;             
	 6'b100011:  b <= 4'd8;             
	 6'b100100:  b <= 4'd13;             
	 6'b100101:  b <= 4'd6;             
	 6'b100110:  b <= 4'd2;             
	 6'b100111:  b <= 4'd11;             
	 6'b101000:  b <= 4'd15;             
	 6'b101001:  b <= 4'd12;             
	 6'b101010:  b <= 4'd9;             
	 6'b101011:  b <= 4'd7;             
	 6'b101100:  b <= 4'd3;             
	 6'b101101:  b <= 4'd10;             
	 6'b101110:  b <= 4'd5;             
	 6'b101111:  b <= 4'd0;             
	 6'b110000:  b <= 4'd15;             
	 6'b110001:  b <= 4'd12;             
	 6'b110010:  b <= 4'd8;             
	 6'b110011:  b <= 4'd2;             
	 6'b110100:  b <= 4'd4;             
	 6'b110101:  b <= 4'd9;            
	 6'b110110:  b <= 4'd1;             
	 6'b110111:  b <= 4'd7;            
	 6'b111000:  b <= 4'd5;        
	 6'b111001:  b <= 4'd11;        
	 6'b111010:  b <= 4'd3;       
	 6'b111011:  b <= 4'd14;       
	 6'b111100:  b <= 4'd10;       
	 6'b111101:  b <= 4'd0;       
	 6'b111110:  b <= 4'd6;      
	 6'b111111:  b <= 4'd13;      
	 default:    b <= 4'd0; 		
	 endcase 			 
	 end
endmodule
module sbox2(input[6:1]a,output reg [4:1]b);
    wire [6:1] a1; 
	 assign a1 = {a[6], a[1], a[5 : 2]}; 	  	 
	 always @(*) 	  	  
	 begin  	   	    
         case (a1)             
	 6'b000000:  b <= 4'd15;             
	 6'b000001:  b <= 4'd1;             
	 6'b000010:  b <= 4'd8;
	 6'b000011:  b <= 4'd14;             
	 6'b000100:  b <= 4'd6;             
	 6'b000101:  b <= 4'd11;             
	 6'b000110:  b <= 4'd3;             
	 6'b000111:  b <= 4'd4;             
	 6'b001000:  b <= 4'd9;             
	 6'b001001:  b <= 4'd7;             
	 6'b001010:  b <= 4'd2;             
	 6'b001011:  b <= 4'd13;             
	 6'b001100:  b <= 4'd12;             
	 6'b001101:  b <= 4'd0;             
	 6'b001110:  b <= 4'd5;             
	 6'b001111:  b <= 4'd10;             
	 6'b010000:  b <= 4'd3;             
	 6'b010001:  b <= 4'd13;             
	 6'b010010:  b <= 4'd4;             
	 6'b010011:  b <= 4'd7;             
	 6'b010100:  b <= 4'd15;             
	 6'b010101:  b <= 4'd2;             
	 6'b010110:  b <= 4'd8;             
	 6'b010111:  b <= 4'd14;             
	 6'b011000:  b <= 4'd12;             
	 6'b011001:  b <= 4'd0;             
	 6'b011010:  b <= 4'd1;             
	 6'b011011:  b <= 4'd10;             
	 6'b011100:  b <= 4'd6;             
	 6'b011101:  b <= 4'd9;             
	 6'b011110:  b <= 4'd11;             
	 6'b011111:  b <= 4'd5;             
	 6'b100000:  b <= 4'd0;             
	 6'b100001:  b <= 4'd14;             
	 6'b100010:  b <= 4'd7;             
	 6'b100011:  b <= 4'd11;             
	 6'b100100:  b <= 4'd10;             
	 6'b100101:  b <= 4'd4;             
	 6'b100110:  b <= 4'd13;             
	 6'b100111:  b <= 4'd1;             
	 6'b101000:  b <= 4'd5;             
	 6'b101001:  b <= 4'd8;             
	 6'b101010:  b <= 4'd12;             
	 6'b101011:  b <= 4'd6;             
	 6'b101100:  b <= 4'd9;             
	 6'b101101:  b <= 4'd3;             
	 6'b101110:  b <= 4'd2;             
	 6'b101111:  b <= 4'd15;             
	 6'b110000:  b <= 4'd13;             
	 6'b110001:  b <= 4'd8;             
	 6'b110010:  b <= 4'd10;             
	 6'b110011:  b <= 4'd1;             
	 6'b110100:  b <= 4'd3;             
	 6'b110101:  b <= 4'd15;            
	 6'b110110:  b <= 4'd4;             
	 6'b110111:  b <= 4'd2;            
	 6'b111000:  b <= 4'd11;        
	 6'b111001:  b <= 4'd6;        
	 6'b111010:  b <= 4'd7;       
	 6'b111011:  b <= 4'd12;       
	 6'b111100:  b <= 4'd0;       
	 6'b111101:  b <= 4'd5;       
	 6'b111110:  b <= 4'd14;      
	 6'b111111:  b <= 4'd9;      
	 default:    b <= 4'd0; 		
	 endcase 			 
	 end

endmodule
module sbox3(input [6:1] Bin, output reg [4:1] BSout);
    wire [6:1] a1;
	 assign a1 = {Bin[6], Bin[1], Bin[5 : 2]}; 	  	 
	 always @(*) 	  	  
	 begin  	   	    
         case (a1)             
	 6'b000000:  BSout <= 4'd10;             
	 6'b000001:  BSout <= 4'd0;             
	 6'b000010:  BSout <= 4'd9;            
	 6'b000011:  BSout <= 4'd14;             
	 6'b000100:  BSout <= 4'd6;             
	 6'b000101:  BSout <= 4'd3;             
	 6'b000110:  BSout <= 4'd15;             
	 6'b000111:  BSout <= 4'd5;             
	 6'b001000:  BSout <= 4'd1;             
	 6'b001001:  BSout <= 4'd13;             
	 6'b001010:  BSout <= 4'd12;             
	 6'b001011:  BSout <= 4'd7;             
	 6'b001100:  BSout <= 4'd11;             
	 6'b001101:  BSout <= 4'd4;             
	 6'b001110:  BSout <= 4'd2;             
	 6'b001111:  BSout <= 4'd8;             
	 6'b010000:  BSout <= 4'd13;             
	 6'b010001:  BSout <= 4'd7;             
	 6'b010010:  BSout <= 4'd0;             
	 6'b010011:  BSout <= 4'd9;             
	 6'b010100:  BSout <= 4'd3;             
	 6'b010101:  BSout <= 4'd4;             
	 6'b010110:  BSout <= 4'd6;             
	 6'b010111:  BSout <= 4'd10;             
	 6'b011000:  BSout <= 4'd2;             
	 6'b011001:  BSout <= 4'd8;             
	 6'b011010:  BSout <= 4'd5;             
	 6'b011011:  BSout <= 4'd14;             
	 6'b011100:  BSout <= 4'd12;             
	 6'b011101:  BSout <= 4'd11;             
	 6'b011110:  BSout <= 4'd15;             
	 6'b011111:  BSout <= 4'd1;             
	 6'b100000:  BSout <= 4'd13;             
	 6'b100001:  BSout <= 4'd6;             
	 6'b100010:  BSout <= 4'd4;             
	 6'b100011:  BSout <= 4'd9;             
	 6'b100100:  BSout <= 4'd8;             
	 6'b100101:  BSout <= 4'd15;             
	 6'b100110:  BSout <= 4'd3;             
	 6'b100111:  BSout <= 4'd0;             
	 6'b101000:  BSout <= 4'd11;             
	 6'b101001:  BSout <= 4'd1;             
	 6'b101010:  BSout <= 4'd2;             
	 6'b101011:  BSout <= 4'd12;             
	 6'b101100:  BSout <= 4'd5;             
	 6'b101101:  BSout <= 4'd10;             
	 6'b101110:  BSout <= 4'd14;             
	 6'b101111:  BSout <= 4'd7;             
	 6'b110000:  BSout <= 4'd1;             
	 6'b110001:  BSout <= 4'd10;             
	 6'b110010:  BSout <= 4'd13;             
	 6'b110011:  BSout <= 4'd0;             
	 6'b110100:  BSout <= 4'd6;             
	 6'b110101:  BSout <= 4'd9;            
	 6'b110110:  BSout <= 4'd8;             
	 6'b110111:  BSout <= 4'd7;            
	 6'b111000:  BSout <= 4'd4;        
	 6'b111001:  BSout <= 4'd15;        
	 6'b111010:  BSout <= 4'd14;       
	 6'b111011:  BSout <= 4'd3;       
	 6'b111100:  BSout <= 4'd11;       
	 6'b111101:  BSout <= 4'd5;       
	 6'b111110:  BSout <= 4'd2;      
	 6'b111111:  BSout <= 4'd12;      
	 default:    BSout <= 4'd0; 		
	 endcase 			 
	 end
endmodule
module sbox4(input [6:1] Bin,
             output reg [4:1] BSout);

     
	 wire [6:1] offset;
	  assign offset = {Bin[6], Bin[1], Bin[5 : 2]}; 	  	 
	 always @(offset) 	  	  
	 begin  	   	    
	 case (offset)             
	 6'b000000:  BSout <= 4'd7;             
	 6'b000001:  BSout <= 4'd13;             
	 6'b000010:  BSout <= 4'd14;            
	 6'b000011:  BSout <= 4'd3;             
	 6'b000100:  BSout <= 4'd0;             
	 6'b000101:  BSout <= 4'd6;             
	 6'b000110:  BSout <= 4'd9;             
	 6'b000111:  BSout <= 4'd10;             
	 6'b001000:  BSout <= 4'd1;             
	 6'b001001:  BSout <= 4'd2;             
	 6'b001010:  BSout <= 4'd8;             
	 6'b001011:  BSout <= 4'd5;             
	 6'b001100:  BSout <= 4'd11;             
	 6'b001101:  BSout <= 4'd12;             
	 6'b001110:  BSout <= 4'd4;             
	 6'b001111:  BSout <= 4'd15;             
	 6'b010000:  BSout <= 4'd13;             
	 6'b010001:  BSout <= 4'd8;             
	 6'b010010:  BSout <= 4'd11;             
	 6'b010011:  BSout <= 4'd5;             
	 6'b010100:  BSout <= 4'd6;             
	 6'b010101:  BSout <= 4'd15;             
	 6'b010110:  BSout <= 4'd0;             
	 6'b010111:  BSout <= 4'd3;             
	 6'b011000:  BSout <= 4'd4;             
	 6'b011001:  BSout <= 4'd7;             
	 6'b011010:  BSout <= 4'd2;             
	 6'b011011:  BSout <= 4'd12;             
	 6'b011100:  BSout <= 4'd1;             
	 6'b011101:  BSout <= 4'd10;             
	 6'b011110:  BSout <= 4'd14;             
	 6'b011111:  BSout <= 4'd9;             
	 6'b100000:  BSout <= 4'd10;             
	 6'b100001:  BSout <= 4'd6;             
	 6'b100010:  BSout <= 4'd9;             
	 6'b100011:  BSout <= 4'd0;             
	 6'b100100:  BSout <= 4'd12;             
	 6'b100101:  BSout <= 4'd11;             
	 6'b100110:  BSout <= 4'd7;             
	 6'b100111:  BSout <= 4'd13;             
	 6'b101000:  BSout <= 4'd15;             
	 6'b101001:  BSout <= 4'd1;             
	 6'b101010:  BSout <= 4'd3;             
	 6'b101011:  BSout <= 4'd14;             
	 6'b101100:  BSout <= 4'd5;             
	 6'b101101:  BSout <= 4'd2;             
	 6'b101110:  BSout <= 4'd8;             
	 6'b101111:  BSout <= 4'd4;             
	 6'b110000:  BSout <= 4'd3;             
	 6'b110001:  BSout <= 4'd15;             
	 6'b110010:  BSout <= 4'd0;             
	 6'b110011:  BSout <= 4'd6;             
	 6'b110100:  BSout <= 4'd10;             
	 6'b110101:  BSout <= 4'd1;            
	 6'b110110:  BSout <= 4'd13;             
	 6'b110111:  BSout <= 4'd8;            
	 6'b111000:  BSout <= 4'd9;        
	 6'b111001:  BSout <= 4'd4;        
	 6'b111010:  BSout <= 4'd5;       
	 6'b111011:  BSout <= 4'd11;       
	 6'b111100:  BSout <= 4'd12;       
	 6'b111101:  BSout <= 4'd7;       
	 6'b111110:  BSout <= 4'd2;      
	 6'b111111:  BSout <= 4'd14;      
	 default:    BSout <= 4'd0; 		
	 endcase 			 
	 end
endmodule
module sbox5(
     Bin,
    BSout
    );
    input [6:1] Bin;
    output reg [4:1] BSout;
	 wire [6:1] offset;
	  assign offset = {Bin[6], Bin[1], Bin[5 : 2]}; 	  	 
	 always @(offset) 	  	  
	 begin  	   	    
	 case (offset)             
	 6'b000000:  BSout <= 4'd2;             
	 6'b000001:  BSout <= 4'd12;             
	 6'b000010:  BSout <= 4'd4;            
	 6'b000011:  BSout <= 4'd1;             
	 6'b000100:  BSout <= 4'd7;             
	 6'b000101:  BSout <= 4'd10;             
	 6'b000110:  BSout <= 4'd11;             
	 6'b000111:  BSout <= 4'd6;             
	 6'b001000:  BSout <= 4'd8;             
	 6'b001001:  BSout <= 4'd5;             
	 6'b001010:  BSout <= 4'd3;             
	 6'b001011:  BSout <= 4'd15;             
	 6'b001100:  BSout <= 4'd13;             
	 6'b001101:  BSout <= 4'd0;             
	 6'b001110:  BSout <= 4'd14;             
	 6'b001111:  BSout <= 4'd9;             
	 6'b010000:  BSout <= 4'd14;             
	 6'b010001:  BSout <= 4'd11;             
	 6'b010010:  BSout <= 4'd2;             
	 6'b010011:  BSout <= 4'd12;             
	 6'b010100:  BSout <= 4'd4;             
	 6'b010101:  BSout <= 4'd7;             
	 6'b010110:  BSout <= 4'd13;             
	 6'b010111:  BSout <= 4'd1;             
	 6'b011000:  BSout <= 4'd5;             
	 6'b011001:  BSout <= 4'd0;             
	 6'b011010:  BSout <= 4'd15;             
	 6'b011011:  BSout <= 4'd10;             
	 6'b011100:  BSout <= 4'd3;             
	 6'b011101:  BSout <= 4'd9;             
	 6'b011110:  BSout <= 4'd8;             
	 6'b011111:  BSout <= 4'd6;             
	 6'b100000:  BSout <= 4'd4;             
	 6'b100001:  BSout <= 4'd2;             
	 6'b100010:  BSout <= 4'd1;             
	 6'b100011:  BSout <= 4'd11;             
	 6'b100100:  BSout <= 4'd10;             
	 6'b100101:  BSout <= 4'd13;             
	 6'b100110:  BSout <= 4'd7;             
	 6'b100111:  BSout <= 4'd8;             
	 6'b101000:  BSout <= 4'd15;             
	 6'b101001:  BSout <= 4'd9;             
	 6'b101010:  BSout <= 4'd12;             
	 6'b101011:  BSout <= 4'd5;             
	 6'b101100:  BSout <= 4'd6;             
	 6'b101101:  BSout <= 4'd3;             
	 6'b101110:  BSout <= 4'd0;             
	 6'b101111:  BSout <= 4'd14;             
	 6'b110000:  BSout <= 4'd11;             
	 6'b110001:  BSout <= 4'd8;             
	 6'b110010:  BSout <= 4'd12;             
	 6'b110011:  BSout <= 4'd7;             
	 6'b110100:  BSout <= 4'd1;             
	 6'b110101:  BSout <= 4'd14;            
	 6'b110110:  BSout <= 4'd2;             
	 6'b110111:  BSout <= 4'd13;            
	 6'b111000:  BSout <= 4'd6;        
	 6'b111001:  BSout <= 4'd15;        
	 6'b111010:  BSout <= 4'd0;       
	 6'b111011:  BSout <= 4'd9;       
	 6'b111100:  BSout <= 4'd10;       
	 6'b111101:  BSout <= 4'd4;       
	 6'b111110:  BSout <= 4'd5;      
	 6'b111111:  BSout <= 4'd3;      
	 default:    BSout <= 4'd0; 		
	 endcase 			 
	 end
endmodule
module sbox6(
     Bin,
     BSout
    );
	 input [6:1] Bin;
    output reg [4:1] BSout;
	 wire [6:1] offset;
	 assign offset = {Bin[6], Bin[1], Bin[5 : 2]}; 	  	 
	 always @(offset) 	  	  
	 begin  	   	    
	 case (offset)             
	 6'b000000:  BSout <= 4'd12;             
	 6'b000001:  BSout <= 4'd1;             
	 6'b000010:  BSout <= 4'd10;            
	 6'b000011:  BSout <= 4'd15;             
	 6'b000100:  BSout <= 4'd9;             
	 6'b000101:  BSout <= 4'd2;             
	 6'b000110:  BSout <= 4'd6;             
	 6'b000111:  BSout <= 4'd8;             
	 6'b001000:  BSout <= 4'd0;             
	 6'b001001:  BSout <= 4'd13;             
	 6'b001010:  BSout <= 4'd3;             
	 6'b001011:  BSout <= 4'd4;             
	 6'b001100:  BSout <= 4'd14;             
	 6'b001101:  BSout <= 4'd7;             
	 6'b001110:  BSout <= 4'd5;             
	 6'b001111:  BSout <= 4'd11;             
	 6'b010000:  BSout <= 4'd10;             
	 6'b010001:  BSout <= 4'd15;             
	 6'b010010:  BSout <= 4'd4;             
	 6'b010011:  BSout <= 4'd2;             
	 6'b010100:  BSout <= 4'd7;             
	 6'b010101:  BSout <= 4'd12;             
	 6'b010110:  BSout <= 4'd9;             
	 6'b010111:  BSout <= 4'd5;             
	 6'b011000:  BSout <= 4'd6;             
	 6'b011001:  BSout <= 4'd1;             
	 6'b011010:  BSout <= 4'd13;             
	 6'b011011:  BSout <= 4'd14;             
	 6'b011100:  BSout <= 4'd0;             
	 6'b011101:  BSout <= 4'd11;             
	 6'b011110:  BSout <= 4'd3;             
	 6'b011111:  BSout <= 4'd8;             
	 6'b100000:  BSout <= 4'd9;             
	 6'b100001:  BSout <= 4'd14;             
	 6'b100010:  BSout <= 4'd15;             
	 6'b100011:  BSout <= 4'd5;             
	 6'b100100:  BSout <= 4'd2;             
	 6'b100101:  BSout <= 4'd8;             
	 6'b100110:  BSout <= 4'd12;             
	 6'b100111:  BSout <= 4'd3;             
	 6'b101000:  BSout <= 4'd7;             
	 6'b101001:  BSout <= 4'd0;             
	 6'b101010:  BSout <= 4'd4;             
	 6'b101011:  BSout <= 4'd10;             
	 6'b101100:  BSout <= 4'd1;             
	 6'b101101:  BSout <= 4'd13;             
	 6'b101110:  BSout <= 4'd11;             
	 6'b101111:  BSout <= 4'd6;             
	 6'b110000:  BSout <= 4'd4;             
	 6'b110001:  BSout <= 4'd3;             
	 6'b110010:  BSout <= 4'd2;             
	 6'b110011:  BSout <= 4'd12;             
	 6'b110100:  BSout <= 4'd9;             
	 6'b110101:  BSout <= 4'd5;            
	 6'b110110:  BSout <= 4'd15;             
	 6'b110111:  BSout <= 4'd10;            
	 6'b111000:  BSout <= 4'd11;        
	 6'b111001:  BSout <= 4'd14;        
	 6'b111010:  BSout <= 4'd1;       
	 6'b111011:  BSout <= 4'd7;       
	 6'b111100:  BSout <= 4'd6;       
	 6'b111101:  BSout <= 4'd0;       
	 6'b111110:  BSout <= 4'd8;      
	 6'b111111:  BSout <= 4'd13;      
	 default:    BSout <= 4'd0; 		
	 endcase 			 
	 end
endmodule
module permute(
     in,
     out
    );

    input [32:1] in;
    output reg [32:1] out;
	 
	 
	 always @ (in)
	 begin 
	                    
							  out[1]<=in[16];
							  out[2]<=in[7];
							  out[3]<=in[20];
							  out[4]<=in[21];
							  out[5]<=in[29];
							  out[6]<=in[12];
							  out[7]<=in[28];
							  out[8]<=in[17];
							  out[9]<=in[1];
							  out[10]<=in[15];
							  
							  out[11]<=in[23];
							  out[12]<=in[26];
							  out[13]<=in[5];
							  out[14]<=in[18];
							  out[15]<=in[31];
							  out[16]<=in[10];
							  out[17]<=in[2];
							  out[18]<=in[8];
							  out[19]<=in[24];
							  out[20]<=in[14];
							  
							  out[21]<=in[32];
							  out[22]<=in[27];
							  out[23]<=in[3];
							  out[24]<=in[9];
							  out[25]<=in[19];
							  out[26]<=in[13];
							  out[27]<=in[30];
							  out[28]<=in[6];
							  out[29]<=in[22];
							  out[30]<=in[11];
							  
							  out[31]<=in[4];
							  out[32]<=in[25];
	 
	 
	 
	 end
endmodule
module sbox7(
     Bin,
     BSout
    );

    input [6:1] Bin;
    output reg [4:1] BSout;
	  wire [6:1] offset;
	 assign offset = {Bin[6], Bin[1], Bin[5 : 2]}; 	  	 
	 always @(offset) 	  	  
	 begin  	   	    
	 case (offset)             
	 6'b000000:  BSout <= 4'd4;             
	 6'b000001:  BSout <= 4'd11;             
	 6'b000010:  BSout <= 4'd2;            
	 6'b000011:  BSout <= 4'd14;             
	 6'b000100:  BSout <= 4'd15;             
	 6'b000101:  BSout <= 4'd0;             
	 6'b000110:  BSout <= 4'd8;             
	 6'b000111:  BSout <= 4'd13;             
	 6'b001000:  BSout <= 4'd3;             
	 6'b001001:  BSout <= 4'd12;             
	 6'b001010:  BSout <= 4'd9;             
	 6'b001011:  BSout <= 4'd7;             
	 6'b001100:  BSout <= 4'd5;             
	 6'b001101:  BSout <= 4'd10;             
	 6'b001110:  BSout <= 4'd6;             
	 6'b001111:  BSout <= 4'd1;             
	 6'b010000:  BSout <= 4'd13;             
	 6'b010001:  BSout <= 4'd0;             
	 6'b010010:  BSout <= 4'd11;             
	 6'b010011:  BSout <= 4'd7;             
	 6'b010100:  BSout <= 4'd4;             
	 6'b010101:  BSout <= 4'd9;             
	 6'b010110:  BSout <= 4'd1;             
	 6'b010111:  BSout <= 4'd10;             
	 6'b011000:  BSout <= 4'd14;             
	 6'b011001:  BSout <= 4'd3;             
	 6'b011010:  BSout <= 4'd5;             
	 6'b011011:  BSout <= 4'd12;             
	 6'b011100:  BSout <= 4'd2;             
	 6'b011101:  BSout <= 4'd15;             
	 6'b011110:  BSout <= 4'd8;             
	 6'b011111:  BSout <= 4'd6;             
	 6'b100000:  BSout <= 4'd1;             
	 6'b100001:  BSout <= 4'd4;             
	 6'b100010:  BSout <= 4'd11;             
	 6'b100011:  BSout <= 4'd13;             
	 6'b100100:  BSout <= 4'd12;             
	 6'b100101:  BSout <= 4'd3;             
	 6'b100110:  BSout <= 4'd7;             
	 6'b100111:  BSout <= 4'd14;             
	 6'b101000:  BSout <= 4'd10;             
	 6'b101001:  BSout <= 4'd15;             
	 6'b101010:  BSout <= 4'd6;             
	 6'b101011:  BSout <= 4'd8;             
	 6'b101100:  BSout <= 4'd0;             
	 6'b101101:  BSout <= 4'd5;             
	 6'b101110:  BSout <= 4'd9;             
	 6'b101111:  BSout <= 4'd2;             
	 6'b110000:  BSout <= 4'd6;             
	 6'b110001:  BSout <= 4'd11;             
	 6'b110010:  BSout <= 4'd13;             
	 6'b110011:  BSout <= 4'd8;             
	 6'b110100:  BSout <= 4'd1;             
	 6'b110101:  BSout <= 4'd4;            
	 6'b110110:  BSout <= 4'd10;             
	 6'b110111:  BSout <= 4'd7;            
	 6'b111000:  BSout <= 4'd9;        
	 6'b111001:  BSout <= 4'd5;        
	 6'b111010:  BSout <= 4'd0;       
	 6'b111011:  BSout <= 4'd15;       
	 6'b111100:  BSout <= 4'd14;       
	 6'b111101:  BSout <= 4'd2;       
	 6'b111110:  BSout <= 4'd3;      
	 6'b111111:  BSout <= 4'd12;      
	 default:    BSout <= 4'd0; 		
	 endcase 			 
	 end
	 
	 
endmodule	 
module sbox8(
     Bin,
     BSout
    );
	 
	 input [6:1] Bin;
    output reg [4:1] BSout;
	 wire [6:1] offset;
	 assign offset = {Bin[6], Bin[1], Bin[5 : 2]}; 	  	 
	 always @(offset) 	  	  
	 begin  	   	    
	 case (offset)             
	 6'b000000:  BSout <= 4'd13;             
	 6'b000001:  BSout <= 4'd2;             
	 6'b000010:  BSout <= 4'd8;            
	 6'b000011:  BSout <= 4'd4;             
	 6'b000100:  BSout <= 4'd6;             
	 6'b000101:  BSout <= 4'd15;             
	 6'b000110:  BSout <= 4'd11;             
	 6'b000111:  BSout <= 4'd1;             
	 6'b001000:  BSout <= 4'd10;             
	 6'b001001:  BSout <= 4'd9;             
	 6'b001010:  BSout <= 4'd3;             
	 6'b001011:  BSout <= 4'd14;             
	 6'b001100:  BSout <= 4'd5;             
	 6'b001101:  BSout <= 4'd0;             
	 6'b001110:  BSout <= 4'd12;             
	 6'b001111:  BSout <= 4'd7;             
	 6'b010000:  BSout <= 4'd1;             
	 6'b010001:  BSout <= 4'd15;             
	 6'b010010:  BSout <= 4'd13;             
	 6'b010011:  BSout <= 4'd8;             
	 6'b010100:  BSout <= 4'd10;             
	 6'b010101:  BSout <= 4'd3;             
	 6'b010110:  BSout <= 4'd7;             
	 6'b010111:  BSout <= 4'd4;             
	 6'b011000:  BSout <= 4'd12;             
	 6'b011001:  BSout <= 4'd5;             
	 6'b011010:  BSout <= 4'd6;             
	 6'b011011:  BSout <= 4'd11;             
	 6'b011100:  BSout <= 4'd0;             
	 6'b011101:  BSout <= 4'd14;             
	 6'b011110:  BSout <= 4'd9;             
	 6'b011111:  BSout <= 4'd2;             
	 6'b100000:  BSout <= 4'd7;             
	 6'b100001:  BSout <= 4'd11;             
	 6'b100010:  BSout <= 4'd4;             
	 6'b100011:  BSout <= 4'd1;             
	 6'b100100:  BSout <= 4'd9;             
	 6'b100101:  BSout <= 4'd12;             
	 6'b100110:  BSout <= 4'd14;             
	 6'b100111:  BSout <= 4'd2;             
	 6'b101000:  BSout <= 4'd0;             
	 6'b101001:  BSout <= 4'd6;             
	 6'b101010:  BSout <= 4'd10;             
	 6'b101011:  BSout <= 4'd13;             
	 6'b101100:  BSout <= 4'd15;             
	 6'b101101:  BSout <= 4'd3;             
	 6'b101110:  BSout <= 4'd5;             
	 6'b101111:  BSout <= 4'd8;             
	 6'b110000:  BSout <= 4'd2;             
	 6'b110001:  BSout <= 4'd1;             
	 6'b110010:  BSout <= 4'd14;             
	 6'b110011:  BSout <= 4'd7;             
	 6'b110100:  BSout <= 4'd4;             
	 6'b110101:  BSout <= 4'd10;            
	 6'b110110:  BSout <= 4'd8;             
	 6'b110111:  BSout <= 4'd13;            
	 6'b111000:  BSout <= 4'd15;        
	 6'b111001:  BSout <= 4'd12;        
	 6'b111010:  BSout <= 4'd9;       
	 6'b111011:  BSout <= 4'd0;       
	 6'b111100:  BSout <= 4'd3;       
	 6'b111101:  BSout <= 4'd5;       
	 6'b111110:  BSout <= 4'd6;      
	 6'b111111:  BSout <= 4'd11;      
	 default:    BSout <= 4'd0; 		
	 endcase 			 
	 end
	 


endmodule
module testbench;
    reg[64:1]A;
    reg [48:1]B;
    wire [64:1] g;
    top_module testbench(A,B,g);
    initial begin
        A=64'b0010101000101010001010100010101000101010001010100010101000101010;B=48'b101010101010101010101010101010101010101010101010;
        #1 $display ("Plaintext=%b ,Key=%b ,Cipher=%b",A,B,g);
        $stop;
    end
endmodule
