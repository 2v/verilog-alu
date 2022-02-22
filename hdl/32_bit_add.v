// Gate-level description of half adder
module half_adder(S, C, x, y);
    output S, C;
    input x, y;

    xor(S, x, y);
    and(C, x, y);
endmodule

module 8_bit_cla_adder(S, C, A, B, C0);
    output [7:0] S;
    output C;

    input [7:0] A;
    input [7:0] B;
    input C0;

endmodule

module 8_bit_cla_block(G, P, A, B, C0);
    output G;
    output P;
    
    input C0; // carry in
    input [7:0] A;
    input [7:0] B;

    //assign C[0] = G[0] + P[0]C0;
    //assign C[1] = G[1] + P[1]G[0] + P[1]P[0]C0;
    //assign C[2] = G[2] + P[2]G[1] + P[2]P[1]G[0] + P[2]P[1]P[0]C0;
endmodule

module 32_bit_cla_adder(S, C, A, B, C0);
    output [31:0] S;
    output C;

    input [31:0] A;
    input [31:0] B;
    input C0;

endmodule
