[n for n=2:299999 if sum(digits(n) .^ 5) == n] |> sum |> println
