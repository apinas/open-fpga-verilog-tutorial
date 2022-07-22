//--------------------------------------------------
//-- Fixed Port
//-- Sacar un valor fijo de 5 bits
//--------------------------------------------------
//-- Alejandro Piñas
//--------------------------------------------------
//-- Licensed under the GPL v2
//--------------------------------------------------


//-- El modulo tiene un bus de 5 bits de salida
//-- En verilog los arrays se define usando la notacion
//-- [B:b] donde B es el numero de bit de mayor peso y
//-- b el de menor
module Fport_extra(output [4:0] data);

//-- La salida del modulo son 5 cables
wire [4:0] data;

  //-- Sacar el valor por el bus de salida
  //-- En verilog se indica primero el numero de bits
  //-- y luego el formato (binario, hexa, decimal, etc...)
  assign data = 5'h15; //-- 5'b10101

endmodule


