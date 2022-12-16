using Primes

include("./utils.jl")

N = 10000

p = primes(N)

function checkGoldbach(n)
    for k=p
        if k >= n
            break
        end

        if isSquare(div(n-k,2))
            return true
        end
    end

    return false
end

for n=9:2:N
    if isprime(n)==false && checkGoldbach(n)==false
        println(n)
        break
    end
end
