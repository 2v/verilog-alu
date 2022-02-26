// gate-level description of 4 bit shifter

module 8_bit_shift(
    output [7:0]        S;
    output              bb_right, bb_left;

    input [7:0]         D;
    input               shift_in_right, shift_in_left;
    input               select; // if 0, shift left, if 1, shift right
);

wire w1, w2;

4_bit_shift M1(S[3:0], bb_right, w1, D[3:0], shift_in_right, w2, select);
4_bit_shift M1(S[7:4], w2, bb_left, D[7:4], w1, shift_in_left, select);

endmodule