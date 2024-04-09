
object rolando {
	var property capacidad = 2
	var property artefactos = #{}
	var property hogar = castillo
	var property poderBase = 5
	var property listaArtefactos = []
	method levantarSiPuede(artefacto) {
		if (self.puedeAgarrar()) 
			 { artefactos.add(artefacto)
			}	
		
	}
	method puedeAgarrar() {
		return artefactos.size() < capacidad
	}
	method irAHogar() {
	  self.guardarTodosLosArtefactosEnHogar()
	  self.liberarEspacio()
    }
    
    method guardarTodosLosArtefactosEnHogar() {
    	hogar.guardarTodosLosArtefactos(artefactos)
    	
    }
    method liberarEspacio() {
    	artefactos.clear()
    }
    method poder() {
    	return self.poderBase() + self.poderArtefactos()
    	
    }
    method poderArtefactos() {
    	return artefactos.sum({artefacto =>artefacto.poder(self)})
    }
    method batalla() {
    	artefactos.forEach({artefacto => artefacto.usar()})
    }
    method todasLasPosesiones() {
    	return artefactos.union(hogar.cofre())
    }
    method poderInvocacion() {
    	return hogar.poderInvocacion()
    }
    method puedeVencer(enemigo) {
    	return enemigo.poderPelea() < capo.poder()
    }
    method enemigosVencibles(tierra) {
    	return tierra.vencibles(self)
    }
 }    
 

object castillo {
	var cofre = #{}
	method guardarTodosLosArtefactos(artefactos) {
		cofre.add(artefactos)
	}
	method poderInvocacion(personaje) {
		// return cofre.max({artefacto => artefacto.poder()}).poder(personaje) es lo mismo
		//const artefactoMasPoderoso = cofre.max({artefacto => artefacto.poder()})
		//return artefactoMasPoderoso.poder(personaje)
		//return cofre.map({artefacto => artefacto.poder()}).maxIfEmpty(0)
		return if (not cofre.isEmpty()) self.masPoderoso(personaje).poder(personaje) else 0
	}
	method masPoderoso(personaje) {
		return cofre.max({artefacto => artefacto.poder()})
	}
}

object collarDivino {
	var usos = 0
	method poder(personaje) {
		return 3 + self.extra(personaje)
	}
	method extra(personaje) {
		return if (personaje.poderBase() > 6 ) {
			usos
		}
		else {
		 0	
		}
			
	}
	 method usar() {
	 	usos += 1
	 }
	
}

object espadaDelDestino {
	var esPrimeraVez = true
	method poder(personaje) {
		return personaje.poderBase() * self.coeficiente()
	}
	method coeficiente() {
		return if (esPrimeraVez ) {
			1
		} 
		else {
			0.5
		}
	}
	method usar() {
		esPrimeraVez = false
	}
}

object armaduraDeAceroValyrio {
	method poder(personaje) {
		return  6
	}
	method usar() {
		
	}
}

object libroHechizos {
	var property hechizos = []
	method poder(personaje) {
		return if(not hechizos.isEmpty()) hechizos.first().poder() else 0
	}
	method usar() {
		if (not hechizos.isEmpty()) {
			hechizos.remove(hechizos.first())
		}
		
	}
	 
}

object bendicion {
	method poder(personaje) {
		return 4
	}
	
		
	
}
object invisibilidad {
	method poder(personaje) {
		return personaje.poder(base)
	}
}
object invocacion {
	method poder(personaje) {
		return poderArtefactoMasPoderosoEnHogar
	}
	
}