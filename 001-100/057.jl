ans = 0

function iter(n)
    if n==1
        return BigInt(2)
    end

    return 2 + 1//iter(n-1)
end

for n=1:1000
    f = iter(n)
    k = 1 + 1//f

    if length(digits(numerator(k))) > length(digits(denominator(k)))
        global ans += 1
    end
end

println(ans)

