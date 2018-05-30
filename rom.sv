module rom(
 input logic [7:0] counter,
 output wire [13:0] opcode);

 logic [13:0] memory [0:1000];

 initial
   $readmemb("instruction.list", memory);

 assign opcode = memory[counter];
endmodule //rom
