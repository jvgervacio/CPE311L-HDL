`timescale 1 s / 100 ns

`include "../Drill 1/Drill1_1.v"
`include "../Drill 1/Drill1_2.v"
`define REGME reg [8*31:0]

module newtestbench;
	`REGME	regVar;
	reg		a, b,borrowIn;
	wire	diff, borrowOut;
	full_subtract	fs(diff, borrowOut, a, b, borrowIn);
	
	initial begin
		a=1'b1; b=1'b1; borrowIn=1'b0;
	end

	initial begin
		#10 a=1'b1;
		#10 a=1'b0; b=1'b1;
		#10 a=1'b1; b=1'b0;
		#10 borrowIn=1'b1;
	end

	initial begin
			$display("NEW TESTBENCH");
			$display("    a     b    borrowIn    difference   borrowOut  time");
			$monitor("%b  %b     %b    %b    %b   %d", a, b, borrowIn, diff, borrowOut, $time);
		#50 $finish;
	end
endmodule