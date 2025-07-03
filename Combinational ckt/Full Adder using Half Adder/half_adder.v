
`timescale 1ns / 1ps

module full_adder(
    input a,
    input b,
    input cin, 
    output sum,
    output cout
);
    assign {cout,sum} = a+b+cin;
endmodule
