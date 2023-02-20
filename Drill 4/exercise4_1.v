primitive _8x1_MUX(
    input reg [7:0] I,
    input reg [2:0] S,
    output Y
);
    // S2 S1 S0 : Y
    table
        0 0 0   : I[0];
        0 0 1   : I[1];
        0 1 0   : I[2];
        0 1 1   : I[3];
        1 0 0   : I[4];
        1 0 1   : I[5];
        1 1 0   : I[6];
        1 1 1   : I[7];
    endtable
endprimitive

module exercise4_1;
    reg [7:0]   I;
    reg [2:0]   S;
    wire        Y;

    _8x1_MUX mux(I, S, Y);

    
endmodule