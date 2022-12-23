using Primes

numbers = isprime.([1, 3, 5, 7, 9])

k = 5
while true
    ratio = count(numbers)*100 / length(numbers)
    if ratio < 10
        k -= 2
        break
    end

    push!(numbers, isprime.([k^2, k^2 - k + 1, k^2 - (k-1)*2, k^2 - (k-1)*3])...)
    global k+=2
end

println(k)

