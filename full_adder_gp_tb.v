// Test bench with stimulus for half_adder
module t_full_adder_gp;
    wire t_S, t_C, t_G, t_P;

    reg A, B, C0;

    parameter stop_time = 170;

    initial #stop_time $finish; 

    full_adder_gp M1(t_S, t_C, t_G, t_P, A, B, C0);

    integer f, i;
    initial begin
        f = $fopen("output.txt", "w");
        for (i = 0; i < 8; i = i + 1) begin
            {A, B, C0} = i;
            #10
            $monitor ("time = ", $time, ", A = %b, B = %b, C0 = %b, t_S = %b t_C = %b t_G = %b t_P = %b",
                A, B, C0, t_S, t_C, t_G, t_P);

            $fwrite(f, "%d: A = %b, B = %b, C0 = %b, t_S = %b t_C = %b t_G = %b t_P = %b\n", i, A, B, C0, t_S, t_C, t_G, t_P);
         end
        $fclose(f);
    end

endmodule