module adder_mod3 #(
	parameter NG = 128,
	parameter GID_BASE = 0
)(
	input wire [1:0] X,
	input wire [1:0] Y,
	input wire [NG-1:0] fault_en_bus,
	input wire fault_val,
	output wire [1:0] R
);
	wire x0 = X[0];
    	wire x1 = ~X[1];
    	wire y0 = Y[0];
    	wire y1 = ~Y[1];

   	wire s0, c0;
    	FA #(
    	    	.NG(NG),
    	    	.GID_SUM(GID_BASE + 0),
    	    	.GID_COUT(GID_BASE + 1)
    	) fa0 (
    	 	.a(x1), .b(y0), .cin(x0),
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
    	 	.a(y1), .b(~c0), .cin(s0),
    		.fault_en_bus(fault_en_bus),
    		.fault_val(fault_val),
    		.sum(s1),
    		.cout(c1)
    	);
	
	// Wynik modulo 3 - juz nie poddawany wstrzykiwaniu uszkodzen
	assign R = {c1, s1};
endmodule
