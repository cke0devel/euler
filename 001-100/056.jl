ans = 0
for a=1:99, b=1:99
    global ans = max(ans, sum(digits((BigInt(a)^b))))
end

println(ans)
