//-----------------------------------------------------------------------------
//-- inv2.v  Dos Puertas NOT
//-- Alejandro
//-----------------------------------------------------------------------------
//-- Ejemplo de dos puerta not, con dos entradas y dos salidas
//-- Es un circuito combinacional
//-----------------------------------------------------------------------------


//-- Definir el modulo con dos entradas y dos salidas
module inv2(input A1, input A2, output B1, output B2);

//-- Tanto la entrada como la salida son "cables"
wire A1;
wire A2;
wire B1;
wire B2;

  //-- Asignar a la salida la entrada negada
  assign B1 = ~A1;
  assign B2 = ~A2;

endmodule
