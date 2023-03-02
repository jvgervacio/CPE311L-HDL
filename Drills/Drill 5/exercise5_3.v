module D_Flipflop(
	input clk, D,
	output reg Q);
 	
	initial Q = 1'b0;

	always @(posedge clk) begin
		Q <= D;
	end
endmodule

module MUX_4x1(
	output reg OUT,
	input [1:0] select, [3:0] IN);

	always @(IN, select) begin
		case(select)
			2'b00: OUT = IN[0];
			2'b01: OUT = IN[1];
			2'b10: OUT = IN[2];
			2'b11: OUT = IN[3];
		endcase
	end
endmodule

module circuit5_3(
	input clk, [1:0] select, [3:0] data_in,
	output [3:0] data_out);

	/*
		L S		operation
		0 0		no change
		x 1		shift 1
		1 0		load data
	*/
	wire [3:0] D;

	D_Flipflop
		d3(clk, D[3], data_out[3]),
		d2(clk, D[2], data_out[2]),
		d1(clk, D[1], data_out[1]),
		d0(clk, D[0], data_out[0]);

	MUX_4x1
		mux3(D[3], select, {	   1'b0,	data_in[3],			   1'b0,		data_out[3]}),
		mux2(D[2], select, {data_out[3],	data_in[2],		data_out[3],		data_out[2]}),
		mux1(D[1], select, {data_out[2],	data_in[1],		data_out[2],		data_out[1]}),
		mux0(D[0], select, {data_out[1],	data_in[0],		data_out[1],		data_out[0]});
	
	

endmodule

module exercise5_3;
	reg		clk, load, shift;
	reg		[3:0] IN;
	wire 	[3:0] OUT;

	circuit5_3 circ(clk, {load, shift}, IN, OUT);
	initial begin
		clk <= 1'b0;
		forever #2 clk = ~clk;
	end
	/*
		L S		operation
		0 0		no change
		x 1		shift 1
		1 0		load data
	*/
	initial begin
		IN = 4'b1111;
		{load, shift} <= 2'b00;

		$display("L S\tIN\tOUT");
		$monitor("%b %b\t%b\t%b",load, shift, IN, OUT);
		#1	{load, shift} <= 2'b01;
		#4	{load, shift} <= 2'b10;
		#4	{load, shift} <= 2'b11;
		#4	{load, shift} <= 2'b00;
		#4	{load, shift} <= 2'b01;
		#4	{load, shift} <= 2'b10;
		#4	{load, shift} <= 2'b11;
		#20	$finish;

	end
	

endmodule