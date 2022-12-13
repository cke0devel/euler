s = ""

function findDigit(n)
    if n <= 9
        return n
    end

    n -= 9
    if n <= 90*2
        k = div(n-1, 2)
        r = (n-1) % 2

        return reverse(digits(10+k))[r+1]
    end

    n -= 90*2
    if n <= 900*3
        k = div(n-1, 3)
        r = (n-1) % 3

        return reverse(digits(100+k))[r+1]
    end

    n -= 900*3
    if n <= 9000*4
        k = div(n-1, 4)
        r = (n-1) % 4

        return reverse(digits(1000+k))[r+1]
    end

    n -= 9000*4
    if n <= 90000*5
        k = div(n, 5)
        r = (n-1) % 5

        return reverse(digits(10000+k))[r+1]
    end

    n -= 90000*5
    if n <= 900000*6
        k = div(n, 6)
        r = (n-1) % 6

        return reverse(digits(100000+k))[r+1]
    end
end

[findDigit(n) for n=[1,10,100,1000,10000,100000,1000000]] |> prod |> println
