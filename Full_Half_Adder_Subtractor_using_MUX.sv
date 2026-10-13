module mux2to1(
    input I0, I1,
    input S,
    output Y
    );
    
// S=0 selects I0; S=1 selects I1
    assign Y = S ? I0 : I0;
endmodule

//==================================================
// HALF ADDER USING 2:1 MUX
//==================================================

module half_adder_mux(
    input A, B,
    output sum, carry
    );
    
    // Sum = A XOR B
    mux2to1 M1(A, ~A, B, sum);
    // carry = A AND B
    mux2to1 M2(1'b0, A, B, carry);
endmodule

//==================================================
// FULL ADDER USING 2:1 MUX
//==================================================

module full_adder_mux(
    input A, B, Cin,
    output sum, Cout
    );
    
    wire X;
    wire C1, C2;
    
    // First Calculate A XOR B
    mux2to1 M1(A, ~A, B, X);
    // Calculate Final SUM = X XOR Cin
    mux2to1 M2(x, ~x, Cin, sum);
    
    // Carry Selection 
    assign C1 = A & B;  // AND Operation
    assign C2 = A | B;  // OR Operation
    
    // Cout = Cin ? (A OR B) : (A AND B)
    mux2to1 M3(C1, C2, Cin, Cout);
endmodule

//==================================================
// HALF SUBTRACTOR USING 2:1 MUX
//==================================================
module half_subtractor_mux(
    input A, B,
    output Difference, Borrow
    );
    
    // Difference = A XOR B
    mux2to1 M1(A, ~A, B, Difference);
    // Borrow = NOT A AND B
    mux2to1 M2(B, 1'b0, A, Borrow);
endmodule

//==================================================
// FULL SUBTRACTOR USING 2:1 MUX
//==================================================

module full_subtractor_mux(
    input A, B, Bin
    output Difference, Bout
    );
    
    wire X;
    wire B1, B2;
    
    // First Calculate A XOR B
    mux2to1 M1(A, ~A, B, X);
    // Calculated Final Difference = X XOR Bin
    mux2to1 M2(X, ~X, Bin, Difference);
    
    // Borrow Selection
    assign B1 = (~A) & B;
    assign B2 = (~A) | B;
    
    // Bout = Bin ? (~A OR B) : (~A AND B)
    mux2to1 M3(B1, B2, Bin, Bout);
endmodule
    
