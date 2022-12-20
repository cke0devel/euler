include("./utils.jl")

n = 0

while true
    d = digits(n)
    push!(d, 1)

    if length(Set(sort.(digits.((1:6) .* digits2num(d))))) == 1
        println(digits2num(d))
        break
    end
    global n += 1
end
