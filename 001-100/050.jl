using Primes

p = primes(1000000)
ps = Set(p)

function solve()
    for l=1000:-1:21
        s = sum(p[1:l])
        for i=l+1:length(p)
            s = s + p[i] - p[i-l]

            if s in ps
                return s
            end
        end
    end
end

solve() |> println
