

`timescale 1ns / 1ps

module adder_16bit(
    input [15:0]a,
    input [15:0]b,
    input cin,
    output [15:0]sum,
    output cout
    );
    
    assign {cout,sum} = a+b+cin;
    
endmodule
