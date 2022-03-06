import sys
input = sys.stdin.readline
_, l = map(int, input().strip().split())
hs = sorted(list(map(int, input().strip().split())))
for h in hs :
    if l >= h : l+=1
    else : break
print(l)
