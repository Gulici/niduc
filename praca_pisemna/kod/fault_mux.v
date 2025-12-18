module fault_mux #(
    parameter NG = 128,
    parameter GID = 0
)(
    input  wire in,
    input  wire [NG-1:0] fault_en_bus,
    input  wire fault_val,
    output wire out
);
    assign out = (fault_en_bus[GID]) ? fault_val : in;
endmodule
