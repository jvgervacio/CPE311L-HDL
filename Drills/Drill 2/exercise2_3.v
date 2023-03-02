`define PI 3.1416
module exercise2_3;
	real r, AnsrRem;
	initial begin
		r = 9;
		AnsrRem = (4/3)*`PI*$pow(r, 3);
		$display("%0.3f cubic units", AnsrRem);
	end
endmodule