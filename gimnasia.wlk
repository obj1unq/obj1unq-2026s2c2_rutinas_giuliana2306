class Rutina {
    var property intensidad = 0
    var property tiempo = 0

    method descanso()

    method caloriasConsumidas(_persona) {
        return 100 * (_persona.tiempo() - self.descanso()) * self.intensidad()
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

    override method caloriasConsumidas(_persona) {
        return super(_persona)* 2 
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

class Persona {
    var property peso = 0 
    var property tiempo = 0

    method caloriasPorKilo()

    method pesoPerdido(_rutina) {
        return _rutina.caloriasConsumidas(self) / self.caloriasPorKilo()
    }
    method aplicarRutina(_rutina) 
}
class Sedentaria inherits Persona {

    override method caloriasPorKilo() {
        return 7000
    }
    override method aplicarRutina(_rutina) {
        self.validarAplicarRutina(_rutina)
        peso = peso - self.pesoPerdido(_rutina)
    }
    method validarAplicarRutina(_rutina) {
        if (peso < 50) {
            self.error("No alcanza el peso solicitado")
        }
    }
}

class Atleta inherits Persona {

    override method pesoPerdido(_rutina) {
        return super(_rutina) - 1
    }
    override method caloriasPorKilo() {
        return 8000
    }
    override method aplicarRutina(_rutina) {
        self.validarAplicarRutina(_rutina)
        peso = peso - self.pesoPerdido(_rutina)
    }

    method validarAplicarRutina(_rutina) {
            if (peso < 1000) {
            self.error("No alcanza el peso solicitado")
        }
    }    
}