
`timescale 1ns / 1ps

module full_adder(
    input a,
    input b,
    input cin,
    output reg sum,
    output reg cout
);
    always @(*) begin
        {cout,sum} = a+b+cin;  // blocking assignment 
    end
endmodule


// <= 