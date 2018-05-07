module decode (input logic [7:0] inst_reg, output logic [3:0] inst,
  output logic d);
  always @ ( inst_reg ) begin
    if (inst_reg [7:6] == 00) begin
      d <= inst_reg[1];
      case (inst_reg[5:2])
        4'b0111: inst <= 2;
        4'b0101: inst <= 4;
        4'b0001: inst <= 9;
        4'b1110: inst <= 11;
        default: inst <= 8;
      endcase
    end else if (inst_reg [7:6] == 01) begin

    end else if (inst_reg [7:6] == 11) begin

    end
  end
endmodule //decode
