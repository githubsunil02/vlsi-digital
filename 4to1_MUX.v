module mux4_gate (
    input I0,
    input I1,
    input I2,
    input I3,
    input S1,
    input S0,
    output Y
);
// Gate Level Modeling
wire S1_bar;
wire S0_bar;

wire W0;
wire W1;
wire W2;
wire W3;

// NOT gates
not (S1_bar, S1);
not (S0_bar, S0);

// AND gates
and (W0, I0, S1_bar, S0_bar);
and (W1, I1, S1_bar, S0);
and (W2, I2, S1, S0_bar);
and (W3, I3, S1, S0);

// OR gate
or (Y, W0, W1, W2, W3);

endmodule
// Data Flow Modeling
module mux4_dataflow( 
    input I0, I1, I2, I3,
    input S1, S0,
    output Y);
assign Y = (~S1 & ~S0 & I0) |
           (~S1 &  S0 & I1) |
           ( S1 & ~S0 & I2) |
           ( S1 &  S0 & I3);
    
endmodule
// Behavioral Modeling
module mux4_behavioral (
    input I0, I1, I2, I3,
    input S1, S0,
    output reg Y
);
always @(*) begin

    case ({S1, S0})

        2'b00: Y = I0;
        2'b01: Y = I1;
        2'b10: Y = I2;
        2'b11: Y = I3;

    endcase

end
endmodule
