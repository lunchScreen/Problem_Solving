import sys

n = int(sys.stdin.readline())
a, b = 1, n-2
print(n*'*')
for _ in range(1, n-1) :
    print('*', end="")
    [print('*' if a == i or b == i else ' ', end="") for i in range(1, n-1)]
    print('*')
    a+=1; b-=1
if n > 1: print('*'*n)
