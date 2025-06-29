`timescale 1ns / 1ps

module modN_counter (
    input wire clk,
    input wire reset,
    input wire [5:0] modN,       // Dynamic modulus (max 63)
    output reg [5:0] count       // 6-bit counter
);

    always @(posedge clk) begin
        if (reset)
            count <= 6'd0;
        else if (modN < 2 || modN > 6'd63) // guard against invalid modulus
            count <= 6'd0;                 // hold at 0 or reset
        else if (count == (modN - 1))
            count <= 6'd0;
        else
            count <= count + 1;
    end

endmodule
