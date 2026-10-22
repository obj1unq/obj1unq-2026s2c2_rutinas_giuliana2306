class Rutina {
    var property intensidad = 0
    var property tiempo = 0

    method descanso()

    method caloriasConsumidas(_tiempo) {
        return 100 * (_tiempo - self.descanso()) * self.intensidad()
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

    method puedeRealizarRutina(_rutina) 

    method tiempo() 

    method caloriasPorKilo()

    method pesoPerdido(_rutina) {
        return _rutina.caloriasConsumidas(self) / self.caloriasPorKilo()
    }

    method aplicarRutina(_rutina) {
        self.validarAplicarRutina(_rutina)
        peso = peso - self.pesoPerdido(_rutina)
    }
    

    method validarAplicarRutina(_rutina) {
        if (not self.puedeRealizarRutina(_rutina)) {
            self.error("No alcanza el peso solicitado")
        }
    }
}
class Sedentaria inherits Persona {

    override method caloriasPorKilo() {
        return 7000
    }
    override method puedeRealizarRutina(_rutina) {
        return peso > 50
    }
    
   
}

class Atleta inherits Persona {

    override method pesoPerdido(_rutina) {
        return super(_rutina) - 1
    }
    override method caloriasPorKilo() {
        return 8000
    }
    override method puedeRealizarRutina(_rutina) {
        return _rutina.caloriasConsumidas(self.tiempo()) > 10000
    }
    
}

class Club {
    var predios = #{}
    method mejorPredioPara(_persona) {
        predios.max({predio => predio.totalDeCaloriasDeTodasLasRutinasPara(_persona)})
    }
}


class Predio {
    var rutinas = #{}

    method agregarRutina(_rutina) {
        rutinas.add(_rutina)
    }
    method totalDeCaloriasDeTodasLasRutinas(_persona) {
        rutinas.sum({rutina => rutina.caloriasConsumidas(_persona)})
    }
    
}
