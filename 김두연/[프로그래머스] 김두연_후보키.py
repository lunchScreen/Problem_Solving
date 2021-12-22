from itertools import combinations

def solution(relation):
    answer = []
    cand = []
    for i in range(1, len(relation) + 1):
        cand.extend(combinations(range(len(relation[0])), i))

    for c in cand:
        l = [tuple(record[idx] for idx in c) for record in relation]
        if len(set(l)) == len(relation):
            is_dup = False
            for i in answer:
                if set(i).issubset(set(c)):
                    is_dup = True
                    break
            if not is_dup:
                answer.append(c)

    return len(answer)