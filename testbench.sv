module testbench ();
  logic clk, reset, carry;
  wire [3:0] inst;
  logic [12:0] counter;
  logic [7:0] f, k, inst_reg;
  wire d, switch_a_m;
  wire [2:0] bit_number;
  wire [7:0] w, b, ans;



  pcounter u0 (.clk(clk), .reset(reset), .counter(counter));
  alu u1 (.inst(inst), .reset(reset), .carry(carry), .ansf(ans),
  .b(b), .a(w), .bit_number(bit_number));
  w_reg u2 (.reset(reset), .clk(clk), .w(w), .ans(ans), .d(d));
  decode u3(.inst_reg(inst_reg), .d(d), .inst(inst), .bit_number(bit_number),
  .switch_a_m(switch_a_m));
  alu_mux u4(.f(f), .k(k), .b(b), .switch_a_m(switch_a_m));

  initial begin
    $display("\n\t\ttimer  \treset \tcounter \tinst \t  b \t  w \t  ans \t c \t inst_reg");
    $monitor("%d \t%b \t%d \t\t%b \t%d \t%d \t%d \t%b \t%b \t%b", $time,
    reset, counter, inst, b, w, ans, carry, inst_reg, bit_number);

    clk = 0;
    reset = 0;
    f = 0;
    k = 1;
    //w = 0;
    inst_reg = 8'b00011101;

    #1 reset = 1;
    #1 reset = 0;

    #5 f = 10;
    #30 inst_reg = 8'b00011111;
    #10 inst_reg = 8'b00111001;
    #10 inst_reg = 8'b00001001;
    #10 inst_reg = 8'b00000101;
    #10 inst_reg = 8'b00000111;
    f = 0;
    #10 inst_reg = 8'b00100101;
    #10 inst_reg = 8'b11000000;
    #10 inst_reg = 8'b11111000;
    #10 inst_reg = 8'b01010100;
    #5 f = 4;
    #10 inst_reg = 8'b01000100;
    //w = 25;
  end

  always begin
    #5 clk = ~clk;
  end
  initial begin
    #250 $finish;
  end
endmodule //testbench
