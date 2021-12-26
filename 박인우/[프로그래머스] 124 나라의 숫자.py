def solution(n):
    answer = ''
    while n:
        a = n % 3
        n = n // 3
        answer = "412"[a] + answer
        if a == 0:
            n -= 1
    return answer
