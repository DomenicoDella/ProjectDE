//Este archivo organiza los modulos
//para correr:
//iverilog -g2012 runfile.sv
//vvp a.out
//-----------------------------------------------------
//Se deben incluir todos los modulos
//El orden de los modulos no importa
//-----------------------------------------------------
`include "clocks.sv" //cicles divition
`include "buffer_alu.sv" //chip select alu
`include "program_counter.sv" //program_counter
`include "testbench.sv" //testbench
`include "alu.sv" //alu
`include "w_reg.sv" //w_reg
`include "decode.sv" //decode
`include "alu_mux.sv" //alu mux in b
`include "inst_reg.sv" //inst reg
`include "rom.sv" //read only memory
`include "ram.sv" //random acces memory
`include "data_reg.sv" //data reg
`include "pic.sv" //
