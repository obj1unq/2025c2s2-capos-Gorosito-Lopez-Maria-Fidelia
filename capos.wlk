object rolando {
  var historialDeArtefactos = []
  var mochilaDeRolando = mochila
  var casaDeRolando = castilloDePiedra
  var valorBase = 0

  //Rolando va a la batalla
  method batalla(){
    return valorBase + mochila.poderDePelea(self)
  }

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
    if (mochila.getEspacio() >= 1) {
      mochila.guardar(elemento)
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
    casaDeRolando.addArtefactos(mochila.getArtefactos()) 
    mochila.setArtefactosPostCasa() 
  }
  
  //Posesiones de rolando 
  method posesiones() = casaDeRolando.getArtefactos() + mochila.getArtefactos()
  
  // Booleano True si rolando tiene el "algo" dado entre sus posesiones
  method tenes(algo) = self.posesiones().contains(algo)

  //Setter de la mochila de rolando
  method setMochila(_mochila) {
    mochilaDeRolando = _mochila
  }

  //Setter del hogar de rolando
  method setCasaDeRolando(_hogar){
    casaDeRolando = _hogar
  }
  method valorBase(){
    return valorBase
  }
}

////MOCHILA DE ROLANDO ////
object mochila {
  var artefactos = #{}
  var espacio = 0
  
  method poderDePelea(personaje){
    return artefactos.sum({artefacto => artefacto.poder(personaje)})
  }
  // se necesita declarar primero quien es el pj

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

//////////CASTILLO DE PIEDRA//////////////
object castilloDePiedra {
  var artefactos = #{}
  
  //getter de artefactos
  method getArtefactos() = artefactos
  
  method addArtefactos(_artefactos) {
    artefactos = _artefactos + artefactos
  }
}

//////////ESPADA//////////
object espada {
  var usosDeLaEspada = 0
  method usar(){
    usosDeLaEspada =+ 1
  }
  //Get poder
  method poder(personaje){
    if (usosDeLaEspada == 0){
      return personaje.getValorBase()
      
    }else{
      return personaje.getValorBase() * 0.5
    }
  }
}

//////////LIBRO/////////////
object libro {
  
}

//////////COLLAR//////////
object collar {
  var batallasEnLasQueSeUso = 0
  const poderDePelea = 3
  method usar(){
    batallasEnLasQueSeUso = batallasEnLasQueSeUso +1
  }
  //Get poder
  method poder(personaje){
    if (personaje.getValorBase() > 6) {
    return personaje.getValorBase() + poderDePelea + batallasEnLasQueSeUso
    }else 
    return personaje.getValorBase() + poderDePelea
  }
}

//////////ARMADURA///////////
object armadura {
  const poderDePelea = 6

  //Get poder
  method poder(personaje){
    return personaje.getValorBase() + poderDePelea
  }
}

/*
Podriamos en vez de tener variables globales, plantear setters y getters para determinar variables para poder pasarle que "casa" tiene por ejemplo 
*/




// el method usar tiene que ser polimorfico