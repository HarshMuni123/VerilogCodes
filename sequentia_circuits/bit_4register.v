// we will use clear and load using MUX system

module bit_4register(
    input [3:0]D,
    input clk,
    input load,
    output wire [3:0]q
);
    wire [3:0]s;
    mux2to1 m1(q[0],D[0],load,s[0]);
    mux2to1 m2(q[1],D[1],load,s[1]);
    mux2to1 m3(q[2],D[2],load,s[2]);
    mux2to1 m4(q[3],D[3],load,s[3]);

    DFF d0(s[0],clk,q[0]);
    DFF d1(s[1],clk,q[1]);
    DFF d2(s[2],clk,q[2]);
    DFF d3(s[3],clk,q[3]);

endmodule
