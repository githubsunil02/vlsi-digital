// Explanation:
// - A, B — Two input bits.
// - Cin — Carry input from the previous stage.
// - Sum — Addition result.
// - Cout — Carry output to the next stage.
// Logic equations:
// - Sum = A XOR B XOR Cin
//- Cout = (A AND B) OR (B AND Cin) OR (A AND Cin)  //


module full_adder(
    input A, B, Cin,
    output Sum, Cout
);
    assign Sum = A ^ B ^ Cin;
    assign Cout = (A & B) | (B & Cin) | (A & Cin);
endmodule

// - A[3:0] — First 4-bit number.
// - B[3:0] — Second 4-bit number.
// - M — Mode selection input.
// - Result[3:0] — Four-bit answer.
// - Cout — Final carry output.
// Remember: M = 0 means addition; M = 1 means subtraction

module adder_subtractor_4bit(
    input [3:0] A, B,
    input M,
    output [3:0] Result,
    output Cout
);
    wire [3:0] BX;
    wire C1, C2, C3;

    assign BX = B ^ {4{M}};
    
// This is the most important line.
// {4{M}} repeats M four times.
// M	Repeated M	BX
// M=0	0000	B unchanged
// m=1	1111	B complemented
//
// For example, if B = 0011:
// - When M = 0, BX = 0011.
// - When M = 1, BX = 1100.
//  This works because XOR with 0 keeps a bit unchanged, while XOR with 1 inverts it
    
    full_adder FA0(A[0], BX[0], M, Result[0], C1);
    full_adder FA1(A[1], BX[1], C1, Result[1], C2);
    full_adder FA2(A[2], BX[2], C2, Result[2], C3);
    full_adder FA3(A[3], BX[3], C3, Result[3], Cout);

endmodule
