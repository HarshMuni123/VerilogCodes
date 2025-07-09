


`timescale 1ns / 1ps

module siso #(parameter WIDTH = 4) (
    input clk,
    input rst,
    input serial_in,
    output serial_out
);
    reg [WIDTH-1:0] shift_reg;
    
    assign serial_out = shift_reg[WIDTH-1];
    
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            shift_reg <= 0;
            end
        else begin
            shift_reg <= {shift_reg[WIDTH-2:0],serial_in};
        end
        
    end
    
endmodule
