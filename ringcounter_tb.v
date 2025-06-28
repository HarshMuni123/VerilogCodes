
`timescale 1ps/1ps
`include "ring_counter.v"

module ringcounter_tb;
    reg clk,reset;
    wire [3:0]q;

    ring_counter uut(
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    initial begin
        clk=0;
        forever #5 clk = ~clk;
    end

    initial begin
        $display("Time\tReset\tQ");
    $monitor("%0t\t%b\t%b", $time, reset, q);

        reset = 1;
        #10 reset = 0;

        #160
        $finish;
    end
endmodule