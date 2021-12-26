def solution(scoville, K):
    answer = 0
    scoville.sort()
    while scoville[0] < K:
        if len(scoville) < 2:
            return -1
        a = scoville.pop(0)
        b = scoville.pop(0)
        new = a + b*2
        scoville.append(new)
        scoville.sort()
        answer += 1
    return answer
