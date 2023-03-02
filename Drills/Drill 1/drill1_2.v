module full_subtract(diff, borrowOut, a, b, borrowIn);
    output diff;
    output borrowOut;
    input a, b, borrowIn;
    assign {borrowOut, diff} = a - b - borrowIn;
    //result of subtraction is two bits; the MSB is borrowOut and the LSB
    //is diff.
endmodule

module testingFS();
    reg a, b, borrowIn;
    wire diff, borrowOut;

    full_subtract fs(diff, borrowOut, a, b, borrowIn);

    initial begin
        a=1'b1; b=1'b1; borrowIn=1'b0;
    end

    initial begin
        #10 a=1'b1;
        #10 a=1'b0; b=1'b1;
        #10 a=1'b1; b=1'b0;
        #10 borrowIn=1'b1;
    end
    initial begin
        
        $display("a b borrowIn difference borrowOut time");
        $monitor("%b %b %b %b %b %t", a, b, borrowIn, diff, borrowOut, $time);
        #50 $finish;
    end
endmodule