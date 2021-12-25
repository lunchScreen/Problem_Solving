def solution(N, stages):
    levels = [0] * (N + 1)
    for stage in stages :
        levels[stage-1] += 1
    n = sum(levels)
    levels = levels[:-1]
    failures = []
    for count in levels :
        if count == 0 : failures.append(0)
        else : failures.append(float(count)/float(n))
        n -= count
    failures = list(sorted(sorted(enumerate(failures), key=lambda x : x[0]), key=lambda x : x[1], reverse=True))
    return [index+1 for index, _ in failures]
