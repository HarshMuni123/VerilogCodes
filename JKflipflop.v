
module JKflipflop(J,K,clk,q);
    input J,K,clk;
    output reg q;

    always @(posedge clk) begin
        case({J,K})
            2'b00: q <= q;
            2'b01: q <= 0;
            2'b10: q <= 1;
            2'b11: q <= ~q;
        endcase
    end
endmodule