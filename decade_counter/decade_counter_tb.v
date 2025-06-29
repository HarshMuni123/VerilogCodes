
`timescale 1ns / 1ps

module decade_counter_tb();
    reg clk,reset;
    wire [3:0]count;
    
    decade_counter dut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );
    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end
    initial begin
        $display("TIME RESET COUNT");
        $monitor("%t %b %b",$time,reset,count);
        
        reset = 1;
        #25 reset = 0;
        
        #300;
        $finish;
    end
endmodule
