`timescale 1ps/1ps

module fsm_1011_pattern(
    input clk,
    input reset,
    input in_bit,
    output reg out_detected
);

    // State encoding
    parameter s0 = 3'b000, 
              s1 = 3'b001, 
              s10 = 3'b010, 
              s101 = 3'b011;

    reg [2:0] state, next_state;

    // State transition
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= s0;
        else
            state <= next_state;
    end

    // Next state and output logic (Mealy)
    always @(*) begin
        out_detected = 0; // default
        case (state)
            s0: begin
                next_state = (in_bit) ? s1 : s0;
            end
            s1: begin
                next_state = (in_bit) ? s1 : s10;
            end
            s10: begin
                next_state = (in_bit) ? s101 : s0;
            end
            s101: begin
                if (in_bit) begin
                    next_state = s1;
                    out_detected = 1;
                end else begin
                    next_state = s10;
                    out_detected = 0;
                end
            end
            default: next_state = s0;
        endcase
    end

endmodule
