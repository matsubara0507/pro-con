n, q = map(parse, split(readline()))
ans = zeros(Int, n)
for i = 1:q
  l, r, t = map(parse, split(readline()))
  for j = l:r
    ans[j] = t
  end
end
map(println, ans)
