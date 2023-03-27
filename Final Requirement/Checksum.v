module Checksum #(
    parameter N = 10, WIDTH = 8, CHECKSUM = 8'b0
) (
    input  [((N + 1) * WIDTH)-1:0] data_in,
    output reg [WIDTH-1:0] checksum_out
);
    reg [WIDTH-1:0] carry, sum;
    integer i;
    always @(data_in) begin
        sum = 0; carry = 0;
        for(i = 0; i < N + 1; i=i+1) begin
              {carry, sum} = {carry, sum} + data_in[i * WIDTH +:WIDTH];
        end
        checksum_out = ~(carry + sum);
    end
endmodule
