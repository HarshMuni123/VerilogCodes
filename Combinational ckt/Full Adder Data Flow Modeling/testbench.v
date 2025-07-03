
`timescale 1ns / 1ps

module testbench();
    reg a,b,cin;
    wire cout,sum;
    
    full_adder dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );
    
    initial begin
        $display("A B CIN | SUM COUT");
        $monitor("%t %b %b %b | %b %b",$time,a,b,cin,sum,cout);
        
        cin = 0;
        #10 a = 1;b=0;
        #10 a=0 ; b=1;
        
        #5;
        
        cin = 1;
        #10 a = 1;b=0;
        #10 a=0 ; b=1;
        
        $finish;
    end
    
endmodule
