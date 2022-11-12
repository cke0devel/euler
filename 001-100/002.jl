function fibonacciUnder(k)
    ret = [1, 2]

    while true
        next = ret[end] + ret[end-1]

        if next > k
            break
        end

        push!(ret, next)
    end

    return ret
end

N = 4_000_000
filter(iseven, fibonacciUnder(N)) |> sum |> println

