using Combinatorics

include("./utils.jl")

ans = 0

for p=permutations("918273645")
    p = parse.(Int, p)

    for k=1:4
        n = digits2num(reverse(p[1:k]))

        l = []
        for m=1:5
            l = vcat(l, reverse(digits(n * m)))

            if length(l) > 9
                break
            elseif length(l) == 9
                if p == l
                    global ans = digits2num(reverse(p))
                end
                break
            end
        end
    end

    if p[1] != 9
        break
    end
end

println(ans)
