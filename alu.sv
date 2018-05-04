module alu (input logic [3:0] inst,
  input logic reset,
  input logic [15:0] f, w,
  output logic [16:0] ans);
  wire [15:0] w0;

  //w_reg u2 (.reset(reset), .clk(clk), .carry(carry), .w(w), .ans(ans));

  always @ (inst or f or w) begin
    case (inst)
      4'b0000:  ans <= f; //movf 0
      4'b0001:  ans <= w; //movwf 1
      4'b0010:  ans <= w + f; //addwf 2
      4'b0011:  ans <= w - f; //subtwf 3
      4'b0100:  ans <= (w & f); //andwf 4
      4'b0101:  ans <= f + 1; //incf 5
      4'b0110:  ans <= f - 1; //subf 6
      4'b0111:  ans <= (w ^ f); //xorwf 7
      4'b1000:  ans <= ans; //nop 8
      4'b1001:  ans <= 0; //clear w 9
      4'b1010:  ans <= (w | f); //iorwf 10
      default: ans <= ans;
    endcase
    //w <= ans[15:0];
  end
endmodule //alu
