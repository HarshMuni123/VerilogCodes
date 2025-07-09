
`timescale 1ps/1ps

`include "mux2to1.v"

module mux4to1 (
    input [3:0]I,
    input [1:0]sel,
    output out
);
    wire w1,w2;

    mux2to1 m1 (I[0],I[1],sel[0],w1);
    mux2to1 m2 (I[2],I[3],sel[0],w2);

    mux2to1 m3 (w1,w2,sel[1],out);

endmodule






// s1 s0 | I
// 0 0    i0
// 0 1    i1


// 1 0    i2
// 1 1    i3 