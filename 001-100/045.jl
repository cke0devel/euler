h = 144

function isTriangular(n)
    return trunc(Int, sqrt(1+8n))^2 == (1+8*n)
end

function isPentagonal(n)
    k = trunc(Int, sqrt(1+24n))
    if k^2 != (1+24*n)
        return false
    end

    return (1 + k) % 6 == 0
end

while true
    hexagonal = h*(h*2-1)

    if isTriangular(hexagonal) && isPentagonal(hexagonal)
        println(hexagonal)
        break
    end

    global h = h+1
end
