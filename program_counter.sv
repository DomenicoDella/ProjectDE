module pcounter (output logic [12:0] counter,
  input logic clk, reset);

  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      counter <= 0;
    end else begin
      counter <= counter + 1; //falta el load pc
    end
  end

endmodule //program_counter
