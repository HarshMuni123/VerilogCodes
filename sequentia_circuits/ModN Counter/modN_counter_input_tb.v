`timescale 1ns / 1ps

module modN_counter_input_tb;

    reg clk = 0;
    reg reset;
    reg [5:0] modN;
    wire [5:0] count;

    modN_counter uut (
        .clk(clk),
        .reset(reset),
        .modN(modN),
        .count(count)
    );

    // Clock: Toggle every 5ns
    always #5 clk = ~clk;

    initial begin
        $monitor("Time=%0t | Reset=%b | modN=%d | Count=%d", $time, reset, modN, count);

        // Initial
        reset = 1;
        modN = 6'd10;
        #10;

        // Start counting
        reset = 0;
        #150;

        // Change modN dynamically
        modN = 6'd7;
        #100;

        modN = 6'd20;
        #130;

        modN = 6'd0;  // Invalid modN test
        #30;

        $finish;
    end

endmodule
