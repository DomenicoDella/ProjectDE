module stack #(parameter B = 13, L = 8)
  (input logic clk, reset, push,pop,act_st,
  inout [B-1:0]data,
  output logic [2:0] pointer
  );
//podria usar push como writeEn y agregar un seleccionar pila
  reg [B-1:0] reg_datos;
  logic [B-1:0] pila [0:L-1]; //13 bits de largo y 8 filas de stack
  logic [1:0]stack_state; //bit 1 representa vacio y bit 0 lleno

 assign data = reg_datos;

 always @ (posedge push,posedge reset,posedge pop) begin
   if (reset) begin
     reg_datos = 13'bz;
     pointer=0;
     stack_state=2'b10;
   end else if (push==1) begin
     if (stack_state[1]==1)begin
     pointer=3'b00;
     stack_state[1]=0;
     end else begin
     pila[pointer] = data;
     pointer = pointer + 1; end
   end else if (pop==1) begin
     pointer = pointer - 1;
     reg_datos = pila[pointer];
   end
 end

 endmodule
