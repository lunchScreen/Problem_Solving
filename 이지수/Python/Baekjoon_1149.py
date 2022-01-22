import sys
input = sys.stdin.readline
n = int(input().rstrip())
h = [list(map(int, input().rstrip().split())) for _ in range(n)]
dp = [[0, 0, 0] for _ in range(n)]
def paint(cu, bc) :
    if cu == n-1 : return h[cu][bc]
    return h[cu][bc] + min([dp[cu+1][i] for i in range(3) if i != bc])
for i in range(n-1, -1, -1):
    for c in range(3) : dp[i][c] = paint(i, c)
print(min(dp[0]))
