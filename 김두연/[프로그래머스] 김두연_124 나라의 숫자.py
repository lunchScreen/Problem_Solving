def solution(n):
    num = ['1', '2', '4']
    answer = ''
    while n > 0:
        n -= 1
        answer = num[n % 3] + answer
        n //= 3
    return answer