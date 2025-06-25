
module d_flipflop(D,clk,q);
    input D,clk;
    output reg q;

    always @(posedge clk) 
    begin
        q<=D;
    end
endmodule