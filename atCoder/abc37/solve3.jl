n, k = map(parse, split(readline()))
a = map(x -> parse(BigInt, x), split(readline()))
ans = 0
for i = 1:n
  j = n - i + 1
  l = min(n - k + 1, k)
  ans += (i < l || j < l ? min(i, j) : l) * a[i]
end
println(ans)
