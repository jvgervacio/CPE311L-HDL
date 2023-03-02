module Comparator(
    output  [7:0] sign,
    input   [7:0] A, B
);
    assign sign = A == B ? "=" : (A < B ? "<" : ">");
     
endmodule

module exercise6_1;
    reg     [7:0] A, B;
    wire    [7:0] sign;

    Comparator c(sign, A, B);

    initial begin
        $display("Comparing 8-bit input A & B\n");
        $display("A\t\t\tB\t\t\t\tComparison");
        $monitor("%b\t%b\t\tA %s B", A,B,sign);

            A=8'd0;     B=8'd0;
        #2  A=8'd21;    B=8'd129;
        #2  A=8'd224;   B=8'd7;
        #2  A=8'd2;     B=8'd7;
        #2  A=8'd9;     B=8'd2;
        #2 $finish; 
    end

endmodule //exercise6_1