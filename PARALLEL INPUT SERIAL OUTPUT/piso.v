


`timescale 1ns / 1ps

module piso #(parameter WIDTH = 4)(
    input clk,
    input rst,
    input load,
    input [WIDTH-1:0] parallel_in,
    output reg serial_out
); 
  reg [WIDTH-1:0] shift_reg;
  
  always @(posedge clk or posedge rst) begin
    if (rst) begin
        shift_reg <= 0;
        serial_out <= 0;
    end
    else if (load) begin
        shift_reg <= parallel_in;
        serial_out <= parallel_in[WIDTH-1];
    end
    else begin
        shift_reg <= {shift_reg[WIDTH-2:0], 1'b0};
        serial_out <= shift_reg[WIDTH-1];
    end
end

    
endmodule
