
[1 for n=BigInt(1):100 for r=BigInt(1):n if factorial(n) / (factorial(r)*factorial(n-r)) > 1000000] |> sum |> println
