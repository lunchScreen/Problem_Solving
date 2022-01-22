import sys
dp = {}
def w(a,b,c):
    y = 0
    key = str(a)+' '+str(b)+' '+str(c)
    if key in dp : return dp[key]
    elif a <= 0 or b <= 0 or c <= 0 : y = 1
    elif a > 20 or b > 20 or c > 20 : y = w(20, 20, 20)
    elif a < b < c : y = w(a, b, c-1) + w(a, b-1, c-1) - w(a, b-1, c)
    else : y = w(a-1, b, c) + w(a-1, b-1, c) + w(a-1, b, c-1) - w(a-1, b-1, c-1)
    dp[key] = y
    return y

a, b, c = map(int, sys.stdin.readline().rstrip().split())
while not (a==-1 and b==-1 and c==-1) :
    print(f'w({a}, {b}, {c}) = {w(a,b,c)}')
    a, b, c = map(int, sys.stdin.readline().rstrip().split())
