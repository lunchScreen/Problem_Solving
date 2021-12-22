from bisect import bisect_left
from itertools import combinations

def solution(info, query):
    answer = []
    info_map = {}

    for i in info:
        info_split = i.split()
        _info = info_split[:-1]
        score = int(info_split[-1])

        for j in range(5):
            for t in list(combinations(_info, j)):
                idx = ''.join(t)
                if idx in info_map:
                    info_map[idx].append(score)
                else:
                    info_map[idx] = [score]

    for idx in info_map:
        info_map[idx].sort()
    for q in query:
        split = [k for k in q.split() if k != 'and' and k != '-']
        key = ''.join(split[:-1])

        if key in info_map:
            idx = bisect_left(info_map[key], int(split[-1]))
            answer.append(len(info_map[key]) - idx)
        else:
            answer.append(0)
    return answer