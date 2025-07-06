
`timescale 1ns / 1ps

module testbench();
    reg [3:0]A,B;
    reg cin;
    wire [3:0]sum;
    wire cout;
    
    bit_4adder dut (
        .A(A),
        .B(B),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );
    
    initial begin
        $display("4 BIT ADDER");
        $monitor("\t A = %b \t B = %b \t Cin = %b | \t Sum = %b \t Cout = %b",A,B,cin,sum,cout);
        
        #2
        A=4'b1011;B=4'b0001;cin=0; #10
        A=4'b1011;B=4'b0001;cin=1; #10
        A=4'b1000;B=4'b1111;cin=0; #10
        A=4'b1000;B=4'b1111;cin=1; #10
        
        $finish;
        
    end
    
endmodule
