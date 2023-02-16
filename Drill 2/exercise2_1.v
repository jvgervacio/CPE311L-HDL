module exercise2_1;
	reg[0:7] a;
	reg [8:0] b,c,d,e,f,g,h,i,j;
	
	initial begin
		a = 8'h F1;
		b = 2E4;
		c = 8'h 48;
		d = 8'h 65;
		e = 8'h 6c;
		f = 8'h 6c;
		g = 8'h 6f;
		$display("%h %d", a, b,);
		$display("\\"," %% ", "\t ","\"");
		$display("%c%C%C%C%C",c,d,e,f,g);
	end
endmodule 