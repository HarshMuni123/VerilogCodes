
module DFF(
    input D,
    input clk,
    output reg q
);
    always @(posedge clk) begin
        q<=D;
    end
endmodule
