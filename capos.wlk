object rolando {
 var espacio = 2
 var artefactos = #{}
 var historialDeArtefactos = []

 //agrega artefactos a la "mochila"
 method encuentra(elemento){
    if (espacio >= 1) {
        self.decrementarEnUnoElEspacio(espacio)
        artefactos.add(elemento)
        self.actualizarHistorialDeArtefactos(elemento)
    }else 
      self.actualizarHistorialDeArtefactos(elemento)
 }
 
//Getter historial de artefactos
method historialDeArtefactos(){
   return historialDeArtefactos
}

 //Setter de los artefactos en orden encontrados
 method actualizarHistorialDeArtefactos(elemento){
   historialDeArtefactos.add(elemento)
 }

 // decrementar en uno la variable espacio
 method decrementarEnUnoElEspacio(_espacio){
    espacio = _espacio -1
 }

 // Vuelve el valor del espacio a 2
 method reestablecerCantidadDeEspacio(){
   espacio = 2
 }

 //deja los artefactos que tiene en la mochila en la casa
 method dejarCosasEnCasa(){
    casaDeRolando.addArtefactos(self.getArtefactosDeRolando())
    self.setArtefactosPostCasa()
 }

 //getter de artefactos
 method getArtefactosDeRolando(){
    return artefactos
 }

 // Artefactos post dejarlos en la casa
 method setArtefactosPostCasa(){
    artefactos = #{}
    self.reestablecerCantidadDeEspacio()
 }

 //Posesiones de rolando 
 method posesiones(){
    return casaDeRolando.getArtefactos() + self.getArtefactosDeRolando()
 }

// Booleano True si rolando tiene el "algo" dado entre sus posesiones
 method tenes(algo){
   return self.posesiones().contains(algo)
 }
 //intente usar posesiones como objeto rari, ojo
}

object casaDeRolando{
    var artefactos = #{}
    //getter de artefactos
    method getArtefactos(){
        return artefactos
    }
    method addArtefactos(artefactosDeRolando){
        artefactos = rolando.getArtefactosDeRolando() + artefactos
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