
module ring_counter(
    input clk,
    input reset,
    output reg [3:0]q
);
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            q <= 4'b0001;
        end              // 0001 -> 0010 -> 0100 -> 1000 -> 0001
        else begin
            q <= {q[2:0],q[3]};
        end
    end
endmodule