module mux_2to1(
    input wire d0,
    input wire d1,
    input wire sel,
    output wire y
    );
    
    // ternary Operator
    // if sel = 0, y = 0 : if sel = 1, y = 1
    assign y = sel ? d1 : d0;
endmodule

module tb_mux_2to1;

    // Input to the DUT (Design Under Test) are decleared as reg
    reg d0;
    reg d1;
    reg sel;
    wire y; // Output from DTU decleared as Wire.
    
    // Initiating the DTU
    mux_2to1 uut (
    .d0(d0),
    .d1(d1),
    .sel(sel),
    .y(y)
    );
    
    initial begin
    // Display the Header For Monitoring
    $monitor("Time = %0dns | d0 = %b | d1 = %b | sel = %b | output Y = %b", $time, d0, d1, sel, y);
    
    
    // Test Case 1 : sel = 0 | Output should track d0
    sel = 0; d0 = 0; d1 = 1; #10;
    sel = 0; d0 = 1; d1 = 0; #10;
    // Test Case 2 : sel = 1 | Output should track d1
    sel = 1; d0 = 0; d1 = 1; #10;
    sel = 1; d0 = 1; d1 = 0; #10;
    
    // Test Case : Exhaustive Combination
    d0 = 0; d1 = 0; sel = 0; #10;
    d0 = 0; d1 = 0; sel = 1; #10;
    d0 = 1; d1 = 1; sel = 0; #10;
    d0 = 1; d1 = 1; sel = 1; #10;
    
    $finish;
end
endmodule
