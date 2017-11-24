function sumar(a, b)
    a + b
end

orden = readline()
comando, sumA, sumB = split(orden)
ejecutar = comando*"("*sumA*","*sumB*")"
println(eval(parse(ejecutar)))
