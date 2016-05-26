a, b = map(parse, split(readline()))
println(div(b,a) + min(mod(b,a), 1))
