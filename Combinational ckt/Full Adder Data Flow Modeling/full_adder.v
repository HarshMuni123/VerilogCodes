
`timescale 1ns / 1ps

module full_adder(
    input a,
    input b,
    input cin,
    output sum,       // {cout,sum}   == 2'b10 
    output cout 
);
    assign sum = a ^ b ^ cin;
    assign cout = (a&b) |(cin&(a^b));
endmodule
