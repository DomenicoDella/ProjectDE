module testbench ();
  logic clk, reset, carry;
  wire [3:0] inst;
  logic [16:0] counter;
  logic [7:0] b, inst_reg;
  wire [8:0] ans;
  wire [7:0] w;
  wire d;


  pcounter u0 (.clk(clk), .reset(reset), .counter(counter));
  alu u1 (.inst(inst), .reset(reset), .ans(ans), .b(b), .a(w));
  w_reg u2 (.reset(reset), .clk(clk), .carry(carry), .w(w), .ans(ans), .d(d));
  decode u3(.inst_reg(inst_reg), .d(d), .inst(inst));

  initial begin
    $display("\nclk  \treset \tcounter \tinst \t    b \t    w \t     ans ");
    $monitor("%b \t%b \t%d \t\t%b \t%d \t%d \t%d", clk, reset, counter, inst, b, w, ans);

    clk = 0;
    reset = 0;
    b = 0;
    //w = 0;
    inst_reg = 8'b00011101;

    #1 reset = 1;
    #1 reset = 0;

    #5 b = 10;
    #30 inst_reg = 8'b00011111;
    #10 inst_reg = 8'b00000000;
    //w = 25;
  end

  always begin
    #5 clk = ~clk;
  end
  initial begin
    #250 $finish;
  end
endmodule //testbench
