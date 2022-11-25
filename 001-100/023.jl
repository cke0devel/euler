include("./utils.jl")

abundant = [n for n=2:28123 if sum(divisor(n))-n > n]

sums = Set(sum.(Iterators.product(abundant, abundant)))

[n for n=1:28123 if !in(n, sums)] |> sum |> println
