

`timescale 1ns / 1ps

module sipo #(parameter WIDTH = 4)(
    input clk,
    input rst,
    input serial_in,
    output reg [WIDTH-1 :0] parallel_out  
);
    always @(posedge clk or posedge rst) begin
        if(rst)
            parallel_out <= 4'b0000;
        else
            parallel_out <= {parallel_out[WIDTH-2:0],serial_in};
    end

endmodule
