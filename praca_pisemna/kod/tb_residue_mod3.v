
`timescale 1ns/1ps

module tb_residue_mod3;

    localparam NG = 128;

    reg  [4:0] A;
    reg  [NG-1:0] fault_en_bus;
    reg  fault_val;

    wire [1:0] R;

    integer i;
    integer expected;

    // DUT
    residue_mod3 #(
        .NG(NG),
        .GID_BASE(0)
    ) dut (
        .A(A),
        .fault_en_bus(fault_en_bus),
        .fault_val(fault_val),
        .R(R)
    );

    // funkcja sprawdzaj?ca poprawno?? kodowania reszty
    function automatic is_valid_mod3;
        input [1:0] R;
        input integer exp;
        begin
            case (exp)
                0: is_valid_mod3 = (R == 2'b00) || (R == 2'b11);
                1: is_valid_mod3 = (R == 2'b01);
                2: is_valid_mod3 = (R == 2'b10);
                default: is_valid_mod3 = 0;
            endcase
        end
    endfunction

    initial begin
        $display("=== TEST residue_mod3 ===");

        fault_en_bus = '0;   // brak uszkodze?
        fault_val    = 1'b0;

        for (i = 0; i < 32; i = i + 1) begin
            A = i[4:0];
            #1;

            expected = i % 3;

            if (!is_valid_mod3(R, expected)) begin
                $display(
                    "BLAD: A=%0d (0x%02h)  R=%b  expected_mod3=%0d",
                    i, i[4:0], R, expected
                );
            end
            else begin
                $display(
                    "OK:   A=%0d (0x%02h)  R=%b",
                    i, i[4:0], R
                );
            end
        end

        $display("=== KONIEC TESTU ===");
        $finish;
    end

endmodule
