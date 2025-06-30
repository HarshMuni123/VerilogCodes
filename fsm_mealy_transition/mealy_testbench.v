`timescale 1ns / 1ps

module mealy_testbench;

    // Inputs
    reg clk;
    reg reset;
    reg in_bit;

    // Output
    wire out;

    // Instantiate the FSM
    mealy_fsm uut (
        .clk(clk),
        .reset(reset),
        .in_bit(in_bit),
        .out(out)
    );

    // Clock generation: 10ns period
    always #5 clk = ~clk;

    // Stimulus
    initial begin
        $display("Time\tclk\treset\tin_bit\tout");
        $monitor("%g\t%b\t%b\t%b\t%b", $time, clk, reset, in_bit, out);
        
        // Initialize
        clk = 0;
        reset = 1;
        in_bit = 0;

        // Apply reset
        #10 reset = 0;

        // Test pattern: apply input bits to detect 01 pattern
        // Sequence: 0 1 0 1 1 0 0 1
        #10 in_bit = 0;  // Expect no output
        #10 in_bit = 1;  // Detects 01 → out = 1
        #10 in_bit = 0;  // Expect no output
        #10 in_bit = 1;  // Detects 01 → out = 1
        #10 in_bit = 1;  // No output (11)
        #10 in_bit = 0;  // No output
        #10 in_bit = 0;  // No output
        #10 in_bit = 1;  // Detects 01 → out = 1

        #20 $finish;
    end

endmodule
