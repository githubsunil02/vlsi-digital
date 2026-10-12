
module full_adder(
    input A, B, Cin,
    output Sum, Cout
);
    assign Sum = A ^ B ^ Cin;
    assign Cout = (A & B) | (B & Cin) | (A & Cin);
endmodule

module adder_subtractor_4bit(
    input [3:0] A, B,
    input M,
    output [3:0] Result,
    output Cout
);
    wire [3:0] BX;
    wire C1, C2, C3;

    assign BX = B ^ {4{M}};

    full_adder FA0(A[0], BX[0], M, Result[0], C1);
    full_adder FA1(A[1], BX[1], C1, Result[1], C2);
    full_adder FA2(A[2], BX[2], C2, Result[2], C3);
    full_adder FA3(A[3], BX[3], C3, Result[3], Cout);

endmodule
