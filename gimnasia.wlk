class Rutina {
    var property intensidad = 0   
    
    method caloriasQuemadas(_tiempo) {
        return 100 * (_tiempo - self.descanso(_tiempo)) * self.intensidad()
    }
    
    method descanso(_tiempo) {
        return _tiempo
    }
}

class Running inherits Rutina {
    override method descanso(_tiempo) {
        if (_tiempo > 20) {
            return 5
        } else {
            return 2
        }
    }
}

class Maraton inherits Running {
    override method caloriasQuemadas(_tiempo) {
        return super(_tiempo) * 2
    }
}

class Remo inherits Rutina {
    override method intensidad() {
        return 1.3
    }
    override method descanso(_tiempo) {
        return _tiempo / 5
    }
}

class RemoDeCompeticion inherits Remo {
    override method intensidad() {
        return 1.7
    }
    override method descanso(_tiempo) {
        return (super(_tiempo) - 3).max(2)
    }
}

class Persona {
    var property peso = 0 
    var property tiempoDeEjercitacion = 0

    method pesoPerdido(_rutina) {
        return _rutina.caloriasQuemadas(self.tiempoDeEjercitacion()) / self.caloriasPorKilo()
    }
    
    method caloriasPorKilo() 

    method realizarRutina(_rutina) {
        self.validarPuedeRealizarRutina(_rutina)
        peso = peso - self.pesoPerdido(_rutina)
    }
    
    method puedeRealizarRutina(_rutina)

    method validarPuedeRealizarRutina(_rutina) {
        if (not self.puedeRealizarRutina(_rutina)) {
            self.error("No es posible realizar rutina")
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
    override method tiempoDeEjercitacion() {
        return 90
    }
    override method puedeRealizarRutina(_rutina) {
        return _rutina.caloriasQuemadas(self.tiempoDeEjercitacion()) > 10000
    }
}

class Club {
    var predios = #{}

    method añadirPredios(_predios) {
        predios = _predios
    }
    method predios() {
        return predios
    }
    method mejorPredioPara(_persona) {
        return predios.max({predio => predio.rutinaQueQuemaMasCalorias(_persona.tiempoDeEjercitacion())})
    }
    method prediosTranquis(_persona) {
        return predios.filter({predio => predio.tienUnaRutinaQueGastaMenos(_persona.tiempoDeEjercitacion()) })
    }
    method rutinasMasExigentes(_persona) {
        return predios.map({predio => predio.rutinaMasExigente(_persona.tiempoDeEjercitacion())})
    }
}

class Predio {
    var rutinas = #{}

    method rutinas() {
        return rutinas
    }
    method añadirRutinas(_rutinas) {
        rutinas = #{_rutinas}
    }
    method rutinaQueQuemaMasCalorias(_tiempo) {
        return rutinas.sum({rutina => rutina.caloriasQuemadas(_tiempo)})
    }
    method tienUnaRutinaQueGastaMenos(_tiempo) {
        return rutinas.any({rutina => rutina.caloriasQuemadas(_tiempo) < 500 })
    }
    method rutinaMasExigente(_tiempo) {
        return rutinas.max({rutina => rutina.caloriasQuemadas(_tiempo)})
    }
}