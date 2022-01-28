import sys
input = sys.stdin.readline
n, k, b = map(int, input().strip().split())
m = [True for _ in range(n)]
for _ in range(b) : m[int(input().strip())-1] = False
l = 0
r = 1
broken = m[0:2].count(False)
result = n
while r < n :
    if r-l+1 >= k : 
        if r-l+1 == k : result = min(result, broken)
        if not m[l] : broken -= 1
        l += 1
    elif r-l+1 < k : 
        r += 1
        if r != n and not m[r] : broken += 1
print(result)
