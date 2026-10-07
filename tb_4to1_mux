module tb_mux4;

reg I0, I1, I2, I3;
reg S1, S0;

wire Y;

integer i;


mux4_dataflow DUT (
    .I0(I0),
    .I1(I1),
    .I2(I2),
    .I3(I3),
    .S1(S1),
    .S0(S0),
    .Y(Y)
);


//---------------------------------------------
// Test all 64 combinations
//---------------------------------------------

initial begin

    $display("S1 S0 | I0 I1 I2 I3 | Y");
    $display("-------------------------");

    for (i = 0; i < 64; i = i + 1) begin

        {S1, S0, I0, I1, I2, I3} = i;

        #10;

        $display("%b  %b  | %b  %b  %b  %b | %b",
                 S1, S0, I0, I1, I2, I3, Y);

    end

    $finish;

end


endmodule
