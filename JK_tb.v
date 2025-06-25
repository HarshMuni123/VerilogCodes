`timescale 1ps/1ps
`include "JKflipflop.v"

module JK_tb;
    reg J,K,clk;
    wire q;

    JKflipflop uut (
        .J(J),
        .K(K),
        .clk(clk),
        .q(q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $display("\tTIME CLK J K | Q(NEXT)");
        $monitor("time = %t CLK = %b J = %b J = %b | Q(NEXT) = %b",$time,clk,J,K,q);

        J = 0; K =0;     // clk = 0
        #5 J = 1; K =0;  // clk = 1
        #5 J = 1; K =1;  // clk = 0
        #5 J = 0; K =1;  // clk = 1
        #5 J = 1; K =1;  // clk = 0
        #5 J = 1; K =1;  // clk = 1
        #5 J = 0; K =1;  // clk = 0
        $finish;
    end
endmodule