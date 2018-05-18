module clocks (input logic clk, reset,
  output logic clk1, clk2, clk3, clk4,
  output logic [1:0] counter);

  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      counter <= 0;
    end else begin
      if (counter == 0) begin
        clk1 <= 1;
        clk2 <= 0;
        clk3 <= 0;
        clk4 <= 0;
        counter <= counter + 1;
      end else if (counter == 1) begin
        clk1 <= 0;
        clk2 <= 1;
        clk3 <= 0;
        clk4 <= 0;
        counter <= counter + 1;
      end else if (counter == 2) begin
        clk1 <= 0;
        clk2 <= 0;
        clk3 <= 1;
        clk4 <= 0;
        counter <= counter + 1;
      end else if (counter == 3) begin
        clk1 <= 0;
        clk2 <= 0;
        clk3 <= 0;
        clk4 <= 1;
        counter <= 0;
      end
    end

  end
endmodule // clocks

module testbench ();
  logic clk, clk1, clk2, clk3, clk4, reset;
  logic [1:0] counter;

  clocks u0 (.clk(clk), .clk1(clk1), .clk2(clk2), .clk3(clk3), .clk4(clk4), .reset(reset), .counter(counter));

  initial begin
    clk = 1;
    reset = 0;

    #1 reset = 1;
    #1 reset = 0;

    $monitor("%d \t%b \t%b \t%b \t%b", counter, clk1, clk2, clk3, clk4);
  end

  always
  #5 clk = ~clk;

  initial begin
    #250 $finish;
  end
endmodule //testbench
