module mod3_comparator#(
    parameter NG = 128,
    parameter GID_OUT = 0
)(
    input  wire [1:0] X,   // reszta mod3 pierwszego operand
    input  wire [1:0] Y,   // reszta mod3 drugiego operand
    input  wire [NG-1:0] fault_en_bus,
    input  wire fault_val,
    output wire eq_err     // 1 = reszty rozne, 0 = takie same
);
    wire x1 = X[1];
    wire x0 = X[0];
    wire y1 = Y[1];
    wire y0 = Y[0];

    wire f_raw =
        (~y1 & y0) ^ (~x1 & x0) |
        (y1 & ~y0) ^ (x1 & ~x0);


    // fault injection na wyjsciu komparatora
    fault_mux #(.GID(GID_OUT), .NG(NG)) fm_cmp (
        .in(f_raw),
        .fault_en_bus(fault_en_bus),
        .fault_val(fault_val),
        .out(eq_err)
    );
endmodule

