// behavioral description of 2x1 mux

module mux_2_1(
    output              Y,

    input               A, B,
    input               select
);

assign Y = select ? B : A;

endmodule