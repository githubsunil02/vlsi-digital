`timescale 1ns/1ps

module edge_detector;
    reg clk = 0;
    integer count = 0;
    
// Generate Clock: toggle in every 5 ns
always #5 clk = ~clk;

// Detect Both rising and Falling edges
always @(posedge clk or negedge clk) begin
    count = count + 1;
    
    // Display edge and counter value
    $display("Time=%0t | clk = %0b | count = %0d", $time, clk, count);
end

// Stop Stimulation After 50 ns
initial begin
#50;
$finish;
end
endmodule
