object knightRider {
	method peso() = 500
	method nivelPeligrosidad() = 10
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() = 800
	method nivelPeligrosidad() = if (transformadoEnAuto) { 15 } else { 30 }
	
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
}

object paqueteDeLadrillos {
	var property cantidadLadrillos = 1
	
	method peso() = cantidadLadrillos * 2
	method nivelPeligrosidad() = 2
}

object arenaAGranel {
	var property peso = 1
	
	method nivelPeligrosidad() = 1
}

object bateriaAntiaerea {
	var tieneMisiles = true
	
	method peso() = if (tieneMisiles) { 300 } else { 200 }
	method nivelPeligrosidad() = if (tieneMisiles) { 100 } else { 0 }
	
	method cargarMisiles() { tieneMisiles = true }
	method descargarMisiles() { tieneMisiles = false }	
}

object contenedorPortuario {
	var objetosContenidos = []
	
	method peso() = self.mapPesosDeObjetosContenidos().sum() + 100
	method nivelPeligrosidad() = 
		if (objetosContenidos.isEmpty()) { 0 } else { self.objetoMasPeligroso().nivelPeligrosidad() }
	
	//Metodo para mapear la lista de objetosContenidos a sus pesos.
	method mapPesosDeObjetosContenidos() = objetosContenidos.map { obj => obj.peso() }
	
	method objetoMasPeligroso() = objetosContenidos.max { obj => obj.nivelPeligrosidad() }
}

object residuosRadioactivos {
	var property peso = 1
	
	method nivelPeligrosidad() = 200
}

object embalajeDeSeguridad {
	var property cosa = knightRider
	
	method peso() = cosa.peso()
	method nivelPeligrosidad() = cosa.nivelPeligrosidad() / 2
}




