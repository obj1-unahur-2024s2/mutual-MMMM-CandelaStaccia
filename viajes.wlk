class Actividad {
  const property idiomas = [] 

  method esInteresante() = idiomas.size() > 1

  method esRecomendadaPara(unSocio) {
    return self.esInteresante() && unSocio.leAtrae(self) && not unSocio.actividadesRealizadas().contains(self)
  }
}

class ViajePlaya inherits Actividad {
  const property largo

  method diasQueLleva() = largo / 500

  method implicaEsfuerzo() = largo > 1200

  method sirveParaBroncearse() = true
}


class ExcursionCiudad inherits Actividad {
  const property atracciones

  method diasQueLleva() = atracciones / 2

  method implicaEsfuerzo() = atracciones.between(5, 8)

  method sirveParaBroncearse() = false

  override method esInteresante() = super() || atracciones == 5
}

class ExcursionCiudadTropical inherits ExcursionCiudad {
  override method diasQueLleva() = super() + 1

  override method sirveParaBroncearse() = true
}


class Trekking inherits Actividad {
  const property kilometros
  const property diasDeSol

  method diasQueLleva() = kilometros / 50

  method implicaEsfuerzo() = kilometros > 80

  method sirveParaBroncearse() = diasDeSol > 200 || (diasDeSol.between(100, 200) && kilometros > 120)

  override method esInteresante() = super() && diasDeSol > 140
}


class ClaseDeGimnasia inherits Actividad {

  method initialize() {
    idiomas.clear()
    idiomas.add("español")
      if(idiomas != ["español"]) self.error("solo se permite clase de gimnasia en español")
  }

  method diasQueLleva() = 1

  method implicaEsfuerzo() = true

  method sirveParaBroncearse() = false

  override method esRecomendadaPara(unSocio) = unSocio.edad().between(20, 30)
}


class TallerLiterario inherits Actividad {
  const property libros = []

  method initialize() {
    idiomas.clear()
    idiomas.addAll(self.idiomasUsados())
  }

  method idiomasUsados() = libros.map({l => l.idioma()})

  method diasQueLleva() = libros.size() + 1

  method implicaEsfuerzo() = libros.any({l => l.paginas() > 500}) || 
  (libros.size() > 1 && libros.map({l => l.autor()}).asSet().size() == 1) //hay mas de un libro y son del mismo autor

  method sirveParaBroncearse() = false

  override method esRecomendadaPara(unSocio) = unSocio.idiomas().size() > 1
}


class Libro {
  const property idioma
  const property paginas
  const property autor
}