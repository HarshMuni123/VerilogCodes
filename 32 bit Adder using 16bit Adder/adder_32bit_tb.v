
`timescale 1ns / 1ps

module adder_32bit_tb;

    // Inputs
    reg [31:0] a;
    reg [31:0] b;

    // Outputs
    wire [31:0] sum;
    wire cout;

    // Instantiate the Unit Under Test (UUT)
    adder_32bit uut (
        .a(a),
        .b(b),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        // Monitor changes
        $monitor("Time=%0t | a=%h b=%h | sum=%h cout=%b", $time, a, b, sum, cout);

        // Test case 1: Basic addition
        a = 32'h00000001;
        b = 32'h00000001;
        #10;

        // Test case 2: Max 16-bit value + 1
        a = 32'h0000FFFF;
        b = 32'h00000001;
        #10;

        // Test case 3: Carry from lower to upper 16 bits
        a = 32'h0000FFFF;
        b = 32'h00000001;
        #10;

        // Test case 4: Max 32-bit value + 0
        a = 32'hFFFFFFFF;
        b = 32'h00000000;
        #10;

        // Test case 5: Max 32-bit value + 1 (overflow)
        a = 32'hFFFFFFFF;
        b = 32'h00000001;
        #10;

        // Test case 6: Random values
        a = 32'hA5A5A5A5;
        b = 32'h5A5A5A5A;
        #10;

        // End simulation
        $finish;
    end

endmodule
