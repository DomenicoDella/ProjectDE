module w_reg (input logic [16:0] ans,
  input logic reset, clk,
  output logic carry,
  output logic [15:0] w);

  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      w <= 0;
    end else begin
      w <= ans[15:0];
    end
  end
endmodule //w_reg
