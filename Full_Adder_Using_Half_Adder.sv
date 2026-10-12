
/*
    Q9: Design a Full Adder using Half Adders
    Modelling Style: Structural Modelling

    A Full Adder adds three 1-bit inputs (A, B, Cin)
    and produces two outputs (Sum and Cout).

    Implementation:
    - Two Half Adders
    - One OR gate
*/


// Half Adder Module
module half_adder(
    input A, B,           // Two input bits
    output Sum, Carry     // Sum and carry outputs
);

    // XOR operation generates the sum
    assign Sum = A ^ B;

    // AND operation generates the carry
    assign Carry = A & B;

endmodule


// Full Adder Module using Two Half Adders
module full_adder(
    input A, B, Cin,      // A, B: input bits; Cin: carry input
    output Sum, Cout      // Sum: final sum; Cout: final carry
);

    // Internal wires to connect the Half Adders
    wire S1;              // Intermediate sum from first Half Adder
    wire C1, C2;          // Carry outputs from both Half Adders

    // First Half Adder adds A and B
    // Outputs: intermediate sum S1 and carry C1
  
    half_adder HA1(
        .A(A),
        .B(B),
        .Sum(S1),
        .Carry(C1)
    );

    // Second Half Adder adds S1 and Cin
    // Outputs: final Sum and carry C2
  
    half_adder HA2(
        .A(S1),
        .B(Cin),
        .Sum(Sum),
        .Carry(C2)
    );

    // OR gate combines both carry outputs
    // If either carry is 1, the final carry Cout is 1
    assign Cout = C1 | C2;

endmodule
