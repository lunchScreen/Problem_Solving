def solution(s):
    answer = []
    for i in s:
        if not(answer):
            answer.append(i)
        elif answer[-1] == i:
            answer.pop()
        else:
            answer.append(i)
    return 1 if not(answer) else 0