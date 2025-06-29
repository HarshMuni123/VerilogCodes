
`timescale 1ns / 1ps

module binary_counter_dir(clk,dir,reset,count);
    input clk,dir,reset;
    output reg [3:0]count;
    
    always @(posedge clk) begin
        if(reset)
            count <= 4'b0;
        else if (dir ==0 && count == 4'b0)
            count <= 4'd15;
         else if(dir ==1 && count == 4'd15)
            count <= 4'b0;
         else
            count = dir? (count + 1):(count - 1);
    end
    
endmodule
