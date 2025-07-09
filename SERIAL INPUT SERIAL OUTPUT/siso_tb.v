

`timescale 1ns / 1ps

module siso_tb();
    reg clk,rst,serial_in;
    wire serial_out;
    
    siso dut (
        .clk(clk),
        .rst(rst),
        .serial_in(serial_in),
        .serial_out(serial_out)
    );
    
     initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    always @(posedge clk) begin
        #1
        $display("clk = %b | rst = %b | serial_in = %b | serial_out = %b | shift register = %b",
                 clk, rst, serial_in, serial_out, dut.shift_reg);
    end
    
    initial begin
        rst = 1;
        serial_in = 0;
        #12
        rst = 0;
        
        serial_in = 0; #10
        serial_in = 1; #10
        serial_in = 0; #10
        serial_in = 1; #10
        serial_in = 0; #10
        serial_in = 1; #10
        serial_in = 1; #10
        serial_in = 0; #10
        serial_in = 0; #10
        
        $finish;
        
    end
    
endmodule
