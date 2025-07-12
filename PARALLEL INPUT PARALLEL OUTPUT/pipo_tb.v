

`timescale 1ns / 1ps

module pipo_tb();
    reg clk,rst;
    reg [3:0] parallel_in;
    wire [3:0] parallel_out;
    
    pipo uut ( 
        .clk(clk),
        .rst(rst),
        .parallel_in(parallel_in),
        .parallel_out(parallel_out)
    );
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        $monitor(" clk = %b rst = %b parallel in = %b parallel out = %b",clk,rst,parallel_in,parallel_out);
        
        rst = 1; parallel_in = 0;
        #12 rst = 0;
        
        #10 parallel_in = 4'b1011;
        #10 parallel_in = 4'b1111;
        #10 parallel_in = 4'b0001;
        #10 parallel_in = 4'b1000;
        #10 parallel_in = 4'b0101;
        #3 $finish;
        
    end
    
endmodule
