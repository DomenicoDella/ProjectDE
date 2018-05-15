module inst_reg (input logic reset, clk,
  input logic [13:0] rom,
  output logic [6:0] address,
  output logic [7:0] out_decode, k);

  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      k <= 0;
      address <= 0;
      out_decode  <= 0;
    end else begin
      k <= rom[7:0];
      address <= rom[6:0];
      out_decode <= rom[13:6];
    end
  end

endmodule //inst_reg
