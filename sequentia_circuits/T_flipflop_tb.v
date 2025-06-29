
`timescale 1ps/1ps
`include "T_flipflop.v"

module T_flipflop_tb;
    reg T,clk;
    wire q;

    T_flipflop uut (.T(T),.clk(clk),.q(q));

    initial begin
        clk=0;
        forever #5 clk = ~clk;
    end

    initial begin
        $display("\t TIME CLK T | Q");
        $monitor("\t %t %b %b | %b",$time,clk,T,q);
        T=0;
        #5 T = 1;
        #5 T = 0;
        #5 T = 1;
        #5 T = 1;
        #5 T = 0;
        #5 T = 1;
        $finish;
    end
endmodule
