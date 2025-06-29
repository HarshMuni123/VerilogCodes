`timescale 1ps/1ps
`include "counter_4bit_async.v"

module counter_4bit_tb;

    reg clk;
    reg reset;
    wire [3:0] count;

    counter_4bit_async uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    always #5 clk = ~clk;

    initial begin

        clk = 0;
        reset = 1;

        #10 reset = 0; 
        #200 $finish;   
    end

    always @(posedge clk) begin
        $display("Time: %0t | Count: %d", $time, count);
    end

endmodule
