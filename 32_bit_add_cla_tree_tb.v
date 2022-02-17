// Test bench with stimulus for half_adder
module t_8_bit_cla_gp;
    wire [7:0] t_S;
    wire [7:0] t_C;
    wire t_G;
    wire t_P;

    reg C0;
    reg [7:0] A;
    reg [7:0] B;

    parameter stop_time = 200;

    //half_adder HA1(t_ha_sout, t_ha_cout, t_x, t_y); // instantiation of adder
    cla_gp_8_bit A1(t_S, t_C, t_G, t_P, C0, A, B);



    initial #stop_time $finish; 

    initial begin
            A[7:0] = 8'b00000000; B[7:0] = 8'b00000000; C0 = 0;
        #20 A[7:0] = 8'b00000000; B[7:0] = 8'b00000001; C0 = 0;
        #20 A[7:0] = 8'b00000001; B[7:0] = 8'b00000000; C0 = 0;
        #20 A[7:0] = 8'b00000001; B[7:0] = 8'b00000001; C0 = 0;
        #20 A[7:0] = 8'b00000000; B[7:0] = 8'b00000010; C0 = 0;
        #20 A[7:0] = 8'b00000010; B[7:0] = 8'b00000010; C0 = 0;
        #20 A[7:0] = 8'b00010000; B[7:0] = 8'b00000000; C0 = 0;
        #20 A[7:0] = 8'b00000100; B[7:0] = 8'b00011111; C0 = 0;
    end

    initial begin
        $monitor ("time = ", $time, ", x = %b y = %b S = %b C = %b P = %b G = %b",
            A, B, t_S, t_C, t_G, t_P);
    end
endmodule