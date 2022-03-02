//`default_nettype none

module t_mux_2_1;  // testbench for the 4-bit-shifter

wire        out;

reg         check;
reg         A, B, select;

reg[2:0] i;


integer num_correct; // counter to keep track of the number correct
integer num_wrong;   // counter to keep track of the number wrong

// instantiate the 4-bit shifter
mux_2_1 M1(out, A, B, select);

// exhaustive checking
initial begin
  $display("Running testbench, this may take a minute or two...");

  // initialize the counter variables
  num_correct = 0; num_wrong = 0;

  for (i = 0; i < 6; i = i+1) begin

    {A, B, select} = i;
    #2;
    if (!select) begin
      check = A;
    end else begin
      check = B;
    end

    if (out == check) begin
      num_correct = num_correct + 1;
    end else begin
      num_wrong = num_wrong + 1;
      $display($time, " ASSERTION ERROR: input (A, B, select) = %b, output_from_chip = %b, output_from_checker = %b", i, out, check);
    end

  end

  // print the final counter values
  $display("num_correct = %d, num_wrong = %d", num_correct, num_wrong);


  $finish;
end

endmodule