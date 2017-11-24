mutable struct jugador
    nombre::String
    puntuacion::Int
end

mutable struct partida
    jugadores::Dict
    ultimaPuntuacion::Int
    ultimoJugador::String
end

part = partida(Dict{String, jugador}(), 0, "donNadie")
listaOrdenes = ["añadir", "corregir"]

function iniciarPartida()
    #numJug = 2
    #anadirJugador(:dav, part)
    #anadirJugador(:emm, part)
    leerJugadores()
    println("añadir [jugador] [puntuacion]")
    respuesta = readline()
    while (respuesta != "final")
        comando, jugador, puntu = split(respuesta)
        ejecucion = Expr(:call, parse(comando), convert(String,jugador), parse(Int, puntu))
        eval(ejecucion)
        respuesta = readline()
    end
    mostrarPuntuacion()
end

function anadirJugador(nombre::String, parti::partida)
    parti.jugadores[nombre] = jugador(nombre, 0)
end

function mostrarPuntuacion()
    for nombre in keys(part.jugadores)
        println(nombre, " -> ", part.jugadores[nombre].puntuacion)
    end
end

function añadir(nombre::String, puntos::Int)
    part.jugadores[nombre].puntuacion += puntos
    part.ultimaPuntuacion = puntos
    part.ultimoJugador = nombre
end

function corregir()
    if (part.ultimoJugador == "donNadie")
        return
    end
    añadir(part.ultimoJugador, -part.ultimaPuntuacion)
    part.ultimaPuntuacion = 0
    part.ultimoJugador = "donNadie"
    mostrarPuntuacion()
end

function leerJugadores()
    println("número de jugadores: ")
    numeroDeJugadores = parse(Int,readline())

    for i in 1:numeroDeJugadores
        println("jugador: ")
        jugador = readline()
        anadirJugador(jugador, part)
    end
end

iniciarPartida()
