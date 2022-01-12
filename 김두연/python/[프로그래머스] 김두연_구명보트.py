def solution(people, limit):
    answer = 0
    people.sort()
    i = 0
    j = len(people) - 1

    while i < j:
        if people[j] + people[i] <= limit:
            answer += 1
            j -= 1
            i += 1
        else:
            answer += 1
            j -= 1
    if i == j:
        answer += 1

    return answer