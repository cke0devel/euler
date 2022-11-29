coins = [1, 2, 5, 10, 20, 50, 100, 200]

dp = zeros(BigInt, 200)

for coin=coins
    dp[coin] +=1

    for n=coin+1:200
        dp[n] += dp[n-coin]
    end
end

println(dp[200])
