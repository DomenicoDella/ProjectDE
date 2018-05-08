module w_reg (input logic [8:0] ans,
  input logic reset, clk, d,
  output logic carry,
  output logic [7:0] w);

  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      w <= 0;
    end else if (d == 0) begin
      w <= ans[7:0];
    end
  end
endmodule //w_reg
//pruega
