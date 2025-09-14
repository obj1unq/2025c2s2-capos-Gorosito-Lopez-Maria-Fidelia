object rolando {
 var espacio = 2
 var artefactos = []
 //agrega artefactos a la "mochila"
 method encuentra(elemento){
    if (espacio > 0) {
        espacio-1
        artefactos.add(elemento)
    }
 }
 //deja los artefactos que tiene en la mochila en la casa
 method dejarCosasEnCasa(){
    casaDeRolando.addArtefactos(self.getArtefactos())
    self.setArtefactosPostCasa()
 }
 //getter de artefactos
 method getArtefactos(){
    return artefactos
 }
 // Artefactos post dejarlos en la casa
 method setArtefactosPostCasa(){
    artefactos = []
 }
 //Posesiones de rolando 
 method posesiones(){
    return casaDeRolando.getArtefactos() ++ self.getArtefactos()
 }
}

object casaDeRolando{
    var artefactos = []
    //getter de artefactos
    method getArtefactos(){
        return artefactos
    }
    method addArtefactos(artefactosDeRolando){
        artefactos = artefactosDeRolando ++ artefactos
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