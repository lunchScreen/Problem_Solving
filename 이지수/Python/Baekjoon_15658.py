import sys
input = sys.stdin.readline
n = int(input().strip())
ns = list(map(int, input().strip().split()))
ot = list(map(int, input().strip().split()))
def f(a, b, c, d, y, i) :
    if i == n : return [y, y]
    l = []
    if a > 0 : l.extend(f(a-1, b, c, d, y+ns[i], i+1))
    if b > 0 : l.extend(f(a, b-1, c, d, y-ns[i], i+1))
    if c > 0 : l.extend(f(a, b, c-1, d, y*ns[i], i+1))
    if d > 0 : 
        if y < 0 : l.extend(f(a, b, c, d-1, -(abs(y)//ns[i]), i+1))
        else : l.extend(f(a, b, c, d-1, y//ns[i], i+1))
    return [max(l), min(l)]
r = f(ot[0], ot[1], ot[2], ot[3], ns[0], 1)
print(r[0])
print(r[1])
