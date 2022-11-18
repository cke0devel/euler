words = Dict(
    1 => 3, # one
    2 => 3, # two
    3 => 5, # three
    4 => 4, # four
    5 => 4, # five
    6 => 3, # six
    7 => 5, # seven
    8 => 5, # eight
    9 => 4, # nine
    10 => 3, # ten
    11 => 6, # eleven
    12 => 6, # twelve
    13 => 8, # thirteen
    14 => 8, # fourteen
    15 => 7, # fifteen
    16 => 7, # sixteen
    17 => 9, # seventeen
    18 => 8, # eighteen
    19 => 8, # nineteen
    20 => 6, # twenty
    30 => 6, # thirty
    40 => 5, # forty
    50 => 5, # fifty
    60 => 5, # sixty
    70 => 7, # seventy
    80 => 6, # eighty
    90 => 6, # ninety
    100 => 7, # hundred
    1000 => 8 # thousand
)

N = 1000

function getLettersLength(n)
    length = 0

    while n > 0
        if n == 1000
            length += words[1] + words[1000]
            n = 0
        elseif n >= 100
            length += words[div(n, 100)]
            length += words[100]

            n = n % 100

            if n > 0
                length += 3
            end
        elseif n >= 20
            length += words[div(n, 10) * 10]

            n = n % 10
        elseif haskey(words, n)
            length += words[n]
            n = 0
        end
    end

    return length
end

getLettersLength.(1:N) |> sum |> println



