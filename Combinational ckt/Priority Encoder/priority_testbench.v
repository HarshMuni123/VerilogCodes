
`timescale 1ns / 1ps

module priority_testbench();
    reg [3:0]I; 
    wire [1:0]Y;
    priority_encoder dut(
        .I(I),
        .Y(Y)
        );
    initial begin
        $display("I Y");
        $monitor("%b %b",I,Y);
        
        #10 I = 4'b1010;
        #10 I = 4'b0101;
        #10 I = 4'b0011;
        #10 I = 4'b1000;
        #10 I = 4'b1111;
        #5 $finish;
        
    end
endmodule
