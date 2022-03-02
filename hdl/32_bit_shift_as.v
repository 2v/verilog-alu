// gate-level description of 4 bit shifter

module 32_bit_shift(
    output [31:0]       S,
    output              bb_right, bb_left,

    input [31:0]        D,
    input               shift_in_right, shift_in_left,
    input               select, // if 0, shift left, if 1, shift right
    input               ar_select
);

wire w1, w2, w3, w4;

8_bit_shift M1(S[7:0], bb_right, w1, D[7:0], shift_in_right, w2, select);
8_bit_shift M1(S[15:8], w2, w3, D[15:8], w1, w4, select);
8_bit_shift M1(S[23:16], w4, w5, D[23:16], w3, w6, select);
8_bit_shift_as M1(S[31:24], w6, bb_left, D[31:24], w5, shift_in_left, select, ar_select);

endmodule