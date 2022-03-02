// gate-level description of 4 bit shifter with arithmetic shift select

module shift_4_bit_as(
    output [3:0]        S,
    output              bb_right, bb_left,

    input [3:0]         D,
    input               shift_in_right, shift_in_left,
    input               select, // if 0, shift left, if 1, shift right
    input               ar_select
);

wire w0, w1, w2, w3, w4, w5, w6, w7, w8;
wire left, right;

// 2x1 decoder 
not (left, select);
buf (right, select);

and M0(bb_right, right, D[0]);
and M1(w1, left, D[0]);
and M2(w2, right, D[1]);
and M3(w3, left, D[1]);
and M4(w4, D[2], right);
and M5(w5, D[2], left);
and M6(w6, D[3], right);
and M7(bb_left, left, D[3]);
and M12(w0, left, shift_in_right);
and M13(w7, right, shift_in_left);

or M8(S[0], w0, w2);
or M9(S[1], w1, w4);
or M10(S[2], w3, w6);
or M11(w8, w5, w7);

mux_2_1 M14(S[3], w8, D[3], ar_select);



endmodule