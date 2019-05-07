import cosas.*

object camion {
	const property cosas = []
	
	//Metodo para mapear la lista de cosas a sus pesos.
	method mapPesosDeCosas() = cosas.map { cosa => cosa.peso() }
	
	method cargar(unaCosa) { cosas.add(unaCosa) }
	
	method descargar(unaCosa) { cosas.remove(unaCosa) }
	
	method tara() = 1000
	
	method pesoTotal() = self.mapPesosDeCosas().sum() + self.tara()
	
	method excedidoDePeso() = self.pesoTotal() > 2500
	
	//Metodo util para los proximos 3 del ejercicio.
	method filtrarPorPeligrosidad(limite) = cosas.filter { cosa => cosa.nivelPeligrosidad() > limite }
	
	method objetosPeligrosos(nivel) = self.filtrarPorPeligrosidad(nivel)
	
	method objetosMasPeligrosos(cosa) = self.filtrarPorPeligrosidad(cosa.nivelPeligrosidad())
	
	//Se cambio el nombre del parametro por peligrosidadLimite.
	method puedeCircularEnRuta(peligrosidadLimite) = self.filtrarPorPeligrosidad(peligrosidadLimite).isEmpty()
}
