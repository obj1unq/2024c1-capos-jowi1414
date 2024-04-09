import capos.*

object erethia {
	var property enemigos = #{archibaldo,caterina,astra}
	method vencibles(capo) {
		return enemigos.filter({enemigo => capo.puedeVencer(enemigo)})
	}
	// return enemigos.filter({enemigo => enemigo.poderPelea() < capo.poder()
	method hogaresConquistables(capo) {
		return self.vencibles(capo).map({enemigo => enemigo.hogar()}).asSet() 
	}
	method esPoderoso(capo) {
		
	}
}
object archibaldo {
	var property hogar = palacioMarmol 
	method poderPelea() {
		return 16
	}
	
	
}
object palacioMarmol {
	
}

object caterina {
	var property hogar = fortalezaAcero
	method poderPelea() {
		return 28
	}
}

object fortalezaAcero {
	
}

object astra {
	var property hogar = torreMarfil
	method poderPelea() {
		return 14 
	}
}

object torreMarfil {
	
}