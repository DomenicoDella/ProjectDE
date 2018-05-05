module testbench ();
  logic clk, reset, carry;
  logic [3:0] inst;
  logic [16:0] counter;
  logic [7:0] b;
  wire [8:0] ans;
  wire [7:0] w;


  pcounter u0 (.clk(clk), .reset(reset), .counter(counter));
  alu u1 (.inst(inst), .reset(reset), .ans(ans), .b(b), .a(w));
  w_reg u2 (.reset(reset), .clk(clk), .carry(carry), .w(w), .ans(ans));

  initial begin
    $display("\nclk  \treset \tcounter \tinst \t    b \t    w \t     ans ");
    $monitor("%b \t%b \t%d \t\t%b \t%d \t%d \t%d", clk, reset, counter, inst, b, w, ans);

    clk = 0;
    reset = 0;
    b = 0;
    //w = 0;
    inst = 0;

    #1 reset = 1;
    #1 reset = 0;

    #5 b = 10;
    //w = 25;
    #5 inst = 0;

    #10 inst = 1;
    #10 inst = 2;
    #10 inst = 3;
    #10 inst = 2;
    #10 inst = 0;
    b = 3;
    #10 inst = 4;
    b = 1;
    #10 inst = 5;
    b = 4;
    #10 inst = 6;
    b = 11;
    #10 inst = 0;
    b = 3;
    #10 inst = 7;
    b = 1;
    #10 inst = 0;
    b = 3;
    #10 inst = 10;
    b = 1;
    #10 inst = 8;

  end

  always begin
    #5 clk = ~clk;
  end
  initial begin
    #250 $finish;
  end
endmodule //testbench
