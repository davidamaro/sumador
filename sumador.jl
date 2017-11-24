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

function menu(comandoLlano::String)
    separado = split(comandoLlano)
    if !(separado[1] in listaOrdenes)
        while !(separado[1] in listaOrdenes)
            println("Lo siento, comando equivocado")
            println("añadir [jugador] [puntuacion]")
            println("corregir")
            comandoLlano = readline()
            separado = split(comandoLlano)
        end
    end
    if separado[1] == "añadir"
        return Expr(:call, parse(separado[1]), convert(String,separado[2]), parse(Int, separado[3]))
    else
        return Expr(:call, parse(separado[1]))
    end
end

function iniciarPartida()
    leerJugadores()
    println("añadir [jugador] [puntuacion]")
    println("corregir")
    respuesta = readline()
    while (respuesta != "final")
        eval(menu(respuesta))
        println("añadir [jugador] [puntuacion]")
        println("corregir")
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
