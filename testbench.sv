module testbench ();
  logic clk, reset, carry;
  logic [7:0] f;

  wire d, switch_a_m;
  wire [3:0] inst;
  wire [2:0] bit_number;
  wire [6:0] address;
  wire [7:0] w, b, ans, inst_reg, k;
  wire [10:0] counter;
  wire [13:0] opcode;



  pcounter u0 (.clk(clk), .reset(reset), .counter(counter));
  alu u1 (.inst(inst), .reset(reset), .carry(carry), .ansf(ans),
  .b(b), .a(w), .bit_number(bit_number));
  w_reg u2 (.reset(reset), .clk(clk), .w(w), .ans(ans), .d(d));
  decode u3(.inst_reg(inst_reg), .d(d), .inst(inst), .bit_number(bit_number),
  .switch_a_m(switch_a_m));
  alu_mux u4(.f(f), .k(k), .b(b), .switch_a_m(switch_a_m));
  inst_reg u5 (.k(k), .out_decode(inst_reg), .rom(opcode), .reset(reset),
  .clk(clk), .address(address));
  rom u6 (.counter(counter), .opcode(opcode));


  initial begin
    $display("\n\t\ttimer  \treset \tcounter \tinst \t  b \t  w \t  ans \t d \t opcode");
    $monitor("%d \t%b \t%d \t\t%b \t%d \t%d \t%d \t%b \t%b \t%b", $time,
    reset, counter, inst, b, w, ans, d, opcode, inst_reg);

    clk = 0;
    reset = 0;
    f = 0;
    #1 reset = 1;
    #1 reset = 0;
    #5 f = 10;
    #5 f = 1;
    #5 f = 0;

    //w = 25;
  end

  always begin
    #5 clk = ~clk;
  end
  initial begin
    #250 $finish;
  end
endmodule //testbench
