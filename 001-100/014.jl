N = 1_000_000 - 1

memo = Dict{Int64, Int64}(1 => 1)

function collatz(n)
    orig = n
    step = 0

    while true
        if n in keys(memo)
            step += memo[n]
            break
        end

        if isodd(n)
            n = 3*n + 1
        else
            n = div(n, 2)
        end

        step += 1
    end

    memo[orig] = step
end

collatz.(collect(1:N))

sort(memo |> pairs |> collect, by=x->x[2], rev=true)[1] |> println
