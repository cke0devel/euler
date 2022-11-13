using Primes

number = 0
n = 1

while true
    global number += n

    divisors = map(x->x+1, factor(number) |> values) |> prod

    if divisors > 500
        break
    end

    global n += 1
end

println(number)
