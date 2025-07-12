

`timescale 1ns / 1ps

module piso_tb();
    reg clk,rst,load;
    reg [3:0] parallel_in;
    wire serial_out;
    
    piso dut (
        .clk(clk),
        .rst(rst),
        .load(load),
        .parallel_in(parallel_in),
        .serial_out(serial_out)
    );
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end
    
    always @(posedge clk) begin
        #1
        $display("clk = %b | rst = %b | load = %b | parallel_in = %b | serial_out = %b shift_reg = %b",clk,rst,load,parallel_in,serial_out,dut.shift_reg);
    end
    
    initial begin
        rst = 1; load = 0; parallel_in = 4'b0000;
        #12
        rst = 0;
        
        parallel_in = 4'b1001;
        load = 1; #10;     
        load = 0; #40;     

        parallel_in = 4'b1100;
        load = 1; #10;
        load = 0; #40;

        parallel_in = 4'b0110;
        load = 1; #10;
        load = 0; #40;
        
        #3 $finish;
    end
    
endmodule
