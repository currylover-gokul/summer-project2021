module compare1(input a,
input b,
output reg equal,
output reg less,
output reg greater
);
always @(*) begin
    if(a==b) begin
        less=0;
        greater=0;
        equal=1;
    end
    else if(a>b) begin
        less=0;
        greater=1;
        equal=0;
    end
    else begin
        less=1;
        greater=0;
        equal=0;
    end
end
endmodule

module compare8(a,b,less,greater,equal);
input [7:0] a;
input [7:0] b;
output reg less;
output reg greater;
output reg equal;
always @(*) begin
    if(a==b) begin
        less=0;
        greater=0;
        equal=1;
    end
    else if(a>b) begin
        less=0;
        greater=1;
        equal=0;
    end
    else begin
        less=1;
        greater=0;
        equal=0;
    end
end
endmodule
module top_module;
reg [7:0] a;
reg [7:0] b;
wire less,equal,greater;
compare8 inst(.a(a),.b(b),.less(less),.greater(greater),.equal(equal));
initial begin
    $display($time,"\t\ta\t\tb\tless\tgreater\tequal");
   a=8'b00000001;  b=8'b00000000;  
#1 a=8'b00000110;  b=8'b00010001;  
#1 a=8'b00000011;  b=8'b00000110;  
#1 a=8'b00100001;  b=8'b00011111;  
#1 a=8'b01000011;  b=8'b00111111;  
#1 a=8'b01010101;  b=8'b01010101;  
#1 a=8'b00011111;  b=8'b00011111;  
#1 a=8'b00010001;  b=8'b00010001;  
#1 a=8'b00000111;  b=8'b01111111;  
#1 a=8'b11111111;  b=8'b11111110;  
  
end
initial $monitor($time,"\t%b\t%b\t%b\t%b\t%b",a,b,less,greater,equal);
endmodule
