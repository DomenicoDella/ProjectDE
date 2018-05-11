module alu (input logic [3:0] inst,
  input logic reset,
  input logic [7:0] b, a,
  output logic carry,
  output logic [8:0] ans);

  //a_reg u2 (.reset(reset), .clk(clk), .carry(carry), .a(a), .ans(ans));

  always @ (inst or b or a) begin
    case (inst)
      4'b0000:  ans <= b; //pass b 0
      4'b0001:  ans <= a; //pass a 1
      4'b0010:  ans <= a + b; //add a b 2
      4'b0011:  ans <= b - a; //sub a b 3
      4'b0100:  ans <= (a & b); //and a b 4
      4'b0101:  ans <= b + 1; //inc b 5
      4'b0110:  ans <= b - 1; //decrease b 6
      4'b0111:  ans <= (a ^ b); //xor a b 7
      4'b1000:  ans <= ans; //nop 8
      4'b1001:  ans <= 0; //clear a 9
      4'b1010:  ans <= (a | b); //ior a b 10
      4'b1011:  ans <= {b[3:0], b[7:4]}; //swapnible 11
      4'b1100:  ans <= ~b; //complemet 12
      4'b1101:  ; //clear bit 13
      4'b1110:  ; //set bit 14
      default: ans <= ans;
    endcase
    carry <= ans[8];
  end
endmodule //alu
