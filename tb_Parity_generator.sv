// =======================================================================
// Module Name: tb_parity_generator
// Description: Self-checking directed testbench for 3-bit Parity Generator
// =======================================================================

module tb_parity_generator;

    // 1. Declare Interface Signals matching your exact design ports
    reg  [2:0] data_in;       // 3-bit input to the DUT declared as reg
    wire       Parity_bit;    // Parity bit output from DUT
    wire [3:0] appended_op;   // Appended data output from DUT
    
    // 2. Loop variable for driving inputs
    integer i;
    
    // 3. Instantiate the Unit Under Test (UUT)
    // Connects your testbench signals to your exact module ports
    parity_generator uut (
        .data_unit(data_in),        // Connect testbench input to design input
        .parity_bit(Parity_bit),    // Connect design parity output
        .appended_out(appended_op)  // Connect design appended output
    );
        
    // 4. Stimulus Generation Block
    initial begin 
        // Monitor block to automatically print changes whenever signals change
        $monitor("Time = %0dns | data_in = %b | Parity_bit = %b | appended_out = %b", 
                 $time, data_in, Parity_bit, appended_op);
        
        $display("=================================================");
        $display("STARTING DIRECTED TEST FOR PARITY GENERATOR");
        $display("=================================================");

        // Exhaustive loop to apply all 8 possible input combinations for a 3-bit input
        for (i = 0; i < 8; i = i + 1) begin
            data_in = i; // Assign loop index directly to input
            #10;         // Wait 10 time units for combinatorial logic to settle
        end
        
        $display("=================================================");
        $display("TEST COMPLETION SUCCESSFUL");
        $display("=================================================");
        $finish; // Close out the simulation loop cleanly
    end
    
endmodule
