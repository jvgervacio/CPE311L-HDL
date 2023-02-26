module JK_Flipflop(
	input clk, J, K,
	output reg Q);
 	
	initial Q <= 1'b0;

	always @(posedge clk) begin
		case ({J,K})
			2'b00 :  Q <= Q;  
			2'b01 :  Q <= 0;  
			2'b10 :  Q <= 1;  
			2'b11 :  Q <= ~Q;
		endcase
	end
endmodule

module circuit(
	input clk, X, Y, 
	output F1, F2);

	reg [1:0] J, K;
	
	/*
		JK EXCITATION
		Q	Q+	J	K

		0	0	0	x
		0 	1 	1 	x
		1	0	x	1
		1	1	x	0


		INPUTS	PRESENT		NEXT		JK INPUTS
		XY		F1	F2		F1	F2		J1	K1		J0	K0

		1x		0	0		0	0		0	x		0	x
		1x		0	1		0	1		0	x		x	0
		1x		1	0		1	0		x	0		0	x
		1x		1	1		1	1		x	0		x	0

		00		0	1		1	1		1	x		x	0
		00		1	1		1	0		x	0		x	1
		00		1	0		0	0		x	1		0	x		
		00		0	0		0	1		0	x		1	x

		01		0	1		0	0		0	x		x	1		
		01		0	0		1	0		1	x		0	x		
		01		1	0		1	1		x	0		1	x		
		01		1	1		0	1		x	1		x	0		

		J[0] = ~X ⋅ ~Y ⋅ ~F1 + ~X ⋅ Y ⋅ F1
		K[0] = ~X ⋅ ~Y ⋅  F1 + ~X ⋅ Y ⋅ ~F1
		J[1] = ~X ⋅ ~Y ⋅  F2 + ~X ⋅ Y ⋅ ~F2
		K[1] = ~X ⋅ ~Y ⋅ ~F2 +  Y ⋅ F2 
		
	*/
	assign 	J[0] = (~X & ~Y &  ~F1)	| (~X & Y & F1),
			K[0] = (~X & ~Y &  F1) 	| (~X & Y & ~F1),

			J[1] = (~X & ~Y &  F2) | (~X & Y & ~F2),
			K[1] = (~X & ~Y & ~F2) | (Y & F2);

	JK_Flipflop 
		f1(clk, J[0], K[0], F2),
		f2(clk, J[1], K[1], F1);

endmodule

module exercise5_2;
	reg 	clk, 	X, 	Y;
	wire 	F1, 	F2;

	circuit c(clk, X, Y, F1, F2);

	initial begin
		clk = 1'b0; 
		forever #10 clk = ~clk;
	end

	initial begin
			$display("Time\tX\tY\t\tF1\tF2");
			$monitor("%0t\t%b\t%b\t\t%b\t%b",$time, X, Y, F1, F2);
				X <= 1'b0;	Y <= 1'b0;
		#100	X <= 1'b0; 	Y <= 1'b1;
		#100	X <= 1'b1; 	Y <= 1'b0;
		#100 	X <= 1'b1; 	Y <= 1'b1;
		#100 	$finish;
	end
endmodule