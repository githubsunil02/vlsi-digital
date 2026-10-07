// 2-Bit Comparator........
// Gate Level Modeling...........

module comparator_2bit (
    input A1, A0, 
    input B1, B0,
    output Equal, Greater, Less
);
wire A1_bar, A0_bar;
wire B1_bar, B0_bar;

// Equal
wire E1, E0;
wire E1_1, E1_2;
wire E0_1, E0_2;

wire G1, G2;  // Greater
wire L1, L2;  // Less

// Not Gate
not (A1_bar, A1);
not (A0_bar, A0);
not (B1_bar, B1);
not (B0_Bar, B0);

  // Equality E = (A AND B) OR (A' AND B')
// E1 = A1B1 + A1'B1'
// E2 = A0B0 + A0'B0
// E1 = E2

// Equlity of MSB
and (E1_1, A1, B1);
and (E1_2, A1_bar, B1_bar);
or (E1, E1_1, E1_2);

// Equlity of LSB
and (E0_1, A0, B0);
and (E0_2, A0_bar, B0_bar);
or (E0, E0_1, E0_2);

// E1 = E0
and (Equal, E1, E0);

//  A > B
//  Greater = G1 + G2
//  Greater = A1B1′+E1A0B0′  

and (G1, A1, B1_bar);
and (G2, E0, A0, B1_bar);
or (Greater, G1, G2);

//  A < B
//  Greater = L1 + L2
//  Greater = A1'B1+E1A0'B0  

and (L1, A1_bar, B1);
and (L2, E0, A0_bar, B1);
or (Less, L1, L2);

endmodule


