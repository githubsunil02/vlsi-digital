// TESTBENCH FOR 2-BIT OPERATOR
module tb_comparator_2bit;

    reg A1, A0;
    reg B1, B0;

    wire Equal;
    wire Greater;
    wire Less;

    integer i;
// Instantiate Comparator
comparator_2bit DUT (
    .A1(A1),
    .A0(A0),
    .B1(B1),
    .B0(B0),
    .Equal(Equal),
    .Greater(Greater),
    .Less(Less)
);
// Test all 16 Combination
initial begin

$display(" A  | B  | Equal | Greater | Less");

for (i = 0; i < 16; i = i+1) begin
    {A1, A0, B1, B0} = i;

#10;

$display("%b%b | %b%b | %b | %b | %b ",
    A1, A0,
    B1, B0,
    Equal,
    Greater,
    Less);
    
end
$finish;
end
endmodule
