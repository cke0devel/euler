using DataStructures

c = counter([a+b+c for a=1:1000 for b=1:1000-a for c=1:1000-a-b if a^2+b^2==c^2])
c = collect(c)

sort!(c, by=x->x[2])

println(c[end][1])
