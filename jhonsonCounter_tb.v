`timescale 1ps/1ps
`include "jhonson_counter.v"

module jhonsonCounter_tb;
    reg clk,reset;
    wire [3:0]q;

    jhonson_counter uut (
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
    #12 reset = 0; 

    #160;

    $finish;
  end

endmodule