
`timescale 1ps/1ps
`include "d_flipflop.v"

module d_flipflop_tb;
    reg D,clk;
    wire q;

    d_flipflop uut (.D(D),.clk(clk),.q(q));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $display("\t TIME CLK D | Q");
        $monitor("\t %t %b %b | %b",$time,clk,D,q);
        D=0;
        #5 D = 1;
        #5 D = 0;
        #5 D = 1;
        $finish;
    end
endmodule