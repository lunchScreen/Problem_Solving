import math

def solution(progresses, speeds):
    answer = []
    rest = [math.ceil((100 - value) / speeds[index]) for index, value in enumerate(progresses)]

    count = 0
    tmp = rest[0]
    for day in rest:
        if day <= tmp:
            count += 1
        else:
            answer.append(count)
            count = 1
            tmp = day
    answer.append(count)
    return answer