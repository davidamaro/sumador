mutable struct jugador
    nombre::Symbol
    puntuacion::Int
end

mutable struct partida
    jugadores::Dict
    ultimaPuntuacion::Int
    ultimoJugador::Symbol
end

part = partida(Dict{Symbol, jugador}(), 0, :xxxx)

function iniciarPartida()
    numJug = 2
    anadirJugador(:dav, part)
    anadirJugador(:emm, part)
end

function anadirJugador(nombre::Symbol, parti::partida)
    parti.jugadores[nombre] = jugador(nombre, 0)
end

function mostrarPuntuacion()
    for nombre in keys(part.jugadores)
        println(nombre, "->", part.jugadores[nombre].puntuacion)
    end
end

function anadirPuntuacion(nombre::Symbol, puntos::Int)
    part.jugadores[nombre].puntuacion += puntos
    part.ultimaPuntuacion = puntos
    part.ultimoJugador = nombre
end

function corregirPuntuacion()
    if (part.ultimoJugador == :xxxx)
        return
    end
    anadirPuntuacion(part.ultimoJugador, -part.ultimaPuntuacion)
    part.ultimaPuntuacion = 0
    part.ultimoJugador = :xxxx
    mostrarPuntuacion()
end
