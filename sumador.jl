mutable struct jugador
    nombre::Symbol
    puntuacion::Int
end

diccionarioJugadores = Dict{Symbol, jugador}()

function anadirJugador(nombre::Symbol)
    diccionarioJugadores[nombre] = jugador(nombre, 0)
end

function mostrarPuntuacion()
    for nombre in keys(diccionarioJugadores)
        println(nombre, "->", diccionarioJugadores[nombre].puntuacion)
    end
end

function anadirPuntuacion(nombre::Symbol, puntos::Int)
    diccionarioJugadores[nombre].puntuacion += puntos
end
