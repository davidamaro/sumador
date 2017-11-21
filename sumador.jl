mutable struct jugador
    nombre::String
    puntuacion::Int
end

function anadirPuntuacion!(jug::jugador, punt::Int)
    jug.puntuacion += punt
end

function crearJugador(nombre::String)
    jugador(nombre, 0)
end
#
#jug1 = jugador("david", 0)
#@show jug1
#anadirPuntuacion!(jug1, 10)
#@show jug1
