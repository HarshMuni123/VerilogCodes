module carry_4bit_lookahead (
    input [3:0] A, B,
    input cin,
    output [3:0] s,
    output cout
);
    wire [3:0] G, P;
    wire [3:0] C;

    assign G = A & B;
    assign P = A ^ B;

    assign C[0] = cin;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]);
    assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C[0]);
    assign cout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) |
                  (P[3] & P[2] & P[1] & G[0]) |
                  (P[3] & P[2] & P[1] & P[0] & C[0]);

    assign s = P ^ C;
endmodule
