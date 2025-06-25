
module T_flipflop(T,clk,q);
    input T,clk;
    output reg q;

    initial q=0;  // need to initalized some values else displays x

    always @(posedge clk)
    begin
        if(T)
            q <= ~q;
    end
endmodule