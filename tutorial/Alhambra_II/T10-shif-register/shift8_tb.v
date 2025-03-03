//-------------------------------------------------------------------
//-- shift4_tb.v
//-- Banco de pruebas para el registro de desplazamiento
//-- de 4 bits con prescaler
//-------------------------------------------------------------------
//-- BQ August 2015. Written by Juan Gonzalez (Obijuan)
//-------------------------------------------------------------------

module shift8_tb();

//-- Registro para generar la señal de reloj
reg clk = 0;

//-- Datos de salida del contador
wire [7:0] data;

//-- Instanciar el registro, con prescaler de 1 bit (para la simulacion)
//-- Valor inicial a cargar: 0001
shift8 #(.NP(1), .INI(4'b0001))
  C1(
	  .clk(clk),
	  .data(data)
  );

//-- Generador de reloj. Periodo 2 unidades
always #1 clk = ~clk;


//-- Proceso al inicio
initial begin

	//-- Fichero donde almacenar los resultados
	$dumpfile("shift8_tb.vcd");
	$dumpvars(0, shift8_tb);

	# 40 $display("FIN de la simulacion");
	$finish;
end

endmodule

