module buffer_alu (input logic clk3, clk4,
  input logic [7:0] ansf,
  output wire [7:0] data_bus);

  assign data_bus = (clk3) ? ansf: 8'bzzzzzzzz;

  /*always @ ( posedge clk3 or ansf ) begin
    if (clk3 == 1 || clk4 == 1) begin
      data_bus = ansf;
    end else begin
      data_bus = 8'bzzzzzzzz;
    end
  end*/


endmodule //buffer_alu
