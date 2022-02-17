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

module gpc(G_hl, P_hl, C_h, C_l, G_h, P_h, G_l, P_l, C_in);
    output G_hl, P_hl, C_h, C_l;
    input G_h, P_h, G_l, P_l, C_in;

    wire w1;

    gp M1(G_hl, P_hl, G_h, P_h, G_l, P_l);

    // C_h = G_l + P_l * C0
    // C_l = C0


    and(w1, P_l, C_in);
    or(C_h, G_l, w1);

    assign C_l = C_in;

endmodule

module cla_gp_8_bit(S, C, G, P, C0, A, B);
    output [7:0] S; // sum output
    output [7:0] C; // carry out output, although we don't need this result
    output G, P;

    input C0;
    input [7:0] A;
    input [7:0] B;

    wire [7:0] g_fa_out;
    wire [7:0] p_fa_out;

    wire [7:0] C_in; // array of carry ins for the FAs

    // defining outputs for different levels of the tree
    // TREE LEVEL 1:
    wire [3:0] g_hl_out_level_1;
    wire [3:0] p_hl_out_level_1;
    wire [3:0] c_in_level_1; // carries propogate up the tree while p and g propogate down the tree

    // TREE LEVEL 2:
    wire [1:0] g_hl_out_level_2;
    wire [1:0] p_hl_out_level_2;
    wire [1:0] c_in_level_2; // carries propogate up the tree while p and g propogate down the tree


    // full_adder_gp(S, C, G, P, A, B, C0)
    full_adder_gp fa_arr[7:0] (S, C, g_fa_out, p_fa_out, A, B, C_in);

    // G_hl, P_hl, C_h, C_l, G_h, P_h, G_l, P_l, C_in);

    // LEVEL 1 GPC MODULES
    gpc GPC1_l1(g_hl_out_level_1[0], p_hl_out_level_1[0], C_in[1], C_in[0], g_fa_out[1], p_fa_out[1], g_fa_out[0], p_fa_out[0], c_in_level_1[0]);
    gpc GPC2_l1(g_hl_out_level_1[1], p_hl_out_level_1[1], C_in[3], C_in[2], g_fa_out[3], p_fa_out[3], g_fa_out[2], p_fa_out[2], c_in_level_1[1]);
    gpc GPC3_l1(g_hl_out_level_1[2], p_hl_out_level_1[2], C_in[5], C_in[4], g_fa_out[5], p_fa_out[5], g_fa_out[4], p_fa_out[4], c_in_level_1[2]);
    gpc GPC4_l1(g_hl_out_level_1[3], p_hl_out_level_1[3], C_in[7], C_in[6], g_fa_out[7], p_fa_out[7], g_fa_out[6], p_fa_out[6], c_in_level_1[3]);


    // LEVEL 2 GPC MODULES
    gpc GPC1_l2(g_hl_out_level_2[0], p_hl_out_level_2[0], c_in_level_1[1], c_in_level_1[0],
        g_hl_out_level_1[1], p_hl_out_level_1[1], g_hl_out_level_1[0], p_hl_out_level_1[0], c_in_level_2[0]);
    gpc GPC2_l2(g_hl_out_level_2[1], p_hl_out_level_2[1], c_in_level_1[3], c_in_level_1[2],
        g_hl_out_level_1[3], p_hl_out_level_1[3], g_hl_out_level_1[2], p_hl_out_level_1[2], c_in_level_2[1]);

    // LEVEL 3 GPC MODULE
    gpc GPC1_l3(G, P, c_in_level_2[1], c_in_level_2[0], g_hl_out_level_2[1], p_hl_out_level_2[1], g_hl_out_level_2[0], g_hl_out_level_2[0], C0);
endmodule

 