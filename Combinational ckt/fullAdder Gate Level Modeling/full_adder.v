
`timescale 1ns / 1ps          // data flow --> gate level

module full_adder(
    input a,
    input b,
    input cin,
    output sum,
    output cout
);
    wire p,q,r;
    xor x1 (p,a,b);
    and x2 (q,a,b);
    xor x3 (sum,p,cin);  // sum
    and x4 (r,p,cin);
    or x5 (cout,r,q); // cout
endmodule
