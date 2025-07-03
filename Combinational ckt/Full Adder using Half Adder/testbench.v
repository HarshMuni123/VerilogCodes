

`timescale 1ns / 1ps

module testbench();
    reg [3:0]a,b;
    reg cin;
    wire [3:0]sum;
    wire cout; 
    
    integer i,j,k;
    
    full_4bit_adder dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    ); 
    
    initial begin
        $display("A B CIN | SUM COUT");
        #7;
        for(i=0;i<16;i=i+1) begin
            for(j=0;j<16;j=j+1) begin
                for(k=0;k<2;k=k+1) begin
                a = i;
                b = j;
                cin = k;
                #6
                $display("A=%B B=%B CIN=%B | SUM=%B COUT=%B",a,b,cin,sum,cout);
                #20;
                end
            end
        end
        #6 $finish;
    end

endmodule
