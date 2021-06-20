module top_module(input[7:0]a,input [5:0]key,output [7:0]b );
    wire [3:0]z,w,v,t;
    wire [5:0]c,p;
    assign t[3:1]=a[3:0];
    expansion e1(t,p);
assign c=p ^ key;
s_box s1(key,z);
permute p1(z,w);
assign v=w  ^ a[7:4];
assign b={a[3:0],v};
endmodule
module expansion(input[3:0]a,output[5:0]b);
    assign b[4:1]=a[3:0];
    assign b[5]=a[3];
    assign b[0]=a[0];
endmodule
module permute(input [3:0]a,output [3:0]b);
    assign b[0]=a[2];
    assign b[1]=a[0];
    assign b[2]=a[3];
    assign b[3]=a[1];
endmodule
module s_box(input[5:0]a,output reg [3:0]b);
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
module testbench;
    reg[7:0]A;
    reg [5:0]B;
    wire [7:0] c;
    top_module testbench(A,B,g);
    initial begin
        A=8'b00101010;B=6'b101010;
	    #1 $display ("Plaintext=%b ,Key=%b ,Cipher=%b",A,B,c);
        A=8'b10101001;B=6'b101010;
	    #1 $display ("Plaintext=%b ,Key=%b ,Cipher=%b",A,B,c);
        $stop;
    end
endmodule

