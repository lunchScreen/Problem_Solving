import sys
input = sys.stdin.readline
def fibo(k) :
    f = [1, 1, 1]
    while len(f) < d : f.append(f[-1]+f[-2])
    return (f[-1], f[-2])
d, k = map(int, input().strip().split())
a, b = fibo(k)
for i in range(k//2) :
    j = (k-b*i)/a
    if j > 0 and j == int(j) : 
        print(i)
        print(int(j))
        exit(0)
