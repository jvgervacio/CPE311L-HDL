module test;
    reg [7:0] A, B, C;
    
    initial begin
        A=8'b10101010;   B=8'b01101110;   C=8'b11101011;
        $display("%b",B&C);
        $display("%b",~^C);
        $display("%b",|A);
        $display("%b",A||B);
        $display("%b",A>C);
        $display("%b",B<=A);
        $display("%b",C<<2);
        $display("%b",B*2);
        $display("%b",C%A);
        $display("%b",A-B);
    end

endmodule;