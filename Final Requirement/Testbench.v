`include "./Checksum.v"

module FinalRequirement_testbench;
    parameter N_WORDS = 5, WIDTH = 16;
    reg  [((N_WORDS + 1) * WIDTH) - 1:0] sender_data_in, receiver_data_in;
    wire [WIDTH-1 :0] scs_out, rcs_out;

    integer i;

    Checksum #(.N(N_WORDS), .WIDTH(WIDTH)) 
        scs(sender_data_in, scs_out),
        rcs(receiver_data_in, rcs_out);

    initial begin
        sender_data_in   = 80'h00FE_C523_FDA1_D68A_AF02;
        $write("ORIGINAL DATA: ");
        for(i = N_WORDS-1; i >= 0; i = i-1) $write("%h ", sender_data_in[i*WIDTH+:WIDTH]);
        $display("\nCHECKSUM: %h", scs_out);

        #1 receiver_data_in = {scs_out, sender_data_in[79:0]};
        #1 $display("\n\nSENDING DATA WITHOUT ERROR:");
        #1 $write("\tDATA: ");
        #1 for(i = N_WORDS; i >= 0; i = i-1) $write("%h ", receiver_data_in[i*WIDTH+:WIDTH]);
        #1 $display("\n\tRESULT: %H , %s", rcs_out, rcs_out == 0 ? "ERROR FREE":"ERROR DETECTED");

        #1 receiver_data_in[0] = ~receiver_data_in[0];
        #1 $display("\nSENDING DATA WITH ERROR:");
        #1 $write("\tDATA: ");
        #1 for(i = N_WORDS; i >= 0; i = i-1) $write("%h ", receiver_data_in[i*WIDTH+:WIDTH]);
        #1 $display("\n\tRESULT: %H , %s", rcs_out, rcs_out == 0 ? "ERROR FREE":"ERROR DETECTED");
    end
endmodule