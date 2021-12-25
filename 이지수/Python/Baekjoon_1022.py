import sys
import math
input = sys.stdin.readline

def lefttop(n) :
    return ((n*2)+1)**2 - 4*n

def rightbottom(n) :
    return ((n*2)+1)**2

def loc(a,b) :
    m = max(abs(a), abs(b))
    if a == -m or b == -m : return lefttop(m)+a-b
    elif a == m : return rightbottom(m)-m+b
    else: return rightbottom(m-1)+m-a

r1, c1, r2, c2 = map(int, input().split())
m = int(math.log10(max([loc(r2,c1), loc(r2,c2), loc(r1, c1), loc(r1, c2)]))) + 1
for r in range(r1, r2+1):
    for c in range(c1, c2+1):
        print(f"%{m}d"%loc(r,c), end=" ")
    print("")
