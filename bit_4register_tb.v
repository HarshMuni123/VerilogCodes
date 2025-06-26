
`timescale 1ps/1ps
`include "bit_4register.v"
`include "DFF.v"
`include "mux2to1.v"

module bit_4register_tb;
    reg [3:0]D;
    reg clk;
    reg load;
    wire [3:0]q;

        bit_4register uut (
        .D(D),
        .clk(clk),
        .load(load),
        .q(q)
    );
    // initial clk=0;
    always #5 clk = ~clk;

    initial begin
        $display("\t TIME load CLK D | Q");
        $monitor("\t time=%t load=%b clk=%b D=%b | q=%b",$time,load,clk,D,q);

        clk = 0;
        load = 0;
        D = 4'b0000;

        #7  load = 1; D = 4'b1010;  // At clk = 1 → Q should become 1010
        #9  load = 1; D = 4'b1100;  // At next clk = 1 → Q becomes 1100
        #5  load = 0; D = 4'b0011;  // No load → Q should stay 1100
        #7  load = 1; D = 4'b1001;  // Load on rising clk → Q becomes 1001
        #10 load = 1; D = 4'b1111;  // Load again
        #4  load = 0;               // Hold
        #6  load = 1; D = 4'b0101;  // Load again
        #10 $finish;
    end
endmodule