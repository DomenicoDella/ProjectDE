module alu_mux (output logic [7:0] b,
  input logic [7:0] k, f,
  input logic switch_a_m);

  always @ (k or f or switch_a_m) begin
    if (switch_a_m == 0) begin
      b <= k;
    end else if (switch_a_m == 1) begin
      b <= f;
    end
  end
endmodule //alu_mux
