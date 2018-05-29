module pcounter (output logic [10:0] counter,
  input logic clk, reset, read_direction,
  input logic [7:0] direction);

  always @ (posedge clk or posedge reset or read_direction) begin
    if (reset) begin
      counter <= 0;
    end else if (read_direction == 1) begin
      counter <= direction;
    end else begin
      counter <= counter + 1; //falta el load pc
    end
  end

endmodule //program_counter
