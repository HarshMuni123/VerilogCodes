

`timescale 1ns / 1ps

module mealy_fsm(
    input clk,
    input reset,
    input in_bit,
    output reg out
);
    parameter s0 = 1'b0,s1 = 1'b1;
    reg state,next_state;
    
    always @(posedge clk) begin
        if(reset)
            state <= s0;
        else
            state <= next_state;
    end
    
    always @(*) begin
        out = 0;
        case(state)
            s0: next_state = (in_bit)?s0:s1;
            s1: begin
                if(in_bit) begin
                    next_state = s0;
                    out = 1;
                end
                else
                    next_state = s1;
                    
            end
            default: next_state = s0;
         endcase
    end
    
endmodule
