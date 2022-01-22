import sys
input = sys.stdin.readline

def check(x, y) :
    if y == n-1 : dp[x][y] = s[x][y]
    elif y == n-2 : dp[x][y] = s[x][y] + dp[1 if x == 0 else 0][y+1]
    else : dp[x][y] = s[x][y] + max(dp[x][y+2:y+3] + dp[1 if x == 0 else 0][y+1:y+3])

for _ in range(int(input().rstrip())) :
    n = int(input().rstrip())
    s = [list(map(int,input().rstrip().split())) for _ in range(2)]
    dp = [[0 for _ in range(n)] for _ in range(2)]
    for y in range(n-1, -1, -1):
        for x in range(2) : check(x, y)
    print(max(sum(dp, [])))
