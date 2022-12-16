using Primes

p = primes(1000, 9999)

function isPermutation(a, b, c)
    a, b, c = sort(digits(a)), sort(digits(b)), sort(digits(c))

    return a==b==c
end

for i=1:length(p), j=i+1:length(p)
    k = p[j] + p[j] - p[i]

    if k in p && isPermutation(p[i], p[j], k)
        println(p[j]-p[i], ' ', p[i], p[j], k)
    end
end
