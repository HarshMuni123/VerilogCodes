`timescale 1ps/1ps
`include "carry_4bit_lookahead.v"

module carry_lookahead_tb;
    reg [3:0] A, B;
    reg cin;
    wire [3:0] s;
    wire cout;

    carry_4bit_lookahead uut (
        .A(A),
        .B(B),
        .cin(cin),
        .s(s),
        .cout(cout)
    );

    initial begin
        $display("Time\tA    B    CIN | SUM  COUT");
        $monitor("%t\t%b %b %b | %b %b", $time, A, B, cin, s, cout);

        cin = 0;
        #10 A = 4'd8;  B = 4'd5;
        #10 A = 4'd9;  B = 4'd7;
        #10 A = 4'd4;  B = 4'd5;
        cin = 1;
        #10 A = 4'd8;  B = 4'd3;
        #10 A = 4'd13; B = 4'd5;
        #10 $finish;
    end
endmodule
