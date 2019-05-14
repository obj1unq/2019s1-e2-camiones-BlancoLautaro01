object knightRider {
	method peso() = 500
	method nivelPeligrosidad() = 10
	method bulto() = 1
	method modificate() {  }
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() = 800
	method nivelPeligrosidad() = if (transformadoEnAuto) { 15 } else { 30 }
	method bulto() = 2
	method modificate() { transformadoEnAuto = false }
	
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
}

object paqueteDeLadrillos {
	var property cantidadLadrillos = 100
	
	method peso() = cantidadLadrillos * 2
	method nivelPeligrosidad() = 2
	method bulto() = if (cantidadLadrillos.between(0,100)) { 1 }
					 else if (cantidadLadrillos.between(101,300))	{ 2 }
					 else { 3 }
	method modificate() { cantidadLadrillos += 12 }
}

object arenaAGranel {
	var property peso = 10
	
	method nivelPeligrosidad() = 1
	method bulto() = 1
	method modificate() { peso += 20 }	
}

object bateriaAntiaerea {
	var tieneMisiles = true
	
	method peso() = if (tieneMisiles) { 300 } else { 200 }
	method nivelPeligrosidad() = if (tieneMisiles) { 100 } else { 0 }
	method bulto() = if (tieneMisiles) { 2 } else { 1 }
	method modificate() { self.cargarMisiles() }
	
	method cargarMisiles() { tieneMisiles = true }
	method descargarMisiles() { tieneMisiles = false }	
}

object contenedorPortuario {
	var objetosContenidos = []
	
	method agregar(cosa) { objetosContenidos.add(cosa) }
	method quitar(cosa) { objetosContenidos.remove(cosa) }
	
	method peso() = self.mapPesosDeObjetosContenidos().sum() + 100
	method nivelPeligrosidad() = 
		if (objetosContenidos.isEmpty()) { 0 } else { self.objetoMasPeligroso().nivelPeligrosidad() }
	method bulto() = 1 + objetosContenidos.map { obj => obj.bulto() }.sum()
	method modificate() { objetosContenidos.forEach { obj => obj.modificate() } }
	
	//Metodo para mapear la lista de objetosContenidos a sus pesos.
	method mapPesosDeObjetosContenidos() = objetosContenidos.map { obj => obj.peso() }
	
	
	/*Este estrategia de hacer una funcion parcial para poder condicionarla no me gusta y supongo que hay algun
	constructor para remplazar el .max{} usado en la parcial, pero no lo encontre.*/
	method objetoMasPeligroso() = if (not objetosContenidos.isEmpty()) { self.objetoMasPeligroso_() } else { null }
	
	method objetoMasPeligroso_() = objetosContenidos.max{ obj => obj.nivelPeligrosidad()
	}
}

object residuosRadioactivos {
	var property peso = 50
	
	method nivelPeligrosidad() = 200
	method bulto() = 1
	method modificate() { peso += 15 }
}

object embalajeDeSeguridad {
	var property cosa = knightRider
	
	method peso() = cosa.peso()
	method nivelPeligrosidad() = cosa.nivelPeligrosidad() / 2
	method bulto() = 2
	method modificate() { }
}