module testbench ();
  logic clk, reset;


  tri writeEn;
  wire d, z, switch_a_m, act_ram, read_direction, carry, clk1, clk2, clk3, clk4;
  wire [3:0] inst;
  wire [2:0] bit_number;
  wire [6:0] address;
  wire [7:0] w, b, ans, inst_reg, k, in_mux, data_bus, direction;
  wire [7:0] counter, out_port;
  wire [13:0] opcode;

  pic i4 (.clk(clk), .reset(reset), .writeEn(writeEn), .d(d),
  .switch_a_m(switch), .read_direction(read_direction), .carry(carry),
  .inst(inst), .bit_number(bit_number), .address(address), .w(w),
  .b(b), .ans(ans), .inst_reg(inst_reg), .k(k), .in_mux(in_mux),
  .data_bus(data_bus), .direction(direction), .counter(counter),
  .opcode(opcode), .clk1(clk1), .clk2(clk2), .clk3(clk3), .clk4(clk4),
  .out_port(out_port), .z(z));


  initial begin
    $display("\nq1 \tq2 \tq3 \tq4 \topcode \t\t\tinst \tans \t\tdata_bus \t\tb \t\tw \t\tpc \tout_port");
    $monitor("%b \t%b \t%b \t%b \t%b%b \t%b \t%b \t%b \t%b \t%b \t%d \t%b", clk1, clk2, clk3, clk4, inst_reg, address, inst, ans, data_bus, b, w, counter, z);

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
