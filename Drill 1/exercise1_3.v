module exercise1_3(
    output  var1,   x_4,
    input   x_1,    x_2,    x_3);

    xor     EOR1(x_4, x_1, x_2, x_3);
    xor     EOR2(var1, x_1, x_2, x_3, x_4);
endmodule

module testbench1_3;
    reg     x_1,    x_2,    x_3;
    wire    var1,   x_4;

    exercise1_3 tb1(var1,   x_4,    x_1,    x_2,    x_3);

    initial begin
                x_1=1'b0;   x_2=1'b0;   x_3=1'b0;
         #10    x_1=1'b0;   x_2=1'b0;   x_3=1'b1;
         #10    x_1=1'b0;   x_2=1'b1;   x_3=1'b0;
         #10    x_1=1'b0;   x_2=1'b1;   x_3=1'b1;
         #10    x_1=1'b1;   x_2=1'b0;   x_3=1'b0;
         #10    x_1=1'b1;   x_2=1'b0;   x_3=1'b1;
         #10    x_1=1'b1;   x_2=1'b1;   x_3=1'b0;
         #10    x_1=1'b1;   x_2=1'b1;   x_3=1'b1;
         
         $finish;
             
    end
endmodule
