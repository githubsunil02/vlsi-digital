module t_ff(
    input T,
    input clk,
    output reg Q
    );
    always @(posedge clk) begin
    if (T == 1'b1)
        Q <= ~Q;    // Toggle
    else
        Q <= Q;    // HOLD
    end
endmodule

// SR Flip Flop
module SR_FF(
    input S, R,
    input clk,
    output reg Q
    );
    always @(posedge clk) begin
        case  ({S, R})
            2'b00: Q <= Q;  // Hold
            2'b01: Q <= 1'b0; // RESET
            2'b10: Q <= 1'b1;// SET
            2'b11: Q <= 1'bx;  // invalid
        endcase
    end
endmodule

// D Latch
module d_latch (
    input D,
    input EN,
    output reg Q
);

    always @(*) begin
        if (EN)
            Q = D;    // Follow input D
        // If EN = 0, Q holds its previous value
    end

endmodule

// D Flip Flop
module d_flipflop (
    input D,
    input CLK,
    output reg Q
);

    always @(posedge CLK) begin
        Q <= D;    // Store D at rising clock edge
    end

endmodule

