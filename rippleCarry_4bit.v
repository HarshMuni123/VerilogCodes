
`include "full_adder.v"

module rippleCarry_4bit(
    input [3:0]A,
    input [3:0]B,
    input mode,
    output cout,
    output wire [3:0]s
);
    wire [2:0]carry;
    wire  [3:0]B_xor;

    assign B_xor = B ^ {4{mode}};

    full_adder f0 (A[0],B_xor[0],mode,carry[0],s[0]);
    full_adder f1 (A[1],B_xor[1],carry[0],carry[1],s[1]);
    full_adder f2 (A[2],B_xor[2],carry[1],carry[2],s[2]);
    full_adder f3 (A[3],B_xor[3],carry[2],cout,s[3]);

endmodule