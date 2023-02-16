//VERILOG FOR 2-BIT BY 2-BIT MULTIPLIER USING HALF ADDERS
module exercise3_3(a0,a1,b0,b1,p0,p1,p2,p3);
	input 		a0,a1,b0,b1;
	output 		p0,p1,p2,p3;
	wire 		and2,and3,and4,andd1;
	and		A1(p0,a0,b0), A2(and2,a1,b0), A3(and3,a0,b1), A4(and4,a1,b1);
	xor		X1(p1,and2,and3), X2(p2,andd1,and4);
	and		AA1(andd1,and2,and3), AA2(p3, andd1, and4);
endmodule

module testEx3_3;
	wire 	o1,o2,o3,o4;
	reg	ia1,ia2,ib1,ib2;

	exercise3_3	testEx3_3(ia1,ia2,ib1,ib2,o1,o2,o3,o4);

	initial begin
		#2 $display("a0 a1 b0 b1     product");
		ia1=1'b0;ia2=1'b0;ib1=1'b0;ib2=1'b0;	//0
		#100 $finish;
	end

	initial begin
		#2 $display(ia1,"  ",ia2,"  ",ib1,"  ",ib2, "      ",o1,o2,o3,o4);
		#2 ia1=1'b0;ia2=1'b0;ib1=1'b0;ib2=1'b1;
		#2 $display(ia1,"  ",ia2,"  ",ib1,"  ",ib2, "      ",o1,o2,o3,o4);
		#2 ia1=1'b0;ia2=1'b0;ib1=1'b1;ib2=1'b0;
		#2 $display(ia1,"  ",ia2,"  ",ib1,"  ",ib2, "      ",o1,o2,o3,o4);
		#2 ia1=1'b0;ia2=1'b0;ib1=1'b1;ib2=1'b1;
		#2 $display(ia1,"  ",ia2,"  ",ib1,"  ",ib2, "      ",o1,o2,o3,o4);
		#2 ia1=1'b0;ia2=1'b1;ib1=1'b0;ib2=1'b0;
		#2 $display(ia1,"  ",ia2,"  ",ib1,"  ",ib2, "      ",o1,o2,o3,o4);
		#2 ia1=1'b0;ia2=1'b1;ib1=1'b0;ib2=1'b1;
		#2 $display(ia1,"  ",ia2,"  ",ib1,"  ",ib2, "      ",o1,o2,o3,o4);
		#2 ia1=1'b0;ia2=1'b1;ib1=1'b1;ib2=1'b0;
		#2 $display(ia1,"  ",ia2,"  ",ib1,"  ",ib2, "      ",o1,o2,o3,o4);
		#2 ia1=1'b0;ia2=1'b1;ib1=1'b1;ib2=1'b1;
		#2 $display(ia1,"  ",ia2,"  ",ib1,"  ",ib2, "      ",o1,o2,o3,o4);
		#2 ia1=1'b1;ia2=1'b0;ib1=1'b0;ib2=1'b0;
		#2 $display(ia1,"  ",ia2,"  ",ib1,"  ",ib2, "      ",o1,o2,o3,o4);
		#2 ia1=1'b1;ia2=1'b0;ib1=1'b0;ib2=1'b1;
		#2 $display(ia1,"  ",ia2,"  ",ib1,"  ",ib2, "      ",o1,o2,o3,o4);
		#2 ia1=1'b1;ia2=1'b0;ib1=1'b1;ib2=1'b0;
		#2 $display(ia1,"  ",ia2,"  ",ib1,"  ",ib2, "      ",o1,o2,o3,o4);
		#2 ia1=1'b1;ia2=1'b0;ib1=1'b1;ib2=1'b1;
		#2 $display(ia1,"  ",ia2,"  ",ib1,"  ",ib2, "      ",o1,o2,o3,o4);
		#2 ia1=1'b1;ia2=1'b1;ib1=1'b0;ib2=1'b0;
		#2 $display(ia1,"  ",ia2,"  ",ib1,"  ",ib2, "      ",o1,o2,o3,o4);
		#2 ia1=1'b1;ia2=1'b1;ib1=1'b0;ib2=1'b1;
		#2 $display(ia1,"  ",ia2,"  ",ib1,"  ",ib2, "      ",o1,o2,o3,o4);
		#2 ia1=1'b1;ia2=1'b1;ib1=1'b1;ib2=1'b0;
		#2 $display(ia1,"  ",ia2,"  ",ib1,"  ",ib2, "      ",o1,o2,o3,o4);
		#2 ia1=1'b1;ia2=1'b1;ib1=1'b1;ib2=1'b1;
		#2 $display(ia1,"  ",ia2,"  ",ib1,"  ",ib2, "      ",o1,o2,o3,o4);
	end
endmodule