module bcd_9s_complement(
	input	[3:0]	A,
	output	[3:0]	X);
	
	wire [3:0] a_not;
	wire [1:0] w;

	// X[3] = ~A[3]⋅ ~A[2]⋅ ~A[1]
	// X[2] = ~A[2]⋅ A[1] + A[2]⋅ ~A[1]
	// X[1] = A[1]
	// X[0] = ~A[0]

	not 
		n1(a_not[0], A[0]),
		n2(a_not[1], A[1]),
		n3(a_not[2], A[2]),
		n4(a_not[3], A[3]);

	and 
		a1(X[3], a_not[3],  a_not[2],	a_not[1]),
		a2(w[0], a_not[2],  	A[1]),
		a3(w[1], 	 A[2],  a_not[1]);
		
	or	(X[2], w[0], w[1]);
	
	assign X[0] = a_not[0];
	assign X[1] = A[1];
	
endmodule

module exercise3_2;
	reg 	[3:0] BCD;
	wire 	[3:0] nBCD;
	
	bcd_9s_complement bcd(BCD, nBCD);

	initial begin
		 	$display("9's Complement of BCD:");
		 	$display("BCD \tBCD'");
			$monitor("%b\t%b",BCD, nBCD);
		#1	BCD = 4'b0000; // 0
		#1	BCD = 4'b0001; // 1	
		#1	BCD = 4'b0010; // 2
		#1	BCD = 4'b0011; // 3
		#1	BCD = 4'b0100; // 4
		#1	BCD = 4'b0101; // 5
		#1	BCD = 4'b0110; // 6
		#1	BCD = 4'b0111; // 7
		#1	BCD = 4'b0000; // 8
		#1	BCD = 4'b1001; // 9

	end
endmodule