module buffer_alu (input logic clk3,
  input logic [7:0] ansf,
  output logic [7:0] data_bus);

  always @ ( posedge clk3 or ansf ) begin
    if (clk3 == 1) begin
      data_bus = ansf;
    end else begin
      data_bus = 8'bzzzzzzzz;
    end
  end


endmodule //buffer_alu
