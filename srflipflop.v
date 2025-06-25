module srflipflop(s,r,clk,q,qbar);
    input s,r,clk;
    output reg q;
    output qbar;

    assign qbar = ~q;
    
    always @(posedge clk)
        begin
            case({s,r})
                2'b00: q<=q;
                2'b01: q<=0;
                2'b10: q<=1;
                2'b11: q<=1'bx;
            endcase
        end
endmodule
