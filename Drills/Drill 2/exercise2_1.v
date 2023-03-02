`define BYTE 8

module exercise2_1;
	integer a;
	real b;
	reg [(`BYTE*20) - 1: 0] str;
	initial begin
		a = 8'hF1;
		b = 5E3;
		str = "Hello";
		$display("%0H\t%0.0e", a, b);
		$display("\\ %% \t \"");
		$display("%0s", str);
		$display("%s", a > b ? "gt": "lt");
	end
endmodule 