primitive binary_subtractor(D, A, B, Cin);
	input A, B, Cin;
	output D;
	table
	//  A B Cin D
		0 0 0 : 0;
		0 0 1 : 1;
		0 1 0 : 1;
		0 1 1 : 0;
		1 0 0 : 1;
		1 0 1 : 0;
		1 1 0 : 0;
		1 1 1 : 1;
	endtable
endprimitive
 
primitive Carry_out (Cout, A, B, Cin);
	input A, B, Cin;
	output Cout;
	table
	//	A B Cin Cout
		0 0 0 : 0;
		0 0 1 : 1;
		0 1 0 : 1;
		0 1 1 : 1;
		1 0 0 : 0;
		1 0 1 : 0;
		1 1 0 : 0;
		1 1 1 : 1;
	endtable
endprimitive

module exercise4_2;
	reg A, B, Cin;
	wire [1:0] D;
	
	binary_subtractor   (D[0], A, B, Cin);
	Carry_out           (D[1], A, B, Cin);
	
	initial begin
		$display("Binary Subtrator");
		$display("A\tB\tCin\t:\tDiff\tCout");
		$monitor("%b\t%b\t%b\t:\t%b\t%b", A, B, Cin, D[0], D[1]);
		#1 A=1'bx;      B=1'bx;     Cin=1'bx;
		#1 A=1'b0;      B=1'b0;     Cin=1'b0;
		#1 A=1'b0;      B=1'b0;     Cin=1'b1;
		#1 A=1'b0;      B=1'b1;     Cin=1'b0;
		#1 A=1'b0;      B=1'b1;     Cin=1'b1;
		#1 A=1'b1;      B=1'b0;     Cin=1'b0;
		#1 A=1'b1;      B=1'b0;     Cin=1'b1;
		#1 A=1'b1;      B=1'b1;     Cin=1'b0;
		#1 A=1'b1;      B=1'b1;     Cin=1'b1;
		#1 $finish;
	end
endmodule