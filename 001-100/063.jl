
function solve(n)
    cnt = 0

    k = floor(BigInt, 10^((n-1)/n))
    while true
        if k^n >= 10^n
            break
        end

        if k^n >= 10^(n-1)
            cnt += 1
        end
        k += 1
    end

    return cnt
end

ans = 0

n = BigInt(1)
while true
    c = solve(n)

    if c == 0
        break
    end

    global ans += c
    global n += 1
end

println(ans)
