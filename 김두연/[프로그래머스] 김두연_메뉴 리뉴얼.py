from collections import Counter
from itertools import combinations

def solution(orders, course):
    answer = []
    for course_num in course:
        comb = []
        for order in orders:
            comb += combinations(sorted(order), course_num)

        counter = Counter(comb).most_common()
        answer += [k for k, v in counter if v > 1 and v == counter[0][1]]

    return [''.join(v) for v in sorted(answer)]