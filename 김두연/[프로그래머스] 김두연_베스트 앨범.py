import functools

def comparator(a, b):
    if a[0] > b[0]:
        return 1
    elif a[0] < b[0]:
        return -1
    else:
        if a[1] > b[1]:
            return 1
        elif a[1] < b[1]:
            return -1
        else:
            if a[2] < b[2]:
                return 1
            elif a[2] > b[2]:
                return -1


def solution(genres, plays):
    answer = []
    counter = dict()

    for i in range(len(genres)):
        if not genres[i] in counter:
            counter[genres[i]] = 0
        counter[genres[i]] += plays[i]

    for i in range(len(genres)):
        answer.append([counter[genres[i]], plays[i], i])

    tmp = sorted(answer, key=functools.cmp_to_key(comparator), reverse=True)
    result = []
    before = 0
    counter = 0
    for t in tmp:
        if t[0] != before:
            before = t[0]
            counter = 1
            result.append(t[2])
        elif counter < 2:
            result.append(t[2])
            counter += 1
        else:
            continue
    return result