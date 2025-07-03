
// Gate Level Modeling

`timescale 1ns / 1ps

module half_subtractor(
    input a,
    input b,
    output Diff,
    output Borr
);
    wire abar;
    not n1(abar,a);
    xor diff (Diff,a,b);
    and borr (Borr,abar,b);
endmodule
