import sys
input = sys.stdin.readline

def primes() :
    result = [True for _ in range(10001)]
    for i in range(2, 10001) :
        for j in range(i*2, 10001, i) : result[j] = False

    prime = []
    [prime.append(i) for i in range(2, 10001) if result[i]]
    return prime
prime = primes()

def isPrime(num) :
    for i in prime :
        if i >= num : break
        elif not num % i : return False
    return True

def partition(num) :
    a, b = num//2, num//2
    while b > 0 and not (isPrime(a) and isPrime(b)): 
        if not a % 2 : a += 1; b -= 1
        else : a += 2; b -= 2
    return b, a

for _ in range(int(input().strip())) :
    a, b = partition(int(input().strip()))
    print(a, b)
