import sys
import math
input = sys.stdin.readline

def isPrime(num) :
    if num < 3 : return num == 2
    for i in range(2, math.ceil(math.sqrt(num))+1) :
        if num % i == 0 : return False 
    return True

m, n = map(int, input().split())
for num in range(m, n+1) :
    if isPrime(num) : print(num)
