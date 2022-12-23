include("./utils.jl")

function isPalindrome(n)
    d = digits(n)

    return d == reverse(d)
end

function isLychrel(n, iter=0)
    if iter >= 50
        return false
    end

    r = digits2num(reverse(digits(n)))
    k = n+r

    if isPalindrome(n+r)
        return true
    end

    return isLychrel(k, iter+1)
end

[n for n=BigInt(1):9999 if isLychrel(n)==false] |> length |> println
