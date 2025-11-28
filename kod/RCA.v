module RCA #(
	parameter NG = 128,
	parameter GID_BASE = 0
)(
	input wire [3:0] X,
	input wire [3:0] Y,
	input wire Cin,
	input wire [NG-1:0] fault_en_bus,
	input wire fault_val,
	output wire [3:0] S,
	output wire Cout
);
   	wire s0, c0;
    	FA #(
    	    	.NG(NG),
    	    	.GID_SUM(GID_BASE + 0),
    	    	.GID_COUT(GID_BASE + 1)
    	) fa0 (
    	 	.a(X[0]), .b(Y[0]), .cin(Cin),
    		.fault_en_bus(fault_en_bus),
    		.fault_val(fault_val),
    		.sum(s0),
    		.cout(c0)
    	);

   	wire s1, c1;
    	FA #(
    	    	.NG(NG),
    	    	.GID_SUM(GID_BASE + 2),
    	    	.GID_COUT(GID_BASE + 3)
    	) fa1 (
    	 	.a(X[1]), .b(Y[1]), .cin(c0),
    		.fault_en_bus(fault_en_bus),
    		.fault_val(fault_val),
    		.sum(s1),
    		.cout(c1)
    	);

	wire s2, c2;
    	FA #(
    	    	.NG(NG),
    	    	.GID_SUM(GID_BASE + 4),
    	    	.GID_COUT(GID_BASE + 5)
    	) fa2 (
    	 	.a(X[2]), .b(Y[2]), .cin(c1),
    		.fault_en_bus(fault_en_bus),
    		.fault_val(fault_val),
    		.sum(s2),
    		.cout(c2)
    	);

	wire s3, c3;
    	FA #(
    	    	.NG(NG),
    	    	.GID_SUM(GID_BASE + 6),
    	    	.GID_COUT(GID_BASE + 7)
    	) fa3 (
    	 	.a(X[3]), .b(Y[3]), .cin(c2),
    		.fault_en_bus(fault_en_bus),
    		.fault_val(fault_val),
    		.sum(s3),
    		.cout(c3)
    	);
	
	assign S = {s3, s2, s1, s0};
	assign Cout = c3;
endmodule
