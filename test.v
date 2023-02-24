module JK_Flipflop(
	input clk, J, K,
	output reg Q);
 	
	initial Q = 1'b1;

	always @(posedge clk) begin
		case ({J,K})
			2'b00 :  Q <= Q;  
			2'b01 :  Q <= 1'b0;  
			2'b10 :  Q <= 1'b1;  
			2'b11 :  Q <= ~Q;
		endcase
	end
endmodule

module test;
    reg 	clk, 	J, 	K;
	wire 	Q;

	JK_Flipflop jk(clk, J, K, Q);

	initial begin
		clk = 1'b0; 
		forever #10 clk <= ~clk;
	end

    initial begin
        #20  J <= 1'b0;   K <= 1'b0; 
        #20  J <= 1'b0;   K <= 1'b1; 
        #20  J <= 1'b1;   K <= 1'b0; 
        #20  J <= 1'b1;   K <= 1'b1;
        #20 $finish;
    end
endmodule