using Combinatorics

s = Set()
for p=permutations("123456789")
    number = join(p)

    for i=1:7,j=i+1:8
        a = parse(Int, number[1:i])
        b = parse(Int, number[i+1:j])
        c = parse(Int, number[j+1:end])

        if a*b == c
            push!(s, c)
        end
    end
end

s |> sum |> println
