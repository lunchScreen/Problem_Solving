from itertools import permutations

def solution(numbers):
    answer = []
    for i in range(1, len(numbers)+1):
        for j in set(permutations(numbers, i)):
            number = int(''.join(j))
            if isPrime(number):
                answer.append(number)
    return len(set(answer))

def isPrime(number):
    if number < 2:
        return False
    for i in range(2, int(number**0.5)+1):
        if number % i == 0:
            return False
    return True