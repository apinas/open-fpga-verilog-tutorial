//-------------------------------------------------------------------
//-- mux8_tb.v
//-- Banco de pruebas para el secuenciador de 8 estados con multiplexor
//-- de 8 a 1
//-------------------------------------------------------------------
//-- Written by Alejandro Piñas
//-------------------------------------------------------------------

module mux8_tb();

//-- Registro para generar la señal de reloj
reg clk = 0;

//-- Datos de salida del componente
wire [7:0] data;

//-- Instanciar el componente, con prescaler de 1 bit (para la simulacion)
mux8 #(.NP(1))
  dut(
	  .clk(clk),
	  .data(data)
  );

//-- Generador de reloj. Periodo 2 unidades
always #1 clk = ~clk;


//-- Proceso al inicio
initial begin

	//-- Fichero donde almacenar los resultados
	$dumpfile("mux8_tb.vcd");
	$dumpvars(0, mux8_tb);

	# 50 $display("FIN de la simulacion");
	$finish;
end

endmodule

