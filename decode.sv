module decode (input logic [7:0] inst_reg, output logic [3:0] inst,
  output logic d);
  always @ ( inst_reg ) begin
    if (inst_reg [7:6] == 00) begin
      d <= inst_reg[1];
      case (inst_reg[5:2])
        4'b0111: inst <= 2; //ADDWF
        4'b0101: inst <= 4; //ANDWF
        4'b0001: inst <= 9; //CLEAR
        //4'b1001: inst <= ;  //COMPLEMENT
        4'b0011: inst <= 6; //DECF
        //4'b1011: inst <= ; //DECFSZ
        4'b1010: inst <= 5; //INCF
        //4'b1111: inst <= ; //INCFSZ
        4'b0100: inst <= 10; //IORWF
        4'b0000: inst <= 0; //MOVF
        4'b0000: inst <= 1; //MOVWF & NOP
        //4'b1101: inst <= ; //RLF
        //4'b1100: inst <= ; //RRF
        4'b0010: inst <= 3; //SUBWF
        4'b1110: inst <= 11; //SWAPBWF
        4'b0110: inst <= 7; //XORWF
        default: inst <= 8;
      endcase
    end else if (inst_reg [7:6] == 01) begin

    end else if (inst_reg [7:6] == 11) begin

    end else if (inst_reg [7:6] == 10) begin  

    end
  end
endmodule //decode
