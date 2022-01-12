import re
from itertools import permutations

def solution(expression):
    op = [c for c in ["+", "-", "*"] if c in expression]
    op = [a for a in permutations(op)]
    ex = re.split(r'(\D)', expression)
    answer = 0

    for c in op:
        tmp_ex = ex[:]
        for _c in c:
            while _c in tmp_ex:
                idx = tmp_ex.index(_c)
                tmp_ex[idx - 1] = str(eval(tmp_ex[idx - 1] + tmp_ex[idx] + tmp_ex[idx + 1]))
                tmp_ex = tmp_ex[:idx] + tmp_ex[idx + 2:]

        answer = max(answer, abs(int(tmp_ex[-1])))

    return answer