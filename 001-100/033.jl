ans = 1

for n=10:99,d=n+1:99
    a = digits(n)
    b = digits(d)
    c = intersect(a, b)

    setdiff!(a, c)
    setdiff!(b, c)

    if length(c)!=1 || in(0, c) || length(a)!=1 || length(b)!=1
        continue
    end

    if n//d == a[1]//b[1]
        global ans *= n//d
    end
end

println(ans)
