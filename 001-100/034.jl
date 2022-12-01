
[n for n=3:10000000 if n == sum(factorial.(digits(n)))] |> sum |> println
