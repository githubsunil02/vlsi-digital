// D-FF Module(Structual)
module d_ff(
    input D, clk, RST,
    output reg Q
    );
// Store D at Rising edge; reset clears Q
always @(posedge clk or posedge RST) begin
    if (RST)
        Q <= 1'b0;
    else
        Q <= D;
end 
endmodule

// 8 -Bit SISO Shift register
module siso_8bit(
    input clk, RST, 
    input SI,  // Serial Input
    output SO   // Serial Output
    );
    reg [7:0] shift_reg;
    
    wire [7:0] q;
    
    // Structual Installation of 8 D-FFs
    d_ff FF0 (.D(SI),   .clk(clk), .RST(RST), .Q(q[0]));
    d_ff FF1 (.D(q[0]), .clk(clk), .RST(RST), .Q(q[1]));
    d_ff FF2 (.D(q[1]), .clk(clk), .RST(RST), .Q(q[2]));
    d_ff FF3 (.D(q[2]), .clk(clk), .RST(RST), .Q(q[3]));
    d_ff FF4 (.D(q[3]), .clk(clk), .RST(RST), .Q(q[4]));
    d_ff FF5 (.D(q[4]), .clk(clk), .RST(RST), .Q(q[5]));
    d_ff FF6 (.D(q[5]), .clk(clk), .RST(RST), .Q(q[6]));
    d_ff FF7 (.D(q[6]), .clk(clk), .RST(RST), .Q(q[7]));
// Serial output from the last flip-flop
assign SO = q[7];

endmodule

//// TESTBENCH

`timescale 1ns/1ps
module tb_siso_8bit;
    reg clk, RST, SI;
    wire SO;
    
    // Initiate the SISO Shift Register
    siso_8bit DUT(
        .clk(clk), .RST(RST), .SI(SI), .SO(SO)
    );
    
    //Generate The Clk with 10ns Period
    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        RST = 0;
    
        
        // RESET the register
        #12 RST = 0;
        
        // Send serial data: 1, 0, 1, 1, 0, 0, 1, 0
        @(negedge clk) SI = 1;
        @(negedge clk) SI = 0;
        @(negedge clk) SI = 1;
        @(negedge clk) SI = 1;
        @(negedge clk) SI = 0;
        @(negedge clk) SI = 0;
        @(negedge clk) SI = 1;
        @(negedge clk) SI = 0;
        // Allow data to shift to the serial output
        repeat (8) @(negedge clk);

        $finish;
    end

    // Monitor input and output
    always @(posedge clk) begin
        if (!RST)
            $display("Time=%0t SI=%b SO=%b",
                     $time, SI, SO);
    end

endmodule
        
    
    
    
    
