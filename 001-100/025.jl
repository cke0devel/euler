using Combinatorics

n = 1

while true
    if log10(fibonaccinum(n)) >= 999
        break
    end

    global n += 1
end

println(n)
