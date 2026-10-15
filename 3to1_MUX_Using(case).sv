module mux_3to1(
    input I0, I1, I2,
    input [1:0] S,
    output reg Y
    );
    always @(*) begin
        case (S)
            2'b00: Y = I0; // Select Input 0
            2'b01: Y = I1; // Select Input 1
            2'b10: Y = I2; // Select Inout 2
            default: Y = 1'b0; //invalid selection(11)
        endcase
    end
endmodule
        
    
