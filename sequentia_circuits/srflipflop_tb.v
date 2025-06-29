`timescale 1ps/1ps
`include "srflipflop.v"

module srflipflop_tb;
    reg clk,s,r;
    wire q,qbar;

    srflipflop uut (.s(s),.r(r),.clk(clk),.q(q),.qbar(qbar));

    initial begin
        clk=0;
        forever #5 clk = ~clk;
    end

    initial begin
        $display("\tTIME | CLK S R | Q QBAR");
        $monitor("\t %t | %b %b %b | %b %b",$time,clk,s,r,q,qbar);

       #10  s = 0; r = 0;
       #10  s = 1; r = 0;
       #10  s = 0; r = 1;
       #10  s = 1; r = 1;  
       #10  s = 0; r = 0;
        $finish;

    end
endmodule

// iverilog -o srlatch_out.vvp srlatch_tb.v
// vvp srlatch_out.vvp
