import sys
input = sys.stdin.readline
n = int(input().rstrip())
s = [list(map(int, input().rstrip().split())) for _ in range(n)]
l = [0] * n

def dp(day) :
    if s[day][0] > n-day : return
    else : l[day] = max(l[(day + s[day][0]):]+[0]) + s[day][1]

[dp(i) for i in range(n-1, -1, -1)]
print(max(l))
