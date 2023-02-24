module T_Flipflop(
	input clk, T,
	output reg Q);

	initial	Q = 1'b1;

	always @ (negedge clk) begin
		if (T)
			Q <= ~Q;
		else
			Q <= Q;
	end
endmodule

module UpDown_Counter(
	input clk, M, 
	output [3:0] Q);

	reg T = 1'b1;

	T_Flipflop
		tff_1(	     clk,	T,	Q[0]),
		tff_2((M ^ Q[0]),	T,	Q[1]),
		tff_3((M ^ Q[1]),	T,	Q[2]),
		tff_4((M ^ Q[2]),	T,	Q[3]);
	
endmodule

module exercise5_1;
	reg clk, M;
	wire [3:0] Q;

	UpDown_Counter counter(clk, M, Q);
	initial begin
		clk = 1'b0; 
		forever #10 clk = ~clk;
	end
	
	initial begin
		M = 0;
		$display("Mode: [0] Up counter, [1] Down counter");
		$display("Mode = 0");
		$monitor("%b", Q);
		#340 M = 1;	$display("Mode = 1");
		#340 $finish;
	end
endmodule
