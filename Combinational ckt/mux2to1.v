
module mux2to1(
    input i0,
    input i1,
    input s,
    output wire y
);
    assign y = s?i1:i0;
endmodule
