//VERILOG FOR 2-BIT BY 2-BIT MULTIPLIER USING HALF ADDERS
module half_adder(
	input A, B,
	output sum, carry
);
	xor (sum, A, B);
	and (carry, A, B);
endmodule

module multiplier(
	input [1:0] A, B,
	output [3:0] P);
	
	wire s[3:0];

	and	
		a1(P[0], A[0], B[0]),
		a2(s[0], A[1], B[0]),
		a3(s[1], A[0], B[1]),
		a4(s[2], A[1], B[1]);

	half_adder h1(s[0], s[1], P[1], s[3]);
	half_adder h2(s[3], s[2], P[2], P[3]);

endmodule

module exercise3_3;
	reg  [1:0]	A, B;
	wire [3:0]	P;

	multiplier	m(A, B, P);

	initial begin
			$display("A\tB\tPRODUCT");
			$monitor("%b\t%b\t%b", A, B, P);
		#1	A = 2'b00;	B = 2'b00;
		#1	A = 2'b00;	B = 2'b01;
		#1	A = 2'b00;	B = 2'b10;
		#1	A = 2'b00;	B = 2'b11;
		#1	A = 2'b01;	B = 2'b00;
		#1	A = 2'b01;	B = 2'b01;
		#1	A = 2'b01;	B = 2'b10;
		#1	A = 2'b01;	B = 2'b11;
		#1	A = 2'b10;	B = 2'b00;
		#1	A = 2'b10;	B = 2'b01;
		#1	A = 2'b10;	B = 2'b10;
		#1	A = 2'b10;	B = 2'b11;
		#1	A = 2'b11;	B = 2'b00;
		#1	A = 2'b11;	B = 2'b01;
		#1	A = 2'b11;	B = 2'b10;
		#1	A = 2'b11;	B = 2'b11;
		#1 	$stop;
	end
endmodule