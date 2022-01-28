dp = [1, 1]
n = int(__import__('sys').stdin.readline())
[dp.append(dp[i-2]+dp[i-1]+1) for i in range(2, n+1)]
print(dp[n]%1000000007)
