function solve!(y, x)
  if (val = ansMap[y, x]) != -1
    val
  else
    u = 0 < (y-1)  && a[y,x] < a[y-1,x] ? ansMap[y-1,x] = solve!(y-1, x) : 0
    d = h >= (y+1) && a[y,x] < a[y+1,x] ? ansMap[y+1,x] = solve!(y+1, x) : 0
    l = 0 < (x-1)  && a[y,x] < a[y,x-1] ? ansMap[y,x-1] = solve!(y, x-1) : 0
    r = w >= (x+1) && a[y,x] < a[y,x+1] ? ansMap[y,x+1] = solve!(y, x+1) : 0
    ansMap[y,x] = sum([u,d,l,r]) + 1
  end
end

h, w = map(parse, split(readline()))
a = Array{Int32,2}(h, w)

for i = 1:h
  temp = map(parse, split(readline()))
  for j = 1:w
    a[i,j] = temp[j]
  end
end

ansMap = map(x -> -1, Array{Int64,2}(h, w))
println(sum([solve!(i,j) for i = 1:h, j = 1:w]) % (10^9 + 7))
