
module drill2_1;
    reg [7:0] a, b, c, d, e, f, g, h;
    reg [9:0] j;
    
    initial begin
        a=5'o37;
        b=3'D4;
        c=7'hx;
        d=8'hAF;
        e=10'b01;
        f=2+3'd10;
        g=32;
        h=-5;
        j=3.6E2;
        
        $write("%o %b %b %h %b",a,b,c,d,e);
        $write("%d %d %d %d %s",f,g,h,j,"Testing");
    end

endmodule