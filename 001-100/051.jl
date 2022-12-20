using Primes
using Combinatorics

include("./utils.jl")

p = primes(100000, 999999)

function check(a, b)
    a, b  = digits(a), digits(b)
    c = 0

    star_a, star_b = nothing, nothing
    for i=1:length(a)
        if a[i] != b[i]
            if star_a == nothing
                star_a = a[i]
            elseif star_a != a[i]
                return false, a
            end

            a[i] = -1
            c += 1
        end
    end

    return true, a
end


function generate(d)
    pos = findall(x->x==-1, d)

    for pp=combinations(pos)
        c = 0
        for n=1:9
            d[pos] .= n

            if isprime(digits2num(d))
                c += 1
            end
        end

        if c >= 8
            return c
        end
    end

    return 0
end

for i=1:length(p), j=i+1:length(p)
    a, b = p[i], p[j]

    d = check(a,b)
    if d[1] == false
        continue
    end

    c = generate(d[2])

    if c >= 8
        println(p[i])
        break
    end
end

