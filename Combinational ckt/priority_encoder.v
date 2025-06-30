
`timescale 1ns / 1ps

module priority_encoder(
    input [3:0] I,
    output reg [1:0]Y
);
    always @(*) begin
        casez(I)
        4'b1??? : Y = 2'b11;
        4'b01?? : Y = 2'b10;
        4'b001? : Y = 2'b01;
        4'b0001: Y = 2'b00;
       endcase
    end
endmodule
