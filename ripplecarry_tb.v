`timescale 1ps/1ps
`include "rippleCarry_4bit.v"

module ripplecarry_tb;
    reg [3:0]A;
    reg [3:0]B;
    reg mode;
    wire [3:0]s;
    wire cout;
    rippleCarry_4bit uut(
        .A(A),
        .B(B),
        .mode(mode),
        .cout(cout),
        .s(s)
    );

    initial begin
        $display("Time\tMode\tA\tB\tResult\tCout");
        $monitor("%0dns\t%b\t%b\t%b\t%b\t%b", $time, mode, A, B, s, cout);

        // Test ADDITION (mode = 0)
        mode = 0;

        A = 4'b0011; B = 4'b0001; #10;  // 3 + 1 = 4
        A = 4'b0110; B = 4'b0011; #10;  // 6 + 3 = 9
        A = 4'b1111; B = 4'b0001; #10;  // 15 + 1 = 0 (overflow)

        // Test SUBTRACTION (mode = 1)
        mode = 1;

        A = 4'b0110; B = 4'b0011; #10;  // 6 - 3 = 3
        A = 4'b1000; B = 4'b0001; #10;  // 8 - 1 = 7
        A = 4'b0011; B = 4'b0100; #10;  // 3 - 4 = 15 (since 2's comp wraparound)

        $finish;
    end

endmodule
