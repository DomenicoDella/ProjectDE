module alu (input logic [3:0] inst,
  input logic reset,
  input logic [7:0] b, a,
  output logic [8:0] ans);
  wire [7:0] a0;

  //a_reg u2 (.reset(reset), .clk(clk), .carry(carry), .a(a), .ans(ans));

  always @ (inst or b or a) begin
    case (inst)
      4'b0000:  ans <= b; //movb 0
      4'b0001:  ans <= a; //movab 1
      4'b0010:  ans <= a + b; //addab 2
      4'b0011:  ans <= a - b; //subtab 3
      4'b0100:  ans <= (a & b); //andab 4
      4'b0101:  ans <= b + 1; //incb 5
      4'b0110:  ans <= b - 1; //subb 6
      4'b0111:  ans <= (a ^ b); //xorab 7
      4'b1000:  ans <= ans; //nop 8
      4'b1001:  ans <= 0; //clear a 9
      4'b1010:  ans <= (a | b); //iorab 10
      default: ans <= ans;
    endcase
    //w <= ans[7:0];
  end
endmodule //alu
