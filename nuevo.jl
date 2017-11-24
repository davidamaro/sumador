jugadores = Dict("da" => 0, "emm" => 0)
println("Ingresa las jugadas en formato")
println("[jugador] [puntos]")
jugadas = readlines()

for jugada in jugadas
    p1, p2 = split(jugada)
    jugadores[p1] += parse(Int, p2)
    #jugadores[p1] += Int(p2)
end

println(jugadores)
