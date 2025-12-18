
module CLA_CarryGen #(
    parameter NG = 128,
    parameter GID_C1 = 0,
    parameter GID_C2 = 1,
    parameter GID_C3 = 2,
    parameter GID_C4 = 3
)(
    input wire C0,
    input wire [3:0] P,
    input wire [3:0] G,
    input wire [NG-1:0] fault_en_bus,
    input wire fault_val,
    output wire C1,
    output wire C2,
    output wire C3,
    output wire C4
);

    // surowe przeniesienia
    wire C1_int = G[0] | (P[0] & C0);
    wire C2_int = G[1] | (P[1] & C1_int);
    wire C3_int = G[2] | (P[2] & C2_int);
    wire C4_int = G[3] | (P[3] & C3_int);

    // wstrzykniecia uszkodzen
    fault_mux #(.GID(GID_C1), .NG(NG)) fm_c1 (C1_int, fault_en_bus, fault_val, C1);
    fault_mux #(.GID(GID_C2), .NG(NG)) fm_c2 (C2_int, fault_en_bus, fault_val, C2);
    fault_mux #(.GID(GID_C3), .NG(NG)) fm_c3 (C3_int, fault_en_bus, fault_val, C3);
    fault_mux #(.GID(GID_C4), .NG(NG)) fm_c4 (C4_int, fault_en_bus, fault_val, C4);

endmodule
