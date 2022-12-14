using Combinatorics

include("./utils.jl")

base = reverse(digits(123456789))

ans = 2

for k=2:9
    l = base[1:k]

    for p = permutations(l)
        if iseven(p[end])
            continue
        end

        n = digits2num(reverse(p))
        if isprime(n)
            global ans = n
        end
    end
end

println(ans)
