//---------------------------------------------------
//-- Banco de prueba para Fport
//-- Alejandro
//---------------------------------------------------


//-- Modulo para el test bench
module Fport_extra_tb;

//-- Bus de 5 cables para conectarlos a la salida
//-- del componente Fport
wire [4:0] DATA;

//--Instanciar el componente. Conectado al cable DATA
Fport_extra FP1 (
  .data (DATA)
);

//-- Comenzamos las pruebas
initial begin

	//-- Fichero donde almacenar los resultados
	$dumpfile("Fport_extra_tb.vcd");
	$dumpvars(0, Fport_extra_tb);

	//-- Pasadas 10 unidades de tiempo comprobamos
  //-- si el cable tiene el patron establecido
  # 10 if (DATA != 5'b10101)
         $display("---->¡ERROR! Salida Erronea");
			 else
			   $display("Componente ok!");

  //-- Terminar la simulacion 10 unidades de tiempo
  //-- despues
	# 10 $finish;
end

endmodule


