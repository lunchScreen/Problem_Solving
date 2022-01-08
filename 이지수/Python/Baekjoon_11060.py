import sys
imput = sys.stdin.readline

def dp():
    for i in range(n) :
        for j in range(i+1, min(i+a[i]+1, n)) :
            l[j] = min(l[j], l[i]+1)

n = int(input())
l = [1001] * n; l[0] = 0
a = list(map(int, input().split()))
dp()
print(l[-1] if l[-1] <= 1000 else -1)
