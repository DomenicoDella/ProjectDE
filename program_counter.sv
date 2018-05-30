module pcounter (output logic [7:0] counter,
  input logic clk, clk3, reset, read_direction,
  input logic [7:0] direction);

  always @ (posedge clk or posedge clk3 or posedge reset) begin
    if (reset) begin
      counter <= 0;
    end else if (read_direction == 1 && clk3 == 1) begin
      counter <= direction;
    end else if (read_direction == 0 && clk == 1) begin
      counter <= counter + 1; //falta el load pc
    end
  end

endmodule //program_counter
