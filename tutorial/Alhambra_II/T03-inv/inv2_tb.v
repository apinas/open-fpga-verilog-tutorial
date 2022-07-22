//-------------------------------------------------------------------
//-- inv_tb.v  Banco de pruebas para el inversor
//-------------------------------------------------------------------
//-- Alejandro
//-------------------------------------------------------------------
//-- Pruebas del inversor. Se instancia el inversor. Se conecta un 
//-- cable a su salida y un registro a su entrada. Desde el programa
//-- principal se dan valores a las entradas (mediante din) y se
//-- comprueba si la salida es la correcta
//-------------------------------------------------------------------
module inv2_tb();


//-- Registro de 1 bit conectado a la entrada del inversor
reg din1;
reg din2;
//-- Cable conectado a la salida del inversor
wire dout1;
wire dout2;
//-- Instaciar el inversor, conectado din a la entrada A, y dout a la salida B
inv2 NOT1 (
 .A1 (din1),
 .A2 (din2),
 .B1 (dout1),
 .B2 (dout2)
);

//-- Comenzamos las pruebas
initial begin

	//-- Fichero donde almacenar los resultados
	$dumpfile("inv2_tb.vcd");
	$dumpvars(0, inv2_tb);

	//-- Ponemos la entrada del inversor a 0
  //-- OJO! Esto lo estamos haciendo a partir del instante 5.
  //-- Antes su estado es indefinido, por lo que la salida tambien
  //-- estará en un estado indefinido
	#5 din1 = 0;
	din2 = 0;
  
	//-- Tras 5 unidades de tiempo comprobamos la salida
	# 5 if (dout1 != 1)
         $display("---->¡ERROR! Esperado: 1. Leido: %d", dout1);
	if (dout2 != 1)
	$display("ERROR, valor no esperado en dout2");
  //-- Tras otras 5 unidades ponemos un 1 en la entrada
	# 5 din1 = 1;

	//-- Tras 5 unidades comprobamos si hay un 0 en la entrada
	# 5 if (dout1 != 0)
				$display("---> ¡ERROR! Esperado: 0. Leido: %d", dout1);

	# 5 din2 = 1;

	# 5 if (dout2 != 0)
		$display("Error, valor no esperado en dout2");

	# 5 $display("FIN de la simulacion");

  //-- Terminar la simulacion 10 unidades de tiempo
  //-- despues
	# 10 $finish;
end

endmodule
