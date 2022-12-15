N = 10000

l = [div(n*(3*n-1), 2) for n=1:N]

s = Set(l)

ans = l[end]

for i=1:length(l),j=i+1:length(l)
    a, b = l[i], l[j]

    if in(a+b, s) && in(b-a, s)
        global ans = b-a
        println(a, ' ', b)
    end
end

println(ans)
