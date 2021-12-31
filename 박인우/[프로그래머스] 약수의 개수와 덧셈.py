def solution(left, right):
    list = [0]*1001
    answer = 0
    for i in range(1, right+1):
        for j in range(i, right+1, i):
            list[j] += 1
    for i in range(left, right+1):
        if list[i] % 2 == 0:
            answer += i
        else:
            answer -= i
    return answer
