

`timescale 1ns / 1ps

module sipo_tb();
    reg clk,rst,serial_in;
    wire [3:0] parallel_out;
    
    sipo dut (
        .clk(clk),
        .rst(rst),
        .serial_in(serial_in),
        .parallel_out(parallel_out)
    );
    
    always @(posedge clk) begin
        #1
        $display("clk = %b | rst = %b | serial in = %b | parallel out = %b",clk,rst,serial_in,parallel_out);
    end
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
    
        rst = 1;serial_in = 0;
        #12
        rst = 0;
        
        #10 serial_in = 0;
        #10 serial_in = 1;
        #10 serial_in = 0;
        #10 serial_in = 1;
        #10 serial_in = 1;
        #10 serial_in = 0;
        #10 serial_in = 1;
        #10 serial_in = 0;
        #10 serial_in = 0;
        
        #2 $finish;
        
    end
endmodule
