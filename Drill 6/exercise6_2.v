module T_Flipflop (
    input   clk, T,
    output  reg Q
);
    initial Q = 1'b0;
    always @(posedge clk) begin
        Q <= T ? ~Q : Q;
    end
    
endmodule // T_Flipflop

module SequenceCounter (
    input   clk,
    output  [2:0] Q
);
    
    wire [2:0] T;
    /*
        5-2-7-0-3-1-6
        Present     Next        FF inputs
        1 0 1       0 1 0       1 1 1
        0 1 0       1 1 1       1 0 1
        1 1 1       0 0 0       1 1 1
        0 0 0       0 1 1       0 1 1
        0 1 1       0 0 1       0 1 0
        0 0 1       1 1 0       1 1 1
        1 1 0       1 0 1       0 1 1
    */
    assign  T[2] = ~Q[1] & Q[0] | ~Q[2] & Q[1] & ~Q[0] | Q[2] & Q[0],
            T[1] = ~Q[1] | Q[0] | Q[2],
            T[0] = ~Q[1] | ~Q[0] | Q[2];
    
    T_Flipflop 
        t1(clk, T[0], Q[0]),
        t2(clk, T[1], Q[1]),
        t3(clk, T[2], Q[2]);
    
    
endmodule // SequenceCounter

module exercise6_2;
    reg clk;
    wire [2:0] Q;

    SequenceCounter sc(clk, Q);

    initial begin
        clk = 0;
        forever #1 clk = ~clk;
    end

    initial begin
        $monitorb(Q);
        #15 $finish;
    end

endmodule //exercise6_2