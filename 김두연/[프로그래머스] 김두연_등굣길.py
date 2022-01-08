def solution(m, n, puddles):
    dp = [[0] * m for _ in range(n)]
    dp[0][0] = 1

    for puddle in puddles:
        dp[puddle[1] - 1][puddle[0] - 1] = -1

    for i in range(n):
        for j in range(m):
            if dp[i][j] != -1:
                if i != 0 and dp[i - 1][j] != -1:
                    dp[i][j] += dp[i - 1][j]
                if j != 0 and dp[i][j - 1] != -1:
                    dp[i][j] += dp[i][j - 1]
                dp[i][j] %= 1000000007

    return dp[n - 1][m - 1]