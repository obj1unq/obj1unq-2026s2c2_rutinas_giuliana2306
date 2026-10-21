class Rutina {
    var property intensidad = 0
    var property tiempo = 0

    method descanso()

    method caloriasConsumidas() {
        return 100 * (tiempo - self.descanso()) * intensidad
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