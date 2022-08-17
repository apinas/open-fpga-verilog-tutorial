//----------------------------------------------------------------
//-- Inicializador
//-- Written by apinas
//-- GPL license
//----------------------------------------------------------------
//-- Generacion de una señal escalo (0 -> 1) para inicializar
//-- circuitos digitales
//----------------------------------------------------------------



//-- Version optimizada
//-- Entrada: Señal de reloj
//-- Salida: Señal escalón de inicialización
module init_ej(input wire clk, output ini);

//Parámetro división preescaler
parameter N = 3;

//Reloj de salida del preescaler
wire clk_out;

//-- Inicializar la salida a 0 (se pone para que funcione en simulación)
//-- En síntesis siempre estará a cero con independencia del valor que pongamos
reg ini = 0;

//-- Instanciación del preescaler
prescaler #(
		.N(N)
	)
	
	prescaler0(
		.clk_in(clk),
		.clk_out(clk_out)
);

//-- En cada flanco de subida se saca un "1" por la salida
always @(posedge(clk_out))
  ini <= 1;

endmodule


/*
//-- Implementacion natural
module init(input wire clk, output wire ini);

wire din;
reg dout = 0;

//-- Registro
always @(posedge(clk))
  dout <= din;

//-- Entrada conectadad a 1
assign din = 1;

//-- Conectar la salida
assign ini = dout;

endmodule
*/
