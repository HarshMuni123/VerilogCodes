
`timescale 1ns / 1ps

module testbench;
    reg a, b, cin;
    wire sum, cout;

    integer i, j, k;

    // Instantiate the full adder
    full_adder dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        $display("A B Cin | Sum Cout");
        $display("---------------");

        for (i = 0; i < 2; i = i + 1) begin  // for a
            for (j = 0; j < 2; j = j + 1) begin  // for b
                for (k = 0; k < 2; k = k + 1) begin  // for cin
                    a = i;
                    b = j;
                    cin = k;
                    #10;
                    $display("%b %b  %b  |  %b    %b", a, b, cin, sum, cout);
                end
            end
        end
    end
endmodule