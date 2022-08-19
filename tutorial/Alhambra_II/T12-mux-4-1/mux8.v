//-----------------------------------------------------------------------------
//-- Secuenciador de 8 estados usando un multiplexor de 8 a 1
//-- Written by Alejandro Piñas
//-----------------------------------------------------------------------------
//-- License GPL
//-----------------------------------------------------------------------------

//-- Entrada: reloj
//-- Salida: datos a conectar en los leds
module mux8(input wire clk, output reg [7:0] data);

//-- Parametros del secuenciador:
parameter NP = 23;         //-- Bits del prescaler
parameter VAL0 = 8'b00000000;  //-- Valor secuencia 0
parameter VAL1 = 8'b10101010;  //-- Valor secuencia 1
parameter VAL2 = 8'b01010101;  //-- Valor secuencia 2
parameter VAL3 = 8'b11001100;  //-- Valor secuencia 3
parameter VAL4 = 8'b00110011;  //-- Valor secuencia 4
parameter VAL5 = 8'b11110000;  //-- Valor secuencia 5
parameter VAL6 = 8'b00001111;  //-- Valor secuencia 6
parameter VAL7 = 8'b11111111;  //-- Valor secuencia 7

//-- Cables para las 9 entradas del multiplexor
wire [7:0] val0;
wire [7:0] val1;
wire [7:0] val2;
wire [7:0] val3;
wire [7:0] val4;
wire [7:0] val5;
wire [7:0] val6;
wire [7:0] val7;
wire [2:0] sel;  //-- Tres bits de selección

//-- Contador de 3 bits
reg [2:0] count = 0;
wire clk_pres; //-- Reloj una vez pasado por prescaler

//-- Por las entradas del mux cableamos los datos de entrada
assign val0 = VAL0;
assign val1 = VAL1;
assign val2 = VAL2;
assign val3 = VAL3;
assign val4 = VAL4;
assign val5 = VAL5;
assign val6 = VAL6;
assign val7 = VAL7;

//-- Implementación del multiplexor de 8 a 1
always@*
  case (sel)
     0 : data <= val0;
     1 : data <= val1;
     2 : data <= val2;
     3 : data <= val3;
     4 : data <= val4;
     5 : data <= val5;
     6 : data <= val6;
     7 : data <= val7;
     default : data <= 0;
  endcase

//-- Contador de 3 bits para realizar la seleccion de la fuente de datos
always @(posedge(clk_pres))
  count <= count + 1;

//-- El contador esta conectado a la entrada sel del mux
assign sel = count;

//-- Presaler que controla el incremento del contador para la selección
prescaler #(.N(NP))
  PRES (
    .clk_in(clk),
    .clk_out(clk_pres)
  );

endmodule


