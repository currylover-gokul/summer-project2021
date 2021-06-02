module add1(input a,
input b,
input c_in,
output c_out,
output sum
);
assign{c_out,sum}=a+b+c_in;
endmodule

module add8(a,b,c_in,sum,c_out);
input [7:0] a;
input [7:0] b;
input c_in;
output [7:0] sum;
output c_out;
wire [6:0] c;
add1 adder_A1(a[0],b[0],c_in,sum[0],c[0]);
add1 adder_A2(a[1],b[1],c[0],sum[1],c[1]);
add1 adder_A3(a[2],b[2],c[1],sum[1],c[2]);
add1 adder_A4(a[3],b[3],c[2],sum[3],c[3]);
add1 adder_A5(a[4],b[4],c[3],sum[4],c[4]);
add1 adder_A6(a[5],b[5],c[4],sum[5],c[5]);
add1 adder_A7(a[6],b[6],c[5],sum[6],c[6]);
add1 adder_A8(a[7],b[7],c[6],sum[7],c_out);

endmodule

module top_module;
reg[7:0] a;
reg[7:0] b;
reg c_in;
wire [7:0] sum;
wire c_out;
add8 inst(.a(a),.b(b),.c_in(c_in),.sum(sum),.c_out(c_out));
initial begin
  $display($time,"\ta\tb\tc_in\tsum\tc_out");
   a=8'd0;  b=8'd0;  c_in=1'b0;
#1 a=8'd1;  b=8'd1;  c_in=1'b0;
#1 a=8'd1;  b=8'd0;  c_in=1'b0;
#1 a=8'd2;  b=8'd1;  c_in=1'b1;
#1 a=8'd3;  b=8'd4;  c_in=1'b1;
#1 a=8'd4;  b=8'd4;  c_in=1'b1;
#1 a=8'd6;  b=8'd5;  c_in=1'b0;
#1 a=8'd1;  b=8'd6;  c_in=1'b0;
#1 a=8'd7;  b=8'd6;  c_in=1'b1;
#1 a=8'd8;  b=8'd7;  c_in=1'b1;
  
end
initial $monitor($time,"\t%d\t%d\t%b\t%d\t%b",a,b,c_in,sum,c_out);

endmodule
