module AllBit(
    input [31:0]x,
    output zero, one);
    
	assign zero=~(|x);
	assign one=&x;
endmodule

module drill6_2;
	reg [31:0] inputX;
	wire outputZ, outputO;
	
	AllBit Abit(inputX, outputZ, outputO);
	initial fork
            $monitor($time,,," %h",inputX," %h",outputO," %h",outputZ);
            inputX=32'h0;
		#1  inputX=32'h12345678;
		#2  inputX=0;
		#3  inputX=32'hFFFFFFFF;
		#4  inputX=32;
		#4  $finish;
	join
endmodule