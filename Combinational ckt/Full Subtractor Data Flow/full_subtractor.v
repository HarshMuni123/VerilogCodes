// Data Flow Modeling

`timescale 1ns / 1ps

module full_subtractor(
    input a,
    input b,
    input bin,
    output Diff,
    output Borr
);
    assign Diff = a ^ b ^ bin;
    assign Borr = (~a & bin)|(~a & b)|(b & bin);
endmodule
