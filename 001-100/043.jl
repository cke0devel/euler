using Combinatorics

include("./utils.jl")

function isDivisable(p)
    p = reverse(p)

    if p[1] == 0
        return false
    end

    if (p[2]*100 + p[3]*10 + p[4]) % 2 != 0
        return false
    end

    if (p[3]*100 + p[4]*10 + p[5]) % 3 != 0
        return false
    end

    if (p[4]*100 + p[5]*10 + p[6]) % 5 != 0
        return false
    end

    if (p[5]*100 + p[6]*10 + p[7]) % 7 != 0
        return false
    end

    if (p[6]*100 + p[7]*10 + p[8]) % 11 != 0
        return false
    end

    if (p[7]*100 + p[8]*10 + p[9]) % 13 != 0
        return false
    end

    if (p[8]*100 + p[9]*10 + p[10]) % 17 != 0
        return false
    end

    return true
end

digits2num.([p for p=permutations(digits(1234567890)) if isDivisable(p)]) |> sum |> println
