isMultiplyOf(x, y) = iszero(x % y)
isMultiplyOf3(x) = isMultiplyOf(x, 3)
isMultiplyOf5(x) = isMultiplyOf(x, 5)
isMultiplyOf3or5(x) = isMultiplyOf3(x) || isMultiplyOf5(x)

filter(isMultiplyOf3or5, 1:999) |> sum |> println
