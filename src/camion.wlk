import cosas.*

object camion {
	const property cosas = []
	
	method cargar(unaCosa) { 
		cosas.add(unaCosa)
		unaCosa.modificate()
	}
	method descargar(unaCosa) { cosas.remove(unaCosa) }
	method pesoTotal() = self.pesos().sum() + self.tara()
	
	method excedidoDePeso() = self.pesoTotal() > 2500
	
	method objetosPeligrosos(nivel) = self.filtrarPorPeligrosidad(nivel)
	
	method objetosMasPeligrosos(cosa) = self.filtrarPorPeligrosidad(cosa.nivelPeligrosidad())
	
	//Se cambio el nombre del parametro por peligrosidadLimite.
	method puedeCircularEnRuta(peligrosidadLimite) = self.filtrarPorPeligrosidad(peligrosidadLimite).isEmpty()
	
	method tieneAlgoQuePesaEntre(min, max) = cosas.find { cosa => cosa.peso().between(min,max) }
	
	method cosaMasPesada() = cosas.max { cosa => cosa.peso() }
	
	method totalBultos() = cosas.map { cosa => cosa.bulto().sum() }
	
	method pesos() = cosas.map { cosa => cosa.peso() }
	
	//Metodos agregados utiles para el ejercicio.
	method tara() = 1000
	
	//Metodo para filtrar segun un limite de peligrosidad
	method filtrarPorPeligrosidad(limite) = cosas.filter { cosa => cosa.nivelPeligrosidad() > limite }
}
