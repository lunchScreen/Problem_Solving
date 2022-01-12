from collections import deque

def solution(cacheSize, cities):
    answer = 0
    dq = deque(maxlen=cacheSize)

    for city in cities:
        name = city.lower()

        if name in dq:
            dq.remove(name)
            dq.append(name)
            answer += 1
        else:
            dq.append(name)
            answer += 5

    return answer