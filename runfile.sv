//Este archivo organiza los modulos
//para correr:
//iverilog -g2012 runfile.v
//vvp a.out
//-----------------------------------------------------
//Se deben incluir todos los modulos
//El orden de los modulos no importa
//-----------------------------------------------------
`include "program_counter.sv" //program_counter
`include "testbench.sv" //testbench
`include "alu.sv" //alu
`include "w_reg.sv" //ans to w 
