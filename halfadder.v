`timescale 1ns/1ps
module halfdder(a,b,s,c);
input a,b;
output s,c;

assign s = a^b;
assign c=a&b;
endmodule

module halfadder_tb;
reg a,b;
wire s,c;

halfdder dut(.a(a),.b(b),.s(s),.c(c));

initial begin

    $dumpfile("wave.vcd");
    $dumpvars(0, halfadder_tb);  // Replace with your top testbench module name
    
    $display("A B SUM CARRY");
    $monitor("%t %b %b %b %b",$time,a,b,s,c);

    #10 a=0;b=0;
    #10 a=0;b=1;
    #10 a=1;b=0;
    #10 a=1;b=1;
    #10 $finish;
end
endmodule

// iverilog -o halfadder.out halfadder.v
// vvp halfadder.out


