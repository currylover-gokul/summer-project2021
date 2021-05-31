module top_module(input a,input b,output reg out_less,output reg out_greater,output reg out_equal
);
always @(*) begin
if(a=1'b0&&b=1'b1)begin
  out_less=1;
  out_greater=0;
  out_equal=0;
end
if(a=1'b1&&b=1'b0)begin
  out_less=0;
  out_greater=1;
  out_equal=0;
end
else begin
  out_less=0;
  out_greater=0;
  out_equal=1;
end
    
end

endmodule