
 // 2:1 MUX
module mux2to1(
    input I0, I1, S,
    output Y
);
    assign Y = S ? I1 : I0;
endmodule


// Half Subtractor using 2:1 MUX
module half_subtractor(
    input A, B,
    output Difference, Borrow
);

    // Difference = A XOR B
    mux2to1 M1(A, ~A, B, Difference);

    // Borrow = NOT A AND B
    mux2to1 M2(B, 1'b0, A, Borrow);

endmodule


// 2-Bit Comparator Using Half Subtractors
module comparator_2bit(
    input A1, A0,
    input B1, B0,
    output Greater, Equal, Less
);

    wire D1, D0;
    wire Borrow1, Borrow0;

    // Compare the most significant bits
    half_subtractor HS1(A1, B1, D1, Borrow1);

    // Compare the least significant bits
    half_subtractor HS2(A0, B0, D0, Borrow0);

    // A is greater than B
    assign Greater = (A1 & ~B1) | (~D1 & A0 & ~B0);

    // A is equal to B
    assign Equal = ~D1 & ~D0;

    // A is less than B
    assign Less = Borrow1 | (~D1 & Borrow0);

endmodule
