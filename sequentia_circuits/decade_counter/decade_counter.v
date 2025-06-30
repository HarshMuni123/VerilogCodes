


`timescale 1ns / 1ps

module decade_counter(
    input clk,
    input reset,
    output reg [3:0]count
);
    always @(posedge clk) begin
        if(reset) 
            count <= 4'b0;
         else if (count == 4'b1001)
            count <= 4'b0;
         else
            count <= count + 1;
    end
    
endmodule
