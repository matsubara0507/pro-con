n = parse(readline())
a = [parse(Int, readline()) for i in 1:n]
m = Dict([(k, v-1) for (v, k) in enumerate(sort(unique(a)))])
for v in a
   println(m[v])
end
