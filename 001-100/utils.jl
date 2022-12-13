using Primes

function divisor(n::Int, sorted::Bool=true)
    l = [1]

    for (p, q) = factor(n)
        l = Set(prod.(Iterators.product(l, [p^k for k=0:q]))) |> collect
    end

    if sorted
        sort!(l)
    end

    return l
end

function digits2num(d)
    return sum(k*(10^(i-1)) for (i,k) in enumerate(d))
end
