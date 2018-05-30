module testbench ();
  logic clk, reset;


  tri writeEn;
  wire d, switch_a_m, act_ram, read_direction, carry;
  wire [3:0] inst;
  wire [2:0] bit_number;
  wire [6:0] address;
  wire [7:0] w, b, ans, inst_reg, k, in_mux, data_bus, direction;
  wire [7:0] counter;
  wire [13:0] opcode;



  pcounter u0 (.clk(clk1), .reset(reset), .counter(counter), .read_direction(read_direction),
  .direction(data_bus), .clk3(clk3));
  alu u1 (.inst(inst), .reset(reset), .carry(carry), .ansf(ans),
  .b(b), .a(w), .bit_number(bit_number), .writeEn(writeEn), .clk2(clk2));
  w_reg u2 (.reset(reset), .clk(clk3), .w(w), .ans(ans), .d(d));
  decode u3(.inst_reg(inst_reg), .d(d), .inst(inst), .bit_number(bit_number),
  .switch_a_m(switch_a_m), .clk1(clk1), .clk2(clk2), .clk3(clk3),
  .clk4(clk4), .writeEn(writeEn), .act_ram(act_ram), .read_direction(read_direction));
  alu_mux u4(.f(in_mux), .k(k), .b(b), .switch_a_m(switch_a_m));
  inst_reg u5 (.k(k), .out_decode(inst_reg), .rom(opcode), .reset(reset),
  .clk(clk4), .address(address));
  rom u6 (.counter(counter), .opcode(opcode));
  clocks u7 (.clk(clk), .reset(reset), .clk1(clk1), .clk2(clk2),
  .clk3(clk3), .clk4(clk4));
  data_reg u9 (.reset(reset), .clk(clk2), .data(data_bus), .f(in_mux), .writeEn(writeEn));
  ram u8 (.d(d), .clk4(clk4), .address_r(address), .act_ram(act_ram), .writeEn(writeEn),
  .data(data_bus));
  buffer_alu u10 (.clk3(clk3), .clk4(clk4), .ansf(ans), .data_bus(data_bus));


  initial begin
    $display("\nq1 \tq2 \tq3 \tq4 \topcode \t\t\tinst \tans \t\tdata_bus \t\tb \t\tw \t\tpc \t\tread_d");
    $monitor("%b \t%b \t%b \t%b \t%b%b \t%b \t%b \t%b \t%b \t%b \t%b \t%b", clk1, clk2, clk3, clk4, inst_reg, address, inst, ans, data_bus, b, w, counter, read_direction);

    clk = 0;
    reset = 0;
    #5 reset = 1;
    #5 reset = 0;
    //w = 25;
  end

  always begin
    #1 clk = ~clk;
  end
  initial begin
    #150 $finish;
  end
endmodule //testbench
