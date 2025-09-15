object rolando {
  var historialDeArtefactos = []
  
  var valorBase = 0

  //Setter del valor base de rolando
  method setValorBase(_valor){
    valorBase = _valor
  }

  //Getter del valor base de rolando
  method getValorBase(){
    return valorBase
  }

  //agrega artefactos a la "mochila"
  method encuentra(elemento) {
    if (mochilaDeRolando.getEspacio() >= 1) {
      mochilaDeRolando.guardar(elemento)
      self.actualizarHistorialDeArtefactos(elemento)
    } else {
      self.actualizarHistorialDeArtefactos(elemento)
    }
  }
  
  //Getter historial de artefactos
  method getHistorialDeArtefactos() = historialDeArtefactos
  
  //Setter de los artefactos en orden encontrados
  method actualizarHistorialDeArtefactos(elemento) {
    historialDeArtefactos.add(elemento)
  }
  
  //deja los artefactos que tiene en la mochila en la casa
  method dejarCosasEnCasa() {
    casaDeRolando.addArtefactos(self.getArtefactosDeRolando())
    mochilaDeRolando.setArtefactosPostCasa()
  }
  
  //getter de artefactos
  method getArtefactosDeRolando() = mochilaDeRolando.getArtefactos()
  
  //Posesiones de rolando 
  method posesiones() = casaDeRolando.getArtefactos() + self.getArtefactosDeRolando()
  
  // Booleano True si rolando tiene el "algo" dado entre sus posesiones
  method tenes(algo) = self.posesiones().contains(algo)
}

object mochilaDeRolando {
  var artefactos = #{}
  var espacio = 0
  
  //guarda elemento
  method guardar(elemento) {
    artefactos += #{elemento}
    self.decrementarEnUnoElEspacio()
  }
  
  //Getter del espacio
  method getEspacio() = espacio
  
  // decrementar en uno la variable espacio
  method decrementarEnUnoElEspacio() {
    espacio -= 1
  }
  
  //Getter artefactos
  method getArtefactos() = artefactos
  
  // Artefactos post dejarlos en la casa
  method setArtefactosPostCasa() {
    artefactos = #{}
    self.reestablecerCantidadDeEspacio()
  }
  
  // Vuelve el valor del espacio a 2
  method reestablecerCantidadDeEspacio() {
    espacio = 2
  }
  
  //Settea un nuevo valor para espacio
  method cantidadDeEspacio(cantidad) {
    espacio = cantidad
  }
}

object casaDeRolando {
  var artefactos = #{}
  
  //getter de artefactos
  method getArtefactos() = artefactos
  
  method addArtefactos(_artefactos) {
    artefactos = _artefactos + artefactos
  }
}

object espada {
  
}

object libro {
  
}

object collar {
  
}

object armadura {
  
}