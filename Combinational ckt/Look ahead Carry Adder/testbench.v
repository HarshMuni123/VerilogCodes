
`timescale 1ns / 1ps

module testbench();
    reg [3:0]A,B;
    reg cin;
    wire [3:0]sum;
    wire cout;
    
    lookahead dut (
        .A(A),
        .B(B),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );
    
    initial begin
        $display("DESINED USING LOOKAHEAD CARRY ADDER");
        $display("------------------------------------------");
        $monitor("A=%b B=%b CIN=%b | SUM=%b COUT=%b",A,B,cin,sum,cout);
        
        A = 4'b1011 ; B = 4'b1001 ; cin = 0; #10
        A = 4'b1111 ; B = 4'b1111 ; cin = 1; #10
        A = 4'b1111; B = 4'b1111 ; cin = 0; #10
        A = 4'b1001; B = 4'b0011; cin = 1; #10
        
        $finish;
        
    end
    
endmodule
