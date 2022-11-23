function d(n)
    l = [k for k=2:trunc(Int, sqrt(n))+1 if n%k==0]
    return sum(vcat(l, div.(n, l), [1]))
end

l = [d(n) for n=1:10000]

[n for n=2:10000 if l[n]<10000 && n!=l[n] && l[l[n]]==n] |> sum |> println
