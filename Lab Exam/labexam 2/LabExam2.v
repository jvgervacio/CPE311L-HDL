primitive PART_1(output Y, input A, B, C);
    table
    //  A B C   Y
        0 0 0 : 1;
        0 0 1 : 1;
        0 1 0 : 1;
        0 1 1 : 1;
        1 0 0 : 1;
        1 0 1 : 1;
        1 1 0 : 1;
        1 1 1 : 0;
    endtable
endprimitive

primitive PART_2(output Y, input A, B, C);
    table
    //  A B C   Y
        0 0 0 : 1;
        0 0 1 : 1;
        0 1 0 : 1;
        0 1 1 : 0;
        1 0 0 : 1;
        1 0 1 : 0;
        1 1 0 : 0;
        1 1 1 : 0;
    endtable
endprimitive


primitive PART_3(output Y, input M, A, B, C);
    table
    //  M A B C   Y
        0 0 0 0 : 1;
        0 0 0 1 : 1;
        0 0 1 0 : 1;
        0 0 1 1 : 1;
        0 1 0 0 : 1;
        0 1 0 1 : 1;
        0 1 1 0 : 1;
        0 1 1 1 : 0;
        1 0 0 0 : 0;
        1 0 0 1 : 0;
        1 0 1 0 : 0;
        1 0 1 1 : 0;
        1 1 0 0 : 0;
        1 1 0 1 : 0;
        1 1 1 0 : 0;
        1 1 1 1 : 0;
    endtable
endprimitive

primitive PART_4(output Y, input M, A, B, C);
    table
    //  M A B C   Y
        0 0 0 0 : 1;
        0 0 0 1 : 1;
        0 0 1 0 : 1;
        0 0 1 1 : 1;
        0 1 0 0 : 1;
        0 1 0 1 : 1;
        0 1 1 0 : 1;
        0 1 1 1 : 0;
        1 0 0 0 : 1;
        1 0 0 1 : 1;
        1 0 1 0 : 1;
        1 0 1 1 : 0;
        1 1 0 0 : 1;
        1 1 0 1 : 0;
        1 1 1 0 : 0;
        1 1 1 1 : 0;
    endtable

endprimitive

module LabExam2;
    reg     A,  B,  C,  M;
    wire    P1, P2, P3, P4;

    PART_1 p1(P1, A, B, C);
    PART_2 p2(P2, A, B, C);
    PART_3 p3(P3, M, A, B, C);
    PART_4 p4(P4, M, A, B, C);

    initial begin
        $display("M\tA\tB\tC\t\tP1\tP2\tP3\tP4");
        $monitor("%b\t%b\t%b\t%b\t\t%b\t%b\t%b\t%b", M, A, B, C, P1, P2, P3, P4);

        #1  M = 1'b0;   A = 1'b0;   B = 1'b0;   C = 1'b0;
        #1  M = 1'b0;   A = 1'b0;   B = 1'b0;   C = 1'b1;
        #1  M = 1'b0;   A = 1'b0;   B = 1'b1;   C = 1'b0;
        #1  M = 1'b0;   A = 1'b0;   B = 1'b1;   C = 1'b1;
        #1  M = 1'b0;   A = 1'b1;   B = 1'b0;   C = 1'b0;
        #1  M = 1'b0;   A = 1'b1;   B = 1'b0;   C = 1'b1;
        #1  M = 1'b0;   A = 1'b1;   B = 1'b1;   C = 1'b0;
        #1  M = 1'b0;   A = 1'b1;   B = 1'b1;   C = 1'b1;
        #1  M = 1'b1;   A = 1'b0;   B = 1'b0;   C = 1'b0;
        #1  M = 1'b1;   A = 1'b0;   B = 1'b0;   C = 1'b1;
        #1  M = 1'b1;   A = 1'b0;   B = 1'b1;   C = 1'b0;
        #1  M = 1'b1;   A = 1'b0;   B = 1'b1;   C = 1'b1;
        #1  M = 1'b1;   A = 1'b1;   B = 1'b0;   C = 1'b0;
        #1  M = 1'b1;   A = 1'b1;   B = 1'b0;   C = 1'b1;
        #1  M = 1'b1;   A = 1'b1;   B = 1'b1;   C = 1'b0;
        #1  M = 1'b1;   A = 1'b1;   B = 1'b1;   C = 1'b1;
        #1  $finish;
    end
    

endmodule
