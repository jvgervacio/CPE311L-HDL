module circuit1_1(A, B, C, X);
    input A, B, C;
    output X;
    wire wire1, wire2, wire3;
    not NOT(wire2, A);
    xor EOR2(wire1, B, C);
    and AND2(wire3, wire1, A);
    nor NOR2(X, wire3, wire2);
endmodule

module testbench1_2;
    reg A, B, C;
    wire Z;

    circuit1_1 tb1(A, B, C, Z);

    initial begin
            $display("Simulating output for circuit1_1");
            A=1'b0;     B=1'b0;     C=1'b0;
            $display("%t A=%b B=%b C=%b Z=%b",$time, A,B,C,Z);
        #10 A=1'b0;     B=1'b0;     C=1'b1;
            $display("%t A=%b B=%b C=%b Z=%b",$time, A,B,C,Z);
        #10 A=1'b0;     B=1'b1;     C=1'b0;
            $display("%t A=%b B=%b C=%b Z=%b",$time, A,B,C,Z);
        #10 A=1'b0;     B=1'b1;     C=1'b1;
            $display("%t A=%b B=%b C=%b Z=%b",$time, A,B,C,Z);
        #10 A=1'b1;     B=1'b0;     C=1'b0;
            $display("%t A=%b B=%b C=%b Z=%b",$time, A,B,C,Z);
        #10 A=1'b1;     B=1'b0;     C=1'b1;
            $display("%t A=%b B=%b C=%b Z=%b",$time, A,B,C,Z);
        #10 A=1'b1;     B=1'b1;     C=1'b0;
            $display("%t A=%b B=%b C=%b Z=%b",$time, A,B,C,Z);
        #10 A=1'b1;     B=1'b1;    C=1'b1;
            $display("%t A=%b B=%b C=%b Z=%b",$time, A,B,C,Z);
        #10 $finish;
            
    end
endmodule
