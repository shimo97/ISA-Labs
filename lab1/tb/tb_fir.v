//`timescale 1ns

module tb_fir ();

   wire CLK_i;
   wire RST_n_i;
   wire [11:0] DIN_i;
   wire VIN_i;
   wire [11:0] b0_i;
   wire [11:0] b1_i;
   wire [11:0] a1_i;
   wire [11:0] DOUT_i;
   wire VOUT_i;
   wire END_SIM_i;
   wire [3:0] ERR_i;
   wire DUT_VIN_i;

   clk_gen CG(.END_SIM(END_SIM_i),
  	      .CLK(CLK_i),
	      .RST_n(RST_n_i));

   data_maker SM(.CLK(CLK_i),
	         .RST_n(RST_n_i),
		 .VOUT(VIN_i),
		 .DOUT(DIN_i),
		 .b0(b0_i),
		 .b1(b1_i),
		 .a1(a1_i),
		 .END_SIM(END_SIM_i));

   data_sink DS(.CLK(CLK_i),
		.RST_n(RST_n_i),
		.VIN(VOUT_i),
                .DUT_VIN(DUT_VIN_i),
		.DIN(DOUT_i),
                .ERR(ERR_i));

   IIR_filter UUT(.CLK(CLK_i),
	     .RST_n(RST_n_i),
	     .DIN(DIN_i),
             .VIN(VIN_i),
	     .b0(b0_i),
	     .b1(b1_i),
	     .a1(a1_i),
             .DOUT(DOUT_i),
             .VOUT(VOUT_i)); 

   assign DUT_VIN_i = VIN_i;

endmodule

		   
