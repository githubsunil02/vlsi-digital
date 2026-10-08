module ALU #(
    parameter WIDTH = 8
)(
    input [WIDTH-1:0] A,
    input [WIDTH-1:0] B,
    input [1:0] opcode,
    
    output reg [WIDTH-1:0] C,
    output reg OF,
    output reg ZF,
    output reg SF,
    output reg PF
);
always @(*) begin
    // Default Values
    C = {WIDTH{1'b0}};
    OF = 1'b0;
    
    case (opcode)
    
    //Addition
    2'b00: begin
        C = A + B;
        
        // Signed Overflow
        OF = (~(A[WIDTH-1] ^ B[WIDTH-1])) & 
              (C[WIDTH-1] ^ B[WIDTH-1]);
    end
    //Substraction
    2'b01: begin
        C = A - B;
        
        // Signed Overflow
        OF = (A[WIDTH-1] ^ B[WIDTH-1]) & 
              (C[WIDTH-1] ^ B[WIDTH-1]);
    end
    
    // AND
    2'b10: begin
       C = A & B;
    end
    
    // OR
    2'b11: begin
       C = A | B;
    end
    endcase
    
    // Zero Flag
    ZF = (C == {WIDTH{1'b0}});
    
    // Sign Flag
    SF = C[WIDTH-1];
    
    // Parity Flag
    PF = ~(~C);
    
    end 
    
    endmodule
    
       
    
    
    
