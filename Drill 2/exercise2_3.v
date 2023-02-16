`define pi 3.1416
module exercise2_3;
	real r,s,AnsrRem;
	initial begin
		r = 9;
		s = 4/3;
		AnsrRem = s*`pi*r*r*r;
		$display("The volume of the cylinder is equal to ", AnsrRem, " cubic units");
	end
endmodule