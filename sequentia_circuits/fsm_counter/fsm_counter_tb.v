

`timescale 1ns / 1ps

module fsm_counter_tb;

    reg clk;
    reg din;
    reg reset;
    wire [1:0] z;

    // Instantiate the FSM
    fsm_counter uut (
        .clk(clk),
        .din(din),
        .reset(reset),
        .z(z)
    );

    // Clock generation: 10ns period
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        din = 0;

        // Hold reset high initially
        #10;
        reset = 0;

        // Stimulus
        $display("Time\tclk\treset\tdin\tz");
        $monitor("%0t\t%b\t%b\t%b\t%b", $time, clk, reset, din, z);

        // Test pattern
        #10 din = 1;  // s0 -> s1
        #10 din = 1;  // s1 -> s2
        #10 din = 0;  // stay in s2
        #10 din = 1;  // s2 -> s3
        #10 din = 1;  // s3 -> s0
        #10 din = 0;  // stay in s0
        #10 din = 1;  // s0 -> s1
        #10 reset = 1; // reset to s0
        #10 reset = 0;
        #10 din = 1;  // s0 -> s1

        #20 $finish;
    end

endmodule
