// 4-to-16 Line Decoder using Multiple 2-to-4 Decoder
//
// A 4-to-16 decoder has:
//     4 inputs  -> A[3:0]
//     16 outputs -> Y[15:0]
//
// It is implemented using five 2-to-4 decoders.
//
// First 2-to-4 decoder:
//     A[3:2] selects one of four groups.
//
// Four second-level 2-to-4 decoders:
//     A[1:0] selects one output within the selected group.
//Implement it by connecting multiple 2-to-4 decoders.


// Module 1 : 2-to-4 Decoder

module decoder2to4 (
    input A,         // First Input
    input B,        //  Second Input
    input EN,      // Enable Input
    output [3:0] Y     // 4 Output
);

// When Enable = 0, All Outputs are 0
//  Enable = 1, Exactly One Output Become 1
assign Y[0] = EN & ~A & ~B;  // AB = 00
assign Y[1] = EN & ~A & B;   // AB = 01
assign Y[2] = EN & A & ~B;   // AB = 10
assign Y[3] = EN & A & B;   // AB = 11

endmodule

// Module 2 : 4-to-16 Decoder
module decoder4to16 (
    input [3:0] A,
    output [15:0] Y
);
// ---------------------------------------------------------
    // EN is used to store the four outputs of the first
    // 2-to-4 decoder.
    //
    // EN[0] -> enables outputs Y[3:0]
    // EN[1] -> enables outputs Y[7:4]
    // EN[2] -> enables outputs Y[11:8]
    // EN[3] -> enables outputs Y[15:12]
// ---------------------------------------------------------
wire [3:0] EN;
// FIRST LEVEL
    // A[3] and A[2] are given to the first 2-to-4 decoder.
    //
    // This decoder decides which one of the four groups
    // should be enabled.
    
decoder2to4 D0 (
    .A (A[3]),
    .B (A[2]),
    .EN (1'b1),
    .Y (EN)
 );
 
 // SECOND LEVEL
    //
    // A[1] and A[0] are connected to all four 2-to-4.
    //
    // Only One of these Four Decoders is Enable at a Time.
    
//Decoder D1 generates y[3:0]
  
decoder2to4 D1 (
    .A (A[1]),
    .B (A[0]),
    .EN (EN[0]),
    .Y (Y[3:0])
 );
 
 //Decoder D2 generates y[7:4]
decoder2to4 D2 (
    .A (A[1]),
    .B (A[0]),
    .EN (EN[1]),
    .Y (Y[7:4])
 );
 
 //Decoder D3 generates y[11:8]
decoder2to4 D3 (
    .A (A[1]),
    .B (A[0]),
    .EN (EN[2]),
    .Y (Y[11:8])
 );
 
 //Decoder D4 generates y[15:9]
decoder2to4 D4 (
    .A (A[1]),
    .B (A[0]),
    .EN (EN[3]),
    .Y (Y[15:12])
 );
    
endmodule


// ++++++++++++++++++++++++++++++++++++++++++++++++++++
// TESTBENCH
// ++++++++++++++++++++++++++++++++++++++++++++++
// The testbench checks all possible combinations of the
// 4-bit input.
//
// Number of possible combinations:
//
//                 2^4 = 16
//
// Therefore, A will go from:
//                 0000 to 1111
//

module tb_decoder4to16;
    // input
    reg [3:0] A;
    // output
    wire [15:0] Y;

// Instantiate the Design Under Test(DUT)
decoder4to16 DUT(
    .A (A),
    .Y (Y)
);
integer i;
initial begin

for (i = 0; i < 16; i = i+1) begin
A = i;
#10;
$display(" %b   %b", A, Y);
end 
$finish;
end
endmodule


    
