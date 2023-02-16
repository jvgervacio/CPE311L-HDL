module exercise3_1(x, y, out1, out2, out3);
	input x, y;
	output out1, out2, out3;
	
	buf U1(out1, x);
	nand U2(out2, x, y);
	xnor U3(out3, x, y);
	
	
endmodule

module start3_1;
	wire w1, w2, w3;
	reg x1, y1;
	
	exercise3_1 start3_1(x1, y1, w1, w2, w3);
	initial begin
		x1=1'b0; y1=1'b0;
		#200 $finish;
	end
	initial begin
		#2 $display("Truth table of buf: ");
		#2 x1=1'b0;
		#2 $display("x", " ", "out");
		#2 $display(x1,"  ",w1);
		#2 x1=1'b1;
		#2 $display(x1,"  ",w1);
		#2 x1=1'bx;
		#2 $display(x1,"  ",w1);
		#2 x1=1'bz;
		#2 $display(x1,"  ",w1);
		#2 $display("");
		
		#2 $display("Truth table for nand: ");
		#2 x1=1'b0; y1=1'b0;
		#2 $display("x", " ", "y", ," ", "out");
		#2 $display(x1, " ",y1, "   ", w2);
		#2 x1=1'b0; y1=1'b1;
		#2 $display(x1, " ",y1, "   ", w2);
		#2 x1=1'b0; y1=1'bx;
		#2 $display(x1, " ",y1, "   ", w2);
		#2 x1=1'b0; y1=1'bz;
		#2 $display(x1, " ",y1, "   ", w2);
		
		#2 x1=1'b1; y1=1'b0;
		#2 $display(x1, " ",y1, "   ", w2);
		#2 x1=1'b1; y1=1'b1;
		#2 $display(x1, " ",y1, "   ", w2);
		#2 x1=1'b1; y1=1'bx;
		#2 $display(x1, " ",y1, "   ", w2);
		#2 x1=1'b1; y1=1'bz;
		#2 $display(x1, " ",y1, "   ", w2);
		
		#2 x1=1'bx; y1=1'b0;
		#2 $display(x1, " ",y1, "   ", w2);
		#2 x1=1'bx; y1=1'b1;
		#2 $display(x1, " ",y1, "   ", w2);
		#2 x1=1'bx; y1=1'bx;
		#2 $display(x1, " ",y1, "   ", w2);
		#2 x1=1'bx; y1=1'bz;
		#2 $display(x1, " ",y1, "   ", w2);
		
		#2 x1=1'bz; y1=1'b0;
		#2 $display(x1, " ",y1, "   ", w2);
		#2 x1=1'bz; y1=1'b1;
		#2 $display(x1, " ",y1, "   ", w2);
		#2 x1=1'bz; y1=1'bx;
		#2 $display(x1, " ",y1, "   ", w2);
		#2 x1=1'bz; y1=1'bz;
		#2 $display(x1, " ",y1, "   ", w2);
		#2 $display("");
		
		#2 $display("Truth table for xnor: ");
		#2 x1=1'b0; y1=1'b0;
		#2 $display("x", " ", "y", ," ", "out");
		#2 $display(x1, " ",y1, "   ", w3);
		#2 x1=1'b0; y1=1'b1;
		#2 $display(x1, " ",y1, "   ", w3);
		#2 x1=1'b0; y1=1'bx;
		#2 $display(x1, " ",y1, "   ", w3);
		#2 x1=1'b0; y1=1'bz;
		#2 $display(x1, " ",y1, "   ", w3);
		
		#2 x1=1'b1; y1=1'b0;
		#2 $display(x1, " ",y1, "   ", w3);
		#2 x1=1'b1; y1=1'b1;
		#2 $display(x1, " ",y1, "   ", w3);
		#2 x1=1'b1; y1=1'bx;
		#2 $display(x1, " ",y1, "   ", w3);
		#2 x1=1'b1; y1=1'bz;
		#2 $display(x1, " ",y1, "   ", w3);
		
		#2 x1=1'bx; y1=1'b0;
		#2 $display(x1, " ",y1, "   ", w3);
		#2 x1=1'bx; y1=1'b1;
		#2 $display(x1, " ",y1, "   ", w3);
		#2 x1=1'bx; y1=1'bx;
		#2 $display(x1, " ",y1, "   ", w3);
		#2 x1=1'bx; y1=1'bz;
		#2 $display(x1, " ",y1, "   ", w3);
		
		#2 x1=1'bz; y1=1'b0;
		#2 $display(x1, " ",y1, "   ", w3);
		#2 x1=1'bz; y1=1'b1;
		#2 $display(x1, " ",y1, "   ", w3);
		#2 x1=1'bz; y1=1'bx;
		#2 $display(x1, " ",y1, "   ", w3);
		#2 x1=1'bz; y1=1'bz;
		#2 $display(x1, " ",y1, "   ", w3);
		#2 $display("");
	end
endmodule