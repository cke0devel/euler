using Primes

function findPrimePath(a, b)
    f(n) = n^2 + a*n + b

    n = 0
    while isprime(f(n))
        n += 1
    end

    return n
end

ans = (0, 0, 0)
for a=-999:999, b=-1000:1000
    n = findPrimePath(a, b)
    if n > ans[1]
        global ans = (n, a, b)
    end
end

println(ans[2] * ans[3])
