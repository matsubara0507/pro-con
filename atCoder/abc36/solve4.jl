function solve(v, pre)
  white[v] = black[v] = 1
  for l in memo[v]
    if l != pre
      solve(l, v)
      white[v] *= (white[l] + black[l])
      black[v] *= white[l]
    end
  end
end

n = parse(readline())
memo = [IntSet() for _ in 1:n]
white = [0 for _ in 1:n]
black = [0 for _ in 1:n]

for i = 1:(n-1)
  a, b = map(parse, split(readline()))
  push!(memo[a], b)
  push!(memo[b], a)
end

solve(1,n+1)
println((white[1] + black[1]) % 1000000007)
