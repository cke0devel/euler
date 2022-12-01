using Primes

function digits2num(d)
    return sum(k*(10^(i-1)) for (i,k) in enumerate(d))
end

p = Set(primes(1_000_000))

ans = 0

for n=p
    if n>10 && findfirst(iseven, digits(n)) != nothing
        continue
    end

    circular = true
    d = digits(n)
    for _=1:length(d)
        d = circshift(d, 1)

        if !in(digits2num(d), p)
            circular = false
            break
        end
    end

    if circular
        global ans += 1
    end
end

println(ans)
