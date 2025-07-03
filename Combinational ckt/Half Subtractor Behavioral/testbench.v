`timescale 1ns / 1ps

module dataflow_testbench();
    reg a,b;
    wire Diff,Borr;
    integer i,j;
    half_subtractor dut (
        .a(a),
        .b(b),
        .Diff(Diff),
        .Borr(Borr)
    );
    initial begin
        $display("A B | DIFF BORR");
        #2;
        for(i=0;i<2;i=i+1) begin
            for(j=0;j<2;j=j+1) begin
                a=i;
                b=j;
                #2
                $display("A=%b B=%b | Diff=%b Borr=%b",a,b,Diff,Borr);
                #10;
            end
        end
        
    end
endmodule
