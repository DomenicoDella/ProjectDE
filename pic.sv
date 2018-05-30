module pic (input wire clk, reset,
  output tri writeEn,
  output wire d, switch_a_m, act_ram, read_direction, carry, clk1, clk2, clk3, clk4,
  output wire [3:0] inst,
  output wire [2:0] bit_number,
  output wire [6:0] address,
  output wire [7:0] w, b, ans, inst_reg, k, in_mux, data_bus, direction,
  output wire [7:0] counter,
  output wire [13:0] opcode);

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

endmodule //testbench
