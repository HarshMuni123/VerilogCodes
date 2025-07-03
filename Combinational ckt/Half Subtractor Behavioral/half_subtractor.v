
// Behavioral Modeling

`timescale 1ns / 1ps

module half_subtractor(
    input a,
    input b,
    output reg Diff,
    output reg Borr
);
    always @(*) begin
        case({a,b})
            2'b00:begin
                Diff=0;
                Borr=0;
            end
            2'b01:begin
                Diff=1;
                Borr=1;
            end
            2'b10:begin
                Diff=1;
                Borr=0;
            end
            2'b11:begin
                Diff=0;
                Borr=0;
            end
         endcase
    end
endmodule
