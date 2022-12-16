ans = 0
for n=1:1000
    global ans = (ans + (BigInt(n)^n)%10_000_000_000) % 10_000_000_000
end

println(ans)
