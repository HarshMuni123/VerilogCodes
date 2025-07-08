
`timescale 1ns / 1ps

module edge_detector(
    input clk,
    input signal,
    output rise    
); 
    reg prev = 0,curr = 0;
    
    always @(posedge clk) begin
        prev <= curr;
        curr <= signal;
    end
    assign rise = ~prev & curr;
    
endmodule
