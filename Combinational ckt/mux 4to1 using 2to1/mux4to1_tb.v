
`timescale 1ps/1ps

`include "mux4to1.v"

module mux4to1_tb();
    reg [3:0]I;
    reg [1:0] sel;
    wire out;

    mux4to1 dut (
        .I(I),
        .sel(sel),
        .out(out)
    );

    initial begin
        I = 4'b0000; sel = 2'b00;
        $monitor("I = %b sel = %b | out = %b",I,sel,out);

        #10 sel = 2'b00 ; I = 4'b0001;
        #10 sel = 2'b01 ; I = 4'b0010;
        #10 sel = 2'b10 ; I = 4'b0100;
        #10 sel = 2'b11 ; I = 4'b1000;

        #10 sel = 2'b00 ; I = 4'b0010;
        #10 sel = 2'b01 ; I = 4'b0011;
        #10 sel = 2'b10 ; I = 4'b1000;
        #10 sel = 2'b11 ; I = 4'b0100;
        #2
        $finish;

    end

endmodule
