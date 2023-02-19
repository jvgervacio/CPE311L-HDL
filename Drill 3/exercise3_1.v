module exercise3_1(a, b, out);
	input 	a, b;
	output 	out[2:0];
	
	buf 	(out[0], a);
	nand 	(out[1], a, b);
	xnor 	(out[2], a, b);

endmodule

module exercise3_1_TB;
	wire 	out[2:0];
	reg 	a, b;

	circuit2_2 t2_2(a, b, out[0]);
	initial begin
		a=1'b0; 	b=1'b0;
		#200 $finish;
	end
	initial begin
		// TRUTH TABLE FOR BUF
		#2 $display("\nTRUTH TABLE FOR BUF: ");
		#2 $display("a \tout");

		#2 a=1'b0;
		#2 $display("%b	\t%b", a, out[0]);
		#2 a=1'b1;
		#2 $display("%b	\t%b", a, out[0]);
		#2 a=1'bx;
		#2 $display("%b \t%b", a, out[0]);
		#2 a=1'bz;
		#2 $display("%b \t%b", a, out[0]);

		// TRUTH TABLE FOR NAND
		#2 $display("\nTRUTH TABLE FOR NAND: ");
		#2 $display("a\t b \tout");

		#2 a=1'b0;	b=1'b0;
		#2 $display("%b	\t%b \t%b", a, b, out[1]);
		#2 a=1'b0;	b=1'b1;
		#2 $display("%b	\t%b \t%b", a, b, out[1]);
		#2 a=1'b0;	b=1'bx;
		#2 $display("%b	\t%b \t%b", a, b, out[1]);
		#2 a=1'b0;	b=1'bz;
		#2 $display("%b	\t%b \t%b", a, b, out[1]);

		#2 a=1'b1;	b=1'b0;
		#2 $display("%b	\t%b \t%b", a, b, out[1]);
		#2 a=1'b1;	b=1'b1;
		#2 $display("%b	\t%b \t%b", a, b, out[1]);
		#2 a=1'b1;	b=1'bx;
		#2 $display("%b	\t%b \t%b", a, b, out[1]);
		#2 a=1'b1;	b=1'bz;
		#2 $display("%b	\t%b \t%b", a, b, out[1]);
		
		#2 a=1'bx;	b=1'b0;
		#2 $display("%b	\t%b \t%b", a, b, out[1]);
		#2 a=1'bx;	b=1'b1;
		#2 $display("%b	\t%b \t%b", a, b, out[1]);
		#2 a=1'bx;	b=1'bx;
		#2 $display("%b	\t%b \t%b", a, b, out[1]);
		#2 a=1'bx;	b=1'bz;
		#2 $display("%b	\t%b \t%b", a, b, out[1]);

		#2 a=1'bz;	b=1'b0;
		#2 $display("%b	\t%b \t%b", a, b, out[1]);
		#2 a=1'bz;	b=1'b1;
		#2 $display("%b	\t%b \t%b", a, b, out[1]);
		#2 a=1'bz;	b=1'bx;
		#2 $display("%b	\t%b \t%b", a, b, out[1]);
		#2 a=1'bz;	b=1'bz;
		#2 $display("%b	\t%b \t%b", a, b, out[1]);


		// TRUTH TABLE FOR XNOR
		#2 $display("\nTRUTH TABLE FOR XNOR: ");
		#2 $display("a\t b \tout");
		
		#2 a=1'b0;	b=1'b0;
		#2 $display("%b	\t%b \t%b", a, b, out[2]);
		#2 a=1'b0;	b=1'b1;
		#2 $display("%b	\t%b \t%b", a, b, out[2]);
		#2 a=1'b0;	b=1'bx;
		#2 $display("%b	\t%b \t%b", a, b, out[2]);
		#2 a=1'b0;	b=1'bz;
		#2 $display("%b	\t%b \t%b", a, b, out[2]);

		#2 a=1'b1;	b=1'b0;
		#2 $display("%b	\t%b \t%b", a, b, out[2]);
		#2 a=1'b1;	b=1'b1;
		#2 $display("%b	\t%b \t%b", a, b, out[2]);
		#2 a=1'b1;	b=1'bx;
		#2 $display("%b	\t%b \t%b", a, b, out[2]);
		#2 a=1'b1;	b=1'bz;
		#2 $display("%b	\t%b \t%b", a, b, out[2]);
		
		#2 a=1'bx;	b=1'b0;
		#2 $display("%b	\t%b \t%b", a, b, out[2]);
		#2 a=1'bx;	b=1'b1;
		#2 $display("%b	\t%b \t%b", a, b, out[2]);
		#2 a=1'bx;	b=1'bx;
		#2 $display("%b	\t%b \t%b", a, b, out[2]);
		#2 a=1'bx;	b=1'bz;
		#2 $display("%b	\t%b \t%b", a, b, out[2]);

		#2 a=1'bz;	b=1'b0;
		#2 $display("%b	\t%b \t%b", a, b, out[2]);
		#2 a=1'bz;	b=1'b1;
		#2 $display("%b	\t%b \t%b", a, b, out[2]);
		#2 a=1'bz;	b=1'bx;
		#2 $display("%b	\t%b \t%b", a, b, out[2]);
		#2 a=1'bz;	b=1'bz;
		#2 $display("%b	\t%b \t%b", a, b, out[2]);
		
		$stop;
	end
endmodule