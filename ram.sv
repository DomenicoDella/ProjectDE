module ram #(parameter N = 68, M = 8, A=7)//escribir, leer, alta impedancia
  (input logic clk2,clk3, clk4, clk1, writeEn, act_ram, d,
  input logic [A-1:0] address_r,
  output logic [7:0] out_port,
  inout  [M-1:0] data);
  //reg outEnable_read;
  logic [M-1:0] data_out;
  logic [M-1:0] memoria [0:N];//cantidad de bits y localidades como una matriz

  assign data = (act_ram && !writeEn) ? data_out : 8'bz;
  assign out_port = memoria[0];
  //asign me simmula el buffer triestado, este se implementa
  // para saber si voy a usar o no la ram


  //escribir la memoria
  always @(writeEn or address_r or act_ram or data or d) begin
    if (writeEn && act_ram && d) begin
    memoria [address_r] <= data;
  end
end
  //leer en la memoria
  always @(address_r or act_ram or writeEn) begin
    if (act_ram && !writeEn) begin
      data_out <= memoria[address_r];
      ;
    end
  end
endmodule
