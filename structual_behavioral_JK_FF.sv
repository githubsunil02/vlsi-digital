module jk_behavioral(
    input j, k, clk,
    output reg Q,
    output Qbar
    );
    assign Qbar = ~Q;
    
    // Sequential logic block triggered on the rising edge of the system clock
always @(posedge CLK) begin

    // Concatenate J and K into a 2-bit bus to decode the JK flip-flop truth table
    case ({J, K})
        
        // J=0, K=0: Hold State
        // Maintains the current output value on the next clock cycle
        2'b00: Q <= Q; 
        
        // J=0, K=1: Reset State
        // Forces the output to a logic low (0)
        2'b01: Q <= 1'b0; 
        
        // J=1, K=0: Set State
        // Forces the output to a logic high (1)
        2'b10: Q <= 1'b1; 
        
        // J=1, K=1: Toggle State
        // Inverts the current output value (complements the state)
        2'b11: Q <= ~Q; 
        
    endcase
    
end
    endmodule
    
    
// Structural modeling of a basic JK Flip-Flop/Latch using primitive gates
module jk_ff_structural (
    input J, K, CLK,  // Input control signals and gating clock/enable
    output Q, Qbar    // True and inverted complementary outputs
);

    // Internal wires connecting the input steering gates to the SR latch
    wire S, R;

    // Feedback logic & input gating
    // Generates the 'Set' trigger when J is high, clock is high, and output is currently low
    and (S, J, CLK, Qbar);
    
    // Generates the 'Reset' trigger when K is high, clock is high, and output is currently high
    and (R, K, CLK, Q);

    // Cross-coupled NOR gates forming the core SR Latch memory element
    // Outputs Q based on the Reset signal (R) and the feedback of Qbar
    nor (Q,    R, Qbar);
    
    // Outputs Qbar based on the Set signal (S) and the feedback of Q
    nor (Qbar, S, Q);

endmodule
    
            
