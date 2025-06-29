`timescale 1ns / 1ps

module fsm_counter(
    input clk,
    input din,
    input reset,
    output reg [1:0] z
);
    parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11;

    reg [1:0] state, next_state;

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= s0;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            s0: next_state = din ? s1 : s0;
            s1: next_state = din ? s2 : s1;
            s2: next_state = din ? s3 : s2;
            s3: next_state = din ? s0 : s3;
            default: next_state = s0;
        endcase
    end

    // Output logic
    always @(*) begin
        z = state;
    end

endmodule
