module alu_32_bit(
    output [31:0]   out; // sum output


    input [31:0]    A, B;
    input           C0; // carry-in to ALU
    input [3:0]     select;
);
endmodule