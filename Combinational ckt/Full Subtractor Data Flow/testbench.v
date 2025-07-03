`timescale 1ns / 1ps

module dataflow_testbench();
    reg a,b,bin;
    wire Diff,Borr;
    integer i,j,k;
    full_subtractor dut (
        .a(a),
        .b(b),
        .bin(bin),
        .Diff(Diff),
        .Borr(Borr)
    );
    initial begin
        $display("A B Bin | DIFF BORR");
        #2;
        for(i=0;i<2;i=i+1) begin
            for(j=0;j<2;j=j+1) begin
                for(k=0;k<2;k=k+1) begin
                a=i;
                b=j;
                bin=k;
                #2
                $display("A=%b B=%b Bin=%b | Diff=%b Borr=%b",a,b,bin,Diff,Borr);
                #10;
              end
            end
        end
        
    end
endmodule
