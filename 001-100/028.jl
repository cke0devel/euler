
ans = 1

for k=3:2:1001
    global ans += k^2 + k^2 - k + 1 + k^2 - (k-1)*2 + k^2 - (k-1)*3
end

println(ans)
