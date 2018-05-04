module testbench ();
  logic clk, reset, carry;
  logic [3:0] inst;
  logic [15:0] counter, f;
  wire [16:0] ans;
  wire [15:0] w;


  pcounter u0 (.clk(clk), .reset(reset), .counter(counter));
  alu u1 (.inst(inst), .reset(reset), .ans(ans), .f(f), .w(w));
  w_reg u2 (.reset(reset), .clk(clk), .carry(carry), .w(w), .ans(ans));

  initial begin
    $display("\nclk  \treset \tcounter \tinst \t    f \t    w \t     ans ");
    $monitor("%b \t%b \t%d \t\t%b \t%d \t%d \t%d", clk, reset, counter, inst, f, w, ans);

    clk = 0;
    reset = 0;
    f = 0;
    //w = 0;
    inst = 0;

    #1 reset = 1;
    #1 reset = 0;

    #5 f = 10;
    //w = 25;
    #5 inst = 0;

    #10 inst = 1;
    #10 inst = 2;
    #10 inst = 3;
    #10 inst = 2;
    #10 inst = 0;
    f = 3;
    #10 inst = 4;
    f = 1;
    #10 inst = 5;
    f = 4;
    #10 inst = 6;
    f = 11;
    #10 inst = 0;
    f = 3;
    #10 inst = 7;
    f = 1;
    #10 inst = 0;
    f = 3;
    #10 inst = 10;
    f = 1;
    #10 inst = 8;

  end

  always begin
    #5 clk = ~clk;
  end
  initial begin
    #250 $finish;
  end
endmodule //testbench
