object rolando {
  var historialDeArtefactos = []
  var mochilaDeRolando = mochila
  var casaDeRolando = castilloDePiedra
  var valorBase = 0

  //Rolando va a la batalla
  method batalla(){
    return valorBase + mochila.poderDePelea()
    // self.poderDePelea()
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
    historialDeArtefactos.add(elemento) //tiene variable global
  }
  
  //deja los artefactos que tiene en la mochila en la casa
  method dejarCosasEnCasa() {
    casaDeRolando.addArtefactos(mochila.getArtefactos()) //tiene variable global
    mochila.setArtefactosPostCasa() //tiene variable global
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
}

////MOCHILA DE ROLANDO ////
object mochila {
  var artefactos = #{}
  var espacio = 0
  
  method poderDePelea(){
    return artefactos.sum({artefactos => artefactos.poder()})
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
  var poder = 0
  var usosDeLaEspada = 0
  method usar(personaje){
    if (usosDeLaEspada == 0){
      poder = personaje.getValorBase()
      usosDeLaEspada =+ 1
    }else{
      poder = personaje.getValorBase() * 0.5
      usosDeLaEspada =+ 1
    }
  }
  //Get poder
  method poder(){
    return poder
  }
}

//////////LIBRO/////////////
object libro {
  
}

//////////COLLAR//////////
object collar {
  var batallasEnLasQueSeUso = 0
  const poderDePelea = 3
  var poder = 0
  method usar(personaje){
    if (personaje.getValorBase() > 6) {
      poder = personaje.getValorBase() + poderDePelea + batallasEnLasQueSeUso
      batallasEnLasQueSeUso =+ 1
    }else 
    poder = personaje.getValorBase() + poderDePelea
    batallasEnLasQueSeUso =+ 1
  }
  //Get poder
  method poder(){
    return poder
  }
}

//////////ARMADURA///////////
object armadura {
  const poderDePelea = 6
  var poder = 0
  method usar(personaje){
   poder = personaje.getValorBase() + poderDePelea
  }
  //Get poder
  method poder(){
    return poder
  }
}

/*
Podriamos en vez de tener variables globales, plantear setters y getters para determinar variables para poder pasarle que "casa" tiene por ejemplo 
*/



