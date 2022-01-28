import sys
input = sys.stdin.readline
n, k = map(int, input().strip().split())
a = list(map(int, input().strip().split()))
l = 0
r = k-1
c = a[0:k].count(1)
result = n+1
while r < n :
    if c < k :
        r += 1
        if r < n and a[r] == 1 : c += 1
    else :
        if c == k : result = min(result, r-l+1)
        if a[l] == 1 : c -= 1
        l += 1
print(result if result <= n else -1)
