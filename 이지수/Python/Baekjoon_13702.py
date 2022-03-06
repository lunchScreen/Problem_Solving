import sys
input = sys.stdin.readline

n, k = map(int, input().strip().split())
cs = []
l = 0; r = 0
for _ in range(n) :
    c = int(input().strip())
    r = max(c, r)
    if r > 0 : cs.append(c)

def count(mid) :
    cnt = 0
    for c in cs : cnt += c//mid
    return cnt

result = 0
while l <= r :
    mid = (l+r)//2
    if mid == 0 : 
        if r == 0 : break
        else : mid = 1
    if count(mid) >= k : 
        result = mid
        l = mid+1
    else : r = mid-1
print(result)
