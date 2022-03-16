import sys
input = sys.stdin.readline
a, b = map(int, input().strip().split())
result = 0
for i in range(min(a,b), 0, -1) :
    if a%i == 0 and b%i == 0 : 
        result = i
        break
print(result)
print(a*b//result)
