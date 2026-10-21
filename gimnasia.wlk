class Rutina {
    var property intensidad = 0
    var property tiempo = 0

    method descanso()

    method caloriasConsumidas() {
        return 100 * (tiempo - self.descanso()) * self.intensidad()
    }
    
}

class Running inherits Rutina {

    override method descanso() {
        if (tiempo > 20) {
            return 5
        } else {
            return 2
        }
    }

}

class Maratón inherits Running {

    override method caloriasConsumidas() {
        return super()* 2 
    }
}

class Remo inherits Rutina {

    override method descanso() {
        return tiempo / 5
    }
    override method intensidad() {
        return 1.3
    }

}

class RemoDeCompetición inherits Remo {

    override method intensidad() {
        return 1.7
    }
    override method descanso() {
        return (super() -3).max(2)
    }
}

class Persona inherits Rutina {
    var property peso = 0 

    method caloriasPorKilo()

    method pesoPerdido() {
        return self.caloriasConsumidas() / self.caloriasPorKilo()
    }
    method aplicarRutina() 
}
class Sedentaria inherits Persona {

    override method caloriasPorKilo() {
        return 7000
    }
    override method aplicarRutina() {
      if (peso > 50) {
        peso = peso - self.pesoPerdido()
      }
    }
}