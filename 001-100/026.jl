using Primes

ans = (0, 0)

for d=2:999
    f = factor(d)

    n = d

    if haskey(f, 2)
        n = div(n, 2^f[2])
    end
    if haskey(f, 5)
        n = div(n, 5^f[5])
    end

    if n != 1
        denom = BigInt(9)
        while denom%n != 0
            denom = denom*10 + 9
        end

        if ans[2] < length(digits(denom))
            global ans = (d, length(digits(denom)))
        end
    end
end

println(ans[1])
