function isDoubleBasePalindrome(n)
    base10 = digits(n)
    base2 = digits(n, base=2)

    return base10 == reverse(base10) && base2 == reverse(base2)
end

sum(n for n=1:1_000_000 if isDoubleBasePalindrome(n)) |> println
