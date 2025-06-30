
`timescale 1ps/1ps
`include "fsm_1011_pattern.v"

module fsm_pattern_1011_testbench;
    reg clk,reset,in_bit;
    wire out_detected;

    fsm_1011_pattern dut (
        .clk(clk),
        .reset(reset),
        .in_bit(in_bit),
        .out_detected(out_detected)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $display("Time\tin_bit\tDetected");
        $monitor("%0t\t%b\t%b", $time, in_bit, out_detected);

        reset = 1;
        in_bit = 0;
        #10;

        reset = 0;

        // Input Sequence: 1011 (should detect at last 1)
        in_bit = 1; #10;
        in_bit = 0; #10;
        in_bit = 1; #10;
        in_bit = 1; #10; // Pattern "1011" -> detected

        // Overlapping pattern: 1011 011 (2nd "1011" starts from 2nd bit)
        in_bit = 0; #10;
        in_bit = 1; #10;
        in_bit = 1; #10;

        // Add some random bits
        in_bit = 0; #10;
        in_bit = 1; #10;
        in_bit = 0; #10;
        in_bit = 1; #10;
        in_bit = 1; #10; // Another "1011" here

        $finish;
    end

endmodule