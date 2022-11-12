numbers = [i*j for i=100:999, j=100:999]

isPalindrome(x) = parse(Int, reverse(string(x))) == x

filter(isPalindrome, numbers) |> maximum |> println
