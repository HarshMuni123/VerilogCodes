`timescale 1ps/1ps

module fsm_up_down_counter(clk, reset, dir, out);
    input clk, reset, dir;
    output reg [1:0] out;
    
    reg [1:0] state;
    
    parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11;

    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= s0;
        else begin
            case (state)
                s0: state <= (dir) ? s3 : s1;
                s1: state <= (dir) ? s0 : s2;
                s2: state <= (dir) ? s1 : s3;
                s3: state <= (dir) ? s2 : s0;
            endcase
        end
    end

    always @(state) begin
        case (state)
            s0: out = 2'b00;
            s1: out = 2'b01;
            s2: out = 2'b10;
            s3: out = 2'b11;
        endcase
    end
endmodule
