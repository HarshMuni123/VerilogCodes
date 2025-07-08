`timescale 1ns / 1ps

module testbench();
    reg clk, signal;
    wire rise;
    
    edge_detector dut (
        .clk(clk),
        .signal(signal),
        .rise(rise)
    ); 

    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Stimulus generation (synchronized with clk)
    initial begin

        @(posedge clk); signal = 0; #1
        $display("clk=%b \t signal=%b \t rise=%b",clk, signal, rise);
        
        @(posedge clk); signal = 1; #1
        $display("clk=%b \t signal=%b \t rise=%b",clk, signal, rise);
        
        @(posedge clk); signal = 1;#1
        $display("clk=%b \t signal=%b \t rise=%b",clk, signal, rise);
        
        @(posedge clk); signal = 0;#1
        $display("clk=%b \t signal=%b \t rise=%b",clk, signal, rise);
        
        @(posedge clk); signal = 1; #1
        $display("clk=%b \t signal=%b \t rise=%b",clk, signal, rise);
        
        @(posedge clk); signal = 0;#1
        $display("clk=%b \t signal=%b \t rise=%b",clk, signal, rise);
        
        @(posedge clk); signal = 0;#1
        $display("clk=%b \t signal=%b \t rise=%b",clk, signal, rise);

        @(posedge clk); $finish;
    end
endmodule
