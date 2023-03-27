
/*
                 Model a counter with the given count sequence: 7-4-9-0-2-1-3-8-6,11. Use gate-level modeling.

    PRESENT    NEXT       FF INPUTS
    0 0 0 0    0 0 1 0    0 0 1 0
    0 0 1 0    0 0 0 1    0 0 1 1
    0 0 0 1    0 0 1 1    0 0 1 0
    0 0 1 1    1 0 0 0    1 0 1 1
    1 0 0 0    0 1 1 0    1 1 1 0
    0 1 1 0    1 0 1 1    1 1 0 1
    1 0 1 1    0 1 1 1    1 1 0 0
    0 1 1 1    0 1 0 0    0 0 1 1
    0 1 0 0    1 0 0 1    1 1 0 1
    1 0 0 1    0 0 0 0    1 0 0 1

    T[0] = ~Q[3] &  Q[1] |  Q[2] |  Q[3] & ~Q[1] & Q[0]
    T[1] = ~Q[3] &  Q[0] | ~Q[2] & ~Q[0]
    T[2] =  Q[2] & ~Q[0] |  Q[3]
    T[3] = ~Q[2] &  Q[1] &  Q[0] |  Q[2] & ~Q[0] | Q[3]
*/

module TFlipFlop(
    input   clk, T,
    output  Q
);
    

endmodule

module MS_Flipflop (
    input   clk, T,
    output  reg Q
);
    wire nclk, wire1;
    not (nclk, clk);

    TFlipFlop master(nclk, T, wire1),
               slave(clk,  T, Q);
endmodule


module counter(
    input clk, 
    output [3:0] Q
);

    
endmodule

module practice_exercise1;
    reg T, clk;
    wire Q;

    MS_Flipflop msff(clk, T, Q);

    initial forever #1 clk = ~clk;
        
    initial begin
        clk = 1'b0;
        T = 1'b0;
        $monitorb(Q);
        #2 T = 1'b1;
        #2 T = 1'b0;
        $finish;
    end
endmodule
