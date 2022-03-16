import sys
input = sys.stdin.readline

n = int(input().strip())
def fibo(n) :
    a, b = 0, 1
    for _ in range(n-1) : a, b = b, (a+b)%1000000007
    return b
if n < 2 : print(n)
else : print(fibo(n))
