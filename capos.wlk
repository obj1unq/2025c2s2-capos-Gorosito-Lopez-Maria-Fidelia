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
  method valorBase(_valor){
    valorBase = _valor
  }

  //Getter del valor base
  method valorBase(){
    return valorBase
  }

  //agrega artefactos a la "mochila"
  method encuentra(elemento) {
    if (mochila.espacio() >= 1) {
      mochila.guardar(elemento)
      self.actualizarHistorialDeArtefactos(elemento)
    } else {
      self.actualizarHistorialDeArtefactos(elemento)
    }
  }
  
  //Getter historial de artefactos
  method historialDeArtefactos() = historialDeArtefactos
  
  //Setter de los artefactos en orden encontrados
  method actualizarHistorialDeArtefactos(elemento) {
    historialDeArtefactos.add(elemento) 
  }
  
  //deja los artefactos que tiene en la mochila en la casa
  method dejarCosasEnCasa() {
    casaDeRolando.addArtefactos(mochila.artefactos()) 
    mochila.artefactosPostCasa() 
  }
  
  //Posesiones de rolando 
  method posesiones() = casaDeRolando.artefactos() + mochila.artefactos()
  
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
  var espacio = 0 // se trabaja con esta variable para poder saber cuanto espacio le queda
  var capacidad = 0 //Se setea un valor y se mantiene 
  
  method poderDePelea(personaje){
    return artefactos.sum({artefacto => artefacto.poder(personaje)})
  }

  //guarda elemento
  method guardar(elemento) {
    artefactos.add(elemento)
    espacio -= 1
  }
  
  //Getter del espacio
  method espacio() = espacio
  
  //Getter artefactos
  method artefactos() = artefactos
  
  // Artefactos post dejarlos en la casa
  method artefactosPostCasa() {
    artefactos = #{}
    espacio = capacidad
  }
  
  //Settea un nuevo valor para espacio
  method cantidadDeEspacio(_cantidad) {
    espacio = _cantidad
    capacidad = _cantidad
  }
  
}

//////////CASTILLO DE PIEDRA//////////////
object castilloDePiedra {
  var artefactos = #{}
  
  //getter de artefactos
  method artefactos() = artefactos
  
  method addArtefactos(_artefactos) {
    artefactos = _artefactos + artefactos
  }
}

//////////ESPADA//////////
object espada {
  var usos = 0

  method usar(){
    usos += 1
  }
  //Get poder
  method poder(personaje){
    if (usos == 0){
      return personaje.valorBase()
    }else{
      return personaje.valorBase() * 0.5
    }
    self.usar()
  }
}

//////////LIBRO/////////////
object libro {
  
}

//////////COLLAR//////////
object collar {
  var usos = 0
  const poderDePelea = 3
  method usar(){
    usos += 1
  }
  //Get poder
  method poder(personaje){
    self.usar()
    if (personaje.valorBase() > 6) {
    return poderDePelea + usos
    }else {return poderDePelea}

  }

}

//////////ARMADURA///////////
object armadura {
  const poderDePelea = 6

  //Get poder
  method poder(personaje){
    return poderDePelea
  }
}

/*
Podriamos en vez de tener variables globales, plantear setters y getters para determinar variables para poder pasarle que "casa" tiene por ejemplo 
*/




// el method usar tiene que ser polimorfico

//Pensar que tiene que ser si una consulta o una orden 