module exercise3_2(w, x, y, z, out1, out2, out3, out4);
	input 	w, x, y, z;
	output 	out1, out2, out3, out4;
	wire 	wNot, xNot, yNot, zNot, and1, and2, and3, and4, and5, and6;
	
	not 	U1(wNot, w);
	not 	U2(xNot, x);
	not 	U3(yNot, y);
	not 	U4(zNot, z);
	
	//1000
	buf 	U5(out1, x);
	
	//0100
	and 	U6(and1, x, z);
	and 	U7(and2, x, y);
	or 		U8(out2, and1, and2);
	
	//0010
	and 	U9(and3, yNot, zNot);
	and 	U10(and4, y, z);
	or 		U11(out3, and3, and4);
	
	//0001
	buf 	U14(out4, zNot);
	
endmodule

module start3_2;
	wire o1, o2, o3, o4;
	reg w1, x1, y1, z1;
	
	exercise3_2 start3_2(w1, x1, y1, z1, o1, o2, o3, o4);
	initial begin
		w1=1'bx; x1=1'bx; y1=1'bx; z1=1'bx;
		#300 $finish;
	end
	
	initial begin
		#2 $display("BCD to 9's Complement Truth Table: ");
		#2 $display("--BCD--", "  --9's Comp--");
		#2 $display("w", " ", "x", " ", "y", " ", "z", "   ", "Q1", " ", "Q2", " ", "Q3", " ", "Q4");
		#2 $display(w1, " ", x1, " ", y1, " ", z1, "   ", o1, "  ", o2, "  ", o3, "  ", o4);
		#2 w1=1'bx; x1=1'bx; y1=1'bx; z1=1'bx;
		#2 $display(w1, " ", x1, " ", y1, " ", z1, "   ", o1, "  ", o2, "  ", o3, "  ", o4);
		#2 w1=1'bx; x1=1'bx; y1=1'bx; z1=1'bx;
		#2 $display(w1, " ", x1, " ", y1, " ", z1, "   ", o1, "  ", o2, "  ", o3, "  ", o4);
		#2 w1=1'bx; x1=1'bx; y1=1'bx; z1=1'bx;
		#2 $display(w1, " ", x1, " ", y1, " ", z1, "   ", o1, "  ", o2, "  ", o3, "  ", o4);
		#2 w1=1'bx; x1=1'bx; y1=1'bx; z1=1'bx;
		#2 $display(w1, " ", x1, " ", y1, " ", z1, "   ", o1, "  ", o2, "  ", o3, "  ", o4);
		#2 w1=1'bx; x1=1'bx; y1=1'bx; z1=1'bx;
		#2 $display(w1, " ", x1, " ", y1, " ", z1, "   ", o1, "  ", o2, "  ", o3, "  ", o4);
		#2 w1=1'bx; x1=1'bx; y1=1'bx; z1=1'bx;
		#2 $display(w1, " ", x1, " ", y1, " ", z1, "   ", o1, "  ", o2, "  ", o3, "  ", o4);
		#2 w1=1'bx; x1=1'bx; y1=1'bx; z1=1'bx;
		#2 $display(w1, " ", x1, " ", y1, " ", z1, "   ", o1, "  ", o2, "  ", o3, "  ", o4);
		#2 w1=1'bx; x1=1'bx; y1=1'bx; z1=1'bx;
		#2 $display(w1, " ", x1, " ", y1, " ", z1, "   ", o1, "  ", o2, "  ", o3, "  ", o4);
		#2 w1=1'b1; x1=1'b0; y1=1'b0; z1=1'b1;
		#2 $display(w1, " ", x1, " ", y1, " ", z1, "   ", o1, "  ", o2, "  ", o3, "  ", o4);
		#2 w1=1'b1; x1=1'b0; y1=1'b1; z1=1'b0;
		#2 $display(w1, " ", x1, " ", y1, " ", z1, "   ", o1, "  ", o2, "  ", o3, "  ", o4);
		#2 w1=1'b1; x1=1'b0; y1=1'b1; z1=1'b1;
		#2 $display(w1, " ", x1, " ", y1, " ", z1, "   ", o1, "  ", o2, "  ", o3, "  ", o4);
		#2 w1=1'b1; x1=1'b1; y1=1'b0; z1=1'b0;
		#2 $display(w1, " ", x1, " ", y1, " ", z1, "   ", o1, "  ", o2, "  ", o3, "  ", o4);
		#2 w1=1'b1; x1=1'b1; y1=1'b0; z1=1'b1;
		#2 $display(w1, " ", x1, " ", y1, " ", z1, "   ", o1, "  ", o2, "  ", o3, "  ", o4);
		#2 w1=1'b1; x1=1'b1; y1=1'b1; z1=1'b0;
		#2 $display(w1, " ", x1, " ", y1, " ", z1, "   ", o1, "  ", o2, "  ", o3, "  ", o4);
		#2 w1=1'b1; x1=1'b1; y1=1'b1; z1=1'b1;
		#2 $display(w1, " ", x1, " ", y1, " ", z1, "   ", o1, "  ", o2, "  ", o3, "  ", o4);
		#2 $display(" ");
	end
endmodule