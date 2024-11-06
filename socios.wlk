class Socio {
    const property actividadesRealizadas = []
    const maximoActividades
    var edad
    const property idiomas = [] 

    method edad() = edad

    method registrarActividad(unaActividad) {
        if(maximoActividades == actividadesRealizadas.size())
            self.error("Alcanzó el máximo de actividades")
        actividadesRealizadas.add(unaActividad)
    }

    method esAdoradorDelSol() = actividadesRealizadas.all({a => a.sirveParaBroncearse()})

    method actividadesEsforzadas() = actividadesRealizadas.filter({a => a.implicaEsfuerzo()})

    method leAtrae(unaActividad) = true

    method cumplirAnios() {
        edad = edad + 1
    }
}


class SocioTranquilo inherits Socio {
    override method leAtrae(unaActividad) = unaActividad.diasQueLleva() >= 4
}


class SocioCoherente inherits Socio {
    override method leAtrae(unaActividad) {
        return if(self.esAdoradorDelSol()) unaActividad.sirveParaBroncearse()
        else unaActividad.implicaEsfuerzo()
    }
}


class SocioRelajado inherits Socio {
    override method leAtrae(unaActividad) {
        return not idiomas.intersection(unaActividad.idiomas()).isEmpty()
    }
}