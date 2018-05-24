module data_reg (input logic [7:0] data,
  input logic reset, clk, writeEn,
  output logic [7:0] f);

  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      f <= 0;
    end else begin
      f <= data[7:0];
    end
  end
endmodule //w_reg
