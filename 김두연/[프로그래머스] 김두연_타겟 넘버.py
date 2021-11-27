from itertools import product

def solution(numbers, target):
    tmp = [(x, -x) for x in numbers]
    result = list(map(sum, product(*tmp)))
    return result.count(target)