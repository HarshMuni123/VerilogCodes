
// Data Flow Modeling

`timescale 1ns / 1ps

module half_subtractor(
    input a,
    input b,
    output Diff,
    output Borr
);
    assign Diff = a ^ b;
    assign Borr = ~a & b;
endmodule
