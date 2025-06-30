`timescale 1ps/1ps
`include "fsm_up_down_counter.v"

module fsm_up_down_testbench();
    reg clk, reset, dir;
    wire [1:0] out;

    fsm_up_down_counter uut (
        .clk(clk),
        .reset(reset),
        .dir(dir),
        .out(out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $display("TIME\tCLK\tRESET\tDIR\tOUT");
        $monitor("time=%t\tclk=%b\treset=%b\tdir=%b\tout=%b", $time, clk, reset, dir, out);

        dir = 0;
        reset = 1;
        #20 reset = 0;
        #100;

        dir = 1;
        #100;

        $finish;
    end
endmodule
