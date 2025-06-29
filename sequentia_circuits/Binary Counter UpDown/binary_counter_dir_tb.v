`timescale 1ns / 1ps

module binary_counter_dir_tb;

    reg clk;
    reg dir;
    reg reset;
    wire [3:0] count;

    // Instantiate the counter module
    binary_counter_dir uut (
        .clk(clk),
        .dir(dir),
        .reset(reset),
        .count(count)
    );

    // Clock generation (10ns period = 100 MHz)
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        dir = 1;  // Start with counting up

        // Apply reset
        #10;
        reset = 0;

        // Count up from 0 to 15
        #160;

        // Count down from 15 to 0
        dir = 0;
        #160;

        // Assert reset during operation
        reset = 1;
        #10;
        reset = 0;

        // Count up again
        dir = 1;
        #100;

        $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time=%0t | Reset=%b | Dir=%b | Count=%d", $time, reset, dir, count);
    end

endmodule
