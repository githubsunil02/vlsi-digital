module priority_encoder_16to4(
    input [15:0] D,
    output reg [3:0] Y,
    output reg valid
);

integer i;

always @(*) begin
    Y = 4'b0000;
    valid = 1'b0;

    for (i = 15; i >= 0; i = i - 1) begin
        if (D[i] && !valid) begin
            Y = i;
            valid = 1'b1;
        end
    end
end

endmodule


module tb_priority_encoder_16to4;

reg [15:0] D;
wire [3:0] Y;
wire valid;

integer i, j, expected, errors;
reg expected_valid;

// DUT: Design Under Test
priority_encoder_16to4 uut (
    .D(D),
    .Y(Y),
    .valid(valid)
);

initial begin
    errors = 0;

    // Test all 2^16 = 65536 combinations
    for (i = 0; i < 65536; i = i + 1) begin
        D = i;
        expected = 0;
        expected_valid = (i != 0);

        // Find the highest-priority active input
        for (j = 0; j < 16; j = j + 1) begin
            if (D[j])
                expected = j;
        end

        #1;

        if ((Y !== expected[3:0]) ||
            (valid !== expected_valid)) begin
            errors = errors + 1;
            $display(
                "FAIL: D=%b Y=%b valid=%b Expected Y=%d valid=%b",
                D, Y, valid, expected, expected_valid
            );
        end
    end

    if (errors == 0)
        $display("PASS: All 65536 test cases passed!");
    else
        $display("FAIL: Total errors = %d", errors);

    $finish;
end

endmodule
