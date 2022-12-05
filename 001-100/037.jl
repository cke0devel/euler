using Primes

function isTruncatablePrimes(n)
    d = digits(n)

    s = Set()
    for i=1:length(d)
        push!(s, reduce((x,y)->x*10+y, reverse(d[1:i]); init=0))
        push!(s, reduce((x,y)->x*10+y, reverse(d[i:end]); init=0))
    end

    return isprime.(s) |> all
end

[p for p=primes(10, 1_000_000) if isTruncatablePrimes(p)] |> sum |> println

