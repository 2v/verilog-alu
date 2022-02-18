// // Test bench with stimulus for half_adder
// module t_full_adder_gp;
//     wire t_S, t_C, t_G, t_P;

//     reg A, B, C0;

//     //parameter stop_time = 80;

//     //initial #stop_time $finish; 

//     full_adder_gp M1(t_S, t_C, t_G, t_P, A, B, C0);

//     initial begin
//             A = 0; B = 0; C0 = 0;
//         #10 A = 0; B = 0; C0 = 1;
//         #10 A = 0; B = 1; C0 = 0;
//         #10 A = 0; B = 1; C0 = 1;
//         #10 A = 1; B = 0; C0 = 0;
//         #10 A = 1; B = 0; C0 = 1;
//         #10 A = 1; B = 1; C0 = 0;
//         #10 A = 1; B = 1; C0 = 1;
//    end

//     initial begin
//         $monitor ("time = ", $time, ", A = %b B = %b C0 = %b S = %b C = %b G = %b P = %b",
//             A, B, C0, t_S, t_C, t_G, t_P);
//     end
// endmodule

// module t_gp;
//     wire t_G_hl, t_P_hl;

//     reg G_h, P_h, G_l, P_l;

//     //parameter stop_time = 80;

//     //initial #stop_time $finish; 

//     //gp M1(t_G_hl, t_P_hl, G_h, P_h, G_l, P_l);
//     gp M1(t_G_hl, t_P_hl, G_h, P_h, G_l, P_l);

//     integer i;
//     initial begin
//         for (i = 0; i < 15; i = i + 1) begin
//             #10 {G_h, P_h, G_l, P_l} = i;

//             $monitor ("time = ", $time, ", G_h = %b P_h = %b G_l = %b P_l = %b t_G_hl = %b t_P_hl = %b",
//                 G_h, P_h, G_l, P_l, t_G_hl, t_P_hl);

//             //$display ("Current loop #%0d ", i);
//         end
//     end

// //     initial begin
// //         $monitor ("time = ", $time, ", G_h = %b P_h = %b G_l = %b P_l = %b t_G_hl = %b t_P_hl = %b",
// //             G_h, P_h, G_l, P_l, t_G_hl, t_P_hl);
// //     end
// endmodule

// module t_gpc;
// endmodule

// // Test bench with stimulus for 8-bit adder
// module t_cla_gp_8_bit;
//     wire [7:0] t_S;
//     wire [7:0] t_C;
//     wire t_G;
//     wire t_P;

//     reg C0;
//     reg [7:0] A;
//     reg [7:0] B;

//     parameter stop_time = 200;

//     //half_adder HA1(t_ha_sout, t_ha_cout, t_x, t_y); // instantiation of adder
//     cla_gp_8_bit A1(t_S, t_C, t_G, t_P, C0, A, B);



//     initial #stop_time $finish; 

//     initial begin
//             A[7:0] = 8'b00000000; B[7:0] = 8'b00000000; C0 = 0;
//         #20 A[7:0] = 8'b00000000; B[7:0] = 8'b00000001; C0 = 0;
//         #20 A[7:0] = 8'b00000001; B[7:0] = 8'b00000000; C0 = 0;
//         #20 A[7:0] = 8'b00000001; B[7:0] = 8'b00000001; C0 = 0;
//         #20 A[7:0] = 8'b00000000; B[7:0] = 8'b00000010; C0 = 0;
//         #20 A[7:0] = 8'b00000010; B[7:0] = 8'b00000010; C0 = 0;
//         #20 A[7:0] = 8'b00010000; B[7:0] = 8'b00000000; C0 = 0;
//         #20 A[7:0] = 8'b00000100; B[7:0] = 8'b00011111; C0 = 0;
//         #20 A[7:0] = 8'b11111111; B[7:0] = 8'b11111111; C0 = 0;
//     end

//     initial begin
//         $monitor ("time = ", $time, ", x = %b y = %b S = %b C = %b P = %b G = %b",
//             A, B, t_S, t_C, t_G, t_P);
//     end
// endmodule

// Test bench with stimulus for 32-bit adder
module t_cla_gp_32_bit;
    wire [31:0] t_S;
    wire [31:0] t_C;

    reg C0;
    reg [31:0] A;
    reg [31:0] B;


    cla_32_bit A1(t_S, t_C, C0, A, B);

    integer i;
    initial begin
        for (i = 0; i < 128; i = i + 1) begin
            #10 A = i; B = 65555; C0 = 1'b0;

            $monitor ("time = ", $time, ", A = %b B = %b S = %b C = %b",
                A, B, t_S, t_C);
         end
    end
endmodule