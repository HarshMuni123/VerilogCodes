

`timescale 1ns / 1ps

module adder_32bit(
    input [31:0]a,
    input [31:0]b,
    output [31:0]sum,
    output cout
);
    wire [1:0]c;
    adder_16bit a1(a[15:0],b[15:0],1'b0,sum[15:0],c[0]);
    adder_16bit a2(a[31:16],b[31:16],c[0],sum[31:16],cout);
    
endmodule
