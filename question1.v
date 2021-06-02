module add1(input a,
input b,
input c_in,
output c_out,
output sum
);
  assign sum=(a^b)^c_in;
  assign c_out=(a&b)|(b&c_in)|(c_in&a);
endmodule
