module alu (input logic reset,
  input logic [2:0] bit_number,
  input logic [3:0] inst,
  input logic [7:0] b, a,
  output logic carry,
  output logic [7:0] ansf);

  logic [8:0] ans;
  logic [7:0] set;

  always @ (inst or b or a or bit_number) begin

    case (bit_number) //genera el byte para operar en BiteOP
      0: set <= 8'b00000001;
      1: set <= 8'b00000010;
      2: set <= 8'b00000100;
      3: set <= 8'b00001000;
      4: set <= 8'b00010000;
      5: set <= 8'b00100000;
      6: set <= 8'b01000000;
      7: set <= 8'b10000000;
      default: set <=set;
    endcase


    case (inst)
      4'b0000:  ans <= b; //pass b 0
      4'b0001:  ans <= a; //pass a 1
      4'b0010:  ans <= a + b; //add a b 2
      4'b0011:  ans <= b - a; //sub a b 3
      4'b0100:  ans <= (a & b); //and a b 4
      4'b0101:  ans <= b + 1; //inc b 5
      4'b0110:  ans <= b - 1; //decrease b 6
      4'b0111:  ans <= (a ^ b); //xor a b 7
      4'b1000:  ans <= {b[6:0], carry}; //rotate left 8
      4'b1001:  ans <= 0; //set a 9
      4'b1010:  ans <= (a | b); //ior a b 10
      4'b1011:  ans <= {b[3:0], b[7:4]}; //swapnible 11
      4'b1100:  ans <= ~b; //complemet 12
      4'b1101:  ans <= (b | set); //set bit 13
      4'b1110:  ans <= (b & ~set); //clear bit 14
      4'b1111:  ans <= {carry, b[6:0]}; //rotate right 15
      default: ans <= ans;
    endcase
  end
  assign ansf = ans;
  assign carry = ans[8];
endmodule //alu
