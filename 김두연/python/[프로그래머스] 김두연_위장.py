from collections import Counter

def solution(clothes):
    answer = 1
    counter = Counter([v for _, v in clothes])

    for v in counter.values():
        answer *= (v + 1)

    return answer - 1