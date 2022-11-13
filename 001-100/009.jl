ans = 0

for a=1:1000
    for b=a+1:1000-a-1
        c = 1000 - (a+b)
        if c > b && a^2+b^2==c^2
            global ans = a*b*c
        end
    end
end

println(ans)
