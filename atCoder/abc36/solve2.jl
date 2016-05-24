inputs = split(readall(STDIN))
n = parse(inputs[1])
as = rotr90(transpose(reshape([c for c in foldl(*, inputs[2:end])], (n,n))))

for i = 1:n, j = 1:n
  j == n ? println(as[i,j]) : print(as[i,j])
end
