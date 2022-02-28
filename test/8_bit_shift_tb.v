`default_nettype none

module t_shift_8_bit;  // testbench for the 4-bit-shifter

reg  [9:0] check;   //  6-bit value to test correctness. This includes the test bb_right and bb_left

wire [7:0]  S;       // 4-bit output from the shifter
wire        bb_right, bb_left;  // bit-bucket left and right

reg [7:0]  D;        // 4-bit input to shifter
reg        shift_in_right, shift_in_left;
reg        select;   // shifter select bit

reg[9:0] i;

integer k;     // loop variables

integer num_correct; // counter to keep track of the number correct
integer num_wrong;   // counter to keep track of the number wrong

// instantiate the 4-bit shifter
shift_8_bit M1(S, bb_right, bb_left, D, shift_in_right, shift_in_left, select);

// exhaustive checking
initial begin
  $display("Running testbench, this may take a minute or two...");

  // initialize the counter variables
  num_correct = 0; num_wrong = 0;

  // loop through all possible cases and record the results
  for (i = 0; i <= 254; i = i + 1) begin
    D = (i << 1) >> 2;
    shift_in_left = (i >> 9);
    shift_in_right = (i << 9) >> 9;

    for (k = 0; k < 2; k = k + 1) begin
      select = k;

      // compute the check value

      if (k == 0) begin
        check = i << 1;
      end else begin
        check = i >> 1;
      end


      // compute and check the product
      #2;
      if ({bb_left, S, bb_right} == check) begin
        num_correct = num_correct + 1;
      end else begin
        num_wrong = num_wrong + 1;
        // uncomment to debug
        $display($time, " ASSERTION ERROR: input = %b, check = %b, actual = %b, shift_in_left = %b, shift_in_right = %b, D = %b", i, check, {bb_left, S, bb_right}, shift_in_left, shift_in_right, D);
      end

    end
  end
  // print the final counter values
  $display("num_correct = %d, num_wrong = %d", num_correct, num_wrong);


  $finish;
end

endmodule