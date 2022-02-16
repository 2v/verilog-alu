// gates are explicity defined for modules for easier compilation in the future,
// although it would be much easier to use continuous assignment

module full_adder_gp(S, C, G, P, A, B, C0);
    output S, C, G, P;
    input A, B, C0;

    wire s0, c1;

    xor(s0, A, B);
    and(G, A, B);
    xor(S, C0, s0);
    and(c1, s0, C0);
    and(C, G, c1);
endmodule

module gp(G_hl, P_hl, G_h, P_h, G_l, P_l);
    output G_hl, P_hl;
    input G_h, P_h, G_l, P_l;

    wire w1;

    // we have G_hl if we either generate a carry on the higher order FA
    // or if we generate carry on lower order FA and propagate the carry
    // through the high-order FA
    // G_hl = G_h + G_l * P_h
    // P_hl = P_h * P_l

    and(w1, P_h, G_l);
    or(G_hl, w1, G_h);

    and(P_h1, P_h, P_l);
endmodule

module gpc(G_hl, P_hl, C_l, C_h, G_h, P_h, G_l, P_l, C0);
    output G_hl, P_hl, C_l, C_h;
    input G_h, P_h, G_l, P_l, C0;

    wire w1;

    gp M1(G_hl, P_hl, G_h, P_h, G_l, P_l);

    // C_h = G_l + P_l * C0
    // C_l = C0


    and(w1, P_l, C0);
    or(C_h, G_l, w1);

    assign C_l = C0;
endmodule


