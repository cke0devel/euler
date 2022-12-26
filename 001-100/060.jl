using Primes
using Combinatorics

include("./utils.jl")

p = primes(10000)

pairList = Dict()

f(x,y) = isprime(digits2num(vcat(x,y)))

for i=1:length(p), j=i+1:length(p)
    a, b = p[i], p[j]

    if f(digits(a), digits(b)) && f(digits(b), digits(a))
        if haskey(pairList, a)
            push!(pairList[a], b)
        else
            get!(pairList, a, [b])
        end
    end
end

ans = 987654321
for (k,v) in pairList
    if length(v) <= 4
        continue
    end

    for c = combinations(v, 4)
        check = true

        for i=1:4, j=i+1:4
            a, b = c[i], c[j]

            if haskey(pairList, a)==false || in(b, pairList[a])==false
                check = false
                break
            end
        end

        if check
            global ans = min(ans, k + sum(c))
        end
    end
end

println(ans)
