names = []

open("p042_words.txt") do f
    global names = split(replace(read(f, String) , "\"" => ""), ",")
end

function wordValue(word)
    return [Int(c)-Int('A')+1 for c=word] |> sum
end

function isTriangleNumber(n)
    triangleNumbers = Set([1, 3, 6, 10, 15, 21, 28, 36, 45, 55, 66, 78, 91, 105, 120, 136, 153, 171, 190, 210])

    return in(n, triangleNumbers)
end

isTriangleNumber.(wordValue.(names)) |> sum |> println
