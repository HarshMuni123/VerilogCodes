
module jhonson_counter(
    input clk,
    input reset,
    output reg [3:0]q
);
    always @(posedge clk or posedge reset) begin
        if(reset)
            q <= 4'b0;
        else 
            q <= {~q[0],q[3:1]};   // 0000 then 1000 then 1100
    end
endmodule