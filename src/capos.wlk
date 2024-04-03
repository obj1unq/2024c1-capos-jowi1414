
object rolando {
	var property capacidad = 2
	var property artefactos = #{}
	var hogar = castillo
	method levantar(artefacto) {
		if (artefactos.size() < capacidad) 
			 { artefactos.add(artefacto)
			}	
		
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
 }    
 

object castillo {
	var cofre = #{}
	method guardarTodosLosArtefactos(artefactos) {
		cofre.add(artefactos)
	}
}


