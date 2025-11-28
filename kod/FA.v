module FA #(
	parameter NG = 128,
	parameter GID_SUM = 0,
	parameter GID_COUT = 1
)(
	input wire a, b, cin,
	input wire [NG-1:0] fault_en_bus,
	input wire fault_val,
	output wire sum,
	output wire cout
);
	wire sum_int = a ^ b ^ cin;
	wire cout_int = (a & b) | (a & cin) | (b & cin);

	//fault injection
	fault_mux #(.GID(GID_SUM), .NG(NG)) fm_sum (sum_int,  fault_en_bus, fault_val, sum);
	fault_mux #(.GID(GID_COUT), .NG(NG)) fm_cout (cout_int, fault_en_bus, fault_val, cout);
endmodule