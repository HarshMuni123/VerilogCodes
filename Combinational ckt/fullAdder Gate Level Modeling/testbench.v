`timescale 1ns / 1ps

module testbench();
    reg a,b,cin;
    wire sum,cout;
    full_adder dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );
     // github telegram
    initial begin
        $display("\t A B CIN | SUM COUT");
        $monitor("\t A=%b B=%b Cin=%b | sum=%b cout=%b",a,b,cin,sum,cout);
        
        cin=0;
        #10 a=0;b=0;
        #10 a=0;b=1;
        #10 a=1;b=0;
        #10 a=1;b=1;
        
        #5 cin=1;
        #10 a=0;b=0;
        #10 a=0;b=1;
        #10 a=1;b=0;
        #10 a=1;b=1;
        
        #3;
        $finish;
        
    end
    
endmodule
