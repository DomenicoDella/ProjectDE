module decode (input logic [7:0] inst_reg,
  output  logic [2:0] bit_number,
  output logic [3:0] inst,
  output logic d, switch_a_m);

  always @ ( inst_reg ) begin
    if (inst_reg [7:6] == 2'b00) begin //byte oriented operations
      d <= inst_reg[1]; //define destination
      switch_a_m <= 1; //enable f on alu_mux
      case (inst_reg[5:2])
        4'b0111: inst <= 2; //ADDWF
        4'b0101: inst <= 4; //ANDWF
        4'b0001: inst <= 9; //CLEAR
        4'b1001: inst <= 12;  //COMPLEMENT
        4'b0011: inst <= 6; //DECF
        //4'b1011: inst <= ; //DECFSZ
        4'b1010: inst <= 5; //INCF
        //4'b1111: inst <= ; //INCFSZ
        4'b0100: inst <= 10; //IORWF
        4'b1000: inst <= 0; //MOVF
        4'b0000: inst <= 1; //MOVWF & NOP
        //4'b1101: inst <= ; //RLF
        //4'b1100: inst <= ; //RRF
        4'b0010: inst <= 3; //SUBWF
        4'b1110: inst <= 11; //SWAPBWF
        4'b0110: inst <= 7; //XORWF
        default: inst <= 1;
      endcase

    end else if (inst_reg [7:6] == 2'b01) begin //bit oriented operations
      d <= inst_reg[1]; //define destination as f
      switch_a_m <= 1; //enable f on alu_mux
      bit_number = inst_reg [3:1];
      casex (inst_reg[5:2])
        4'b00xx: inst <= 13; //BCF ;
        4'b01xx: inst <= 14; //BSF ;
        //4'b10xx: inst <= ; // ;
        //4'b11xx: inst <= ; // ;
        default: inst <= 1;
      endcase

    end else if (inst_reg [7:6] == 2'b11) begin  //literal operations
      d <= 0; //define destination as w
      switch_a_m <= 0; //enable k on alu_mux
      casex (inst_reg[5:2])
      4'b00xx: inst <= 0; //MOVLW
      4'b1000: inst <= 10; //IORLW
      4'b1001: inst <= 4; //ANDWL
      4'b1010: inst <= 7; //XORWL
      4'b110x: inst <= 3; //SUBWL
      4'b111x: inst <= 2; //ADDWL
      default: inst <= 1;
    endcase

  end else if (inst_reg [7:6] == 2'b10) begin

  end
end
endmodule //decode
