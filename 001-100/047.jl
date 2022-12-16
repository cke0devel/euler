using Primes

n = 210
k = 0
while true
    if length(factor(n)) == 4
        global k += 1

        if k==4
            println(n-3)
            break
        end
    else
        global k = 0
    end
    global n += 1
end
