module t_DUTB_name();
    reg ...;            // Declaration of register variables 
                        // for primary inputs of the UUT
    wire ...;           // Declaration of primary outputs of the UUT
    
    parameter time_out = 0; // set the timeout value
    UUT_name M1_isntance_name(UUT ports go here);
    initial $monitor();         // Specification of signals to be 
                                // monitored and displayed as text
    initial #time_out $finish;
    initial                     // Develop one or more behaviors for 
                                // pattern generation and/or error
                                // detection 
    begin
        // Behavioral statements generating waveforms 
        // to the inputs ports, and comments documenting
        // the test. Use the full repertoire of behavioral
        // constructs for loops and conditionals

    end
endmodule