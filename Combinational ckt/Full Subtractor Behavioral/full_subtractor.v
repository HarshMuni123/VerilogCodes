
// Behavioral Modeling

`timescale 1ns / 1ps
 
module full_subtractor(
    input a,
    input b,
    input bin,
    output reg Diff,
    output reg Borr
);
    always @(*) begin
        {Borr,Diff} = (a - b) - bin;
    end
endmodule
