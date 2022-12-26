cnt = Dict()

n = 1
while true
    k = join(sort(collect(string(n^3))))

    if haskey(cnt, k)
        push!(cnt[k], n)
    else
        get!(cnt, k, [n])
    end

    if length(cnt[k]) == 5
        println(cnt[k][1]^3)
        break
    end

    global n += 1
end

