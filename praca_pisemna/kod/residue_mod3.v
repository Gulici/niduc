module residue_mod3 #(
	parameter NG = 128,
	parameter GID_BASE = 0
)(
	input wire [4:0] A,
	input wire [NG-1:0] fault_en_bus,
	input wire fault_val,
	output wire [1:0] R
);
	wire x0 = A[0];
    	wire x1 = ~A[1];
    	wire x2 = A[2];
    	wire x3 = ~A[3];
	wire x4 = A[4];
	wire x5 = 1;

   	wire s0, s1, s2, s3;
	wire c0, c1, c2, c3;

    	FA #(
    	    	.NG(NG),
    	    	.GID_SUM(GID_BASE + 0),
    	    	.GID_COUT(GID_BASE + 1)
    	) fa0 (
    	 	.a(x1), .b(x2), .cin(x0),
    		.fault_en_bus(fault_en_bus),
    		.fault_val(fault_val),
    		.sum(s0),
    		.cout(c0)
    	);

    	FA #(
    	    	.NG(NG),
    	    	.GID_SUM(GID_BASE + 2),
    	    	.GID_COUT(GID_BASE + 3)
    	) fa1 (
    	 	.a(x4), .b(x5), .cin(x3),
    		.fault_en_bus(fault_en_bus),
    		.fault_val(fault_val),
    		.sum(s1),
    		.cout(c1)
    	);

	FA #(
    	    	.NG(NG),
    	    	.GID_SUM(GID_BASE + 4),
    	    	.GID_COUT(GID_BASE + 5)
    	) fa2 (
    	 	.a(s1), .b(~c0), .cin(s0),
    		.fault_en_bus(fault_en_bus),
    		.fault_val(fault_val),
    		.sum(s2),
    		.cout(c2)
    	);

	FA #(
    	    	.NG(NG),
    	    	.GID_SUM(GID_BASE + 6),
    	    	.GID_COUT(GID_BASE + 7)
    	) fa3 (
    	 	.a(~c1), .b(~c2), .cin(s2),
    		.fault_en_bus(fault_en_bus),
    		.fault_val(fault_val),
    		.sum(s3),
    		.cout(c3)
    	);
	
	// Wynik modulo 3 - juz nie poddawany wstrzykiwaniu uszkodzen
	assign R = {c3, s3};
endmodule
