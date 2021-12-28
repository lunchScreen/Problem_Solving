def solution(numbers, hand):
    priority = 0 if hand == "left" else 1
    numbers = [num if num != 0 else 11 for num in numbers]
    p = [10, 12]
    answer = ''
    for num in numbers :
        n = num % 3 
        if n == 1 : p[0] = num; answer+='L'
        elif n == 0 : p[1] = num; answer+='R'
        else : 
            pos = closer(diff(num, p[0]), diff(num, p[1]), priority)
            p[pos] = num; answer+='L' if pos == 0 else 'R'
    return answer

def diff(num, p) :
    num -= 1; p -= 1
    return abs(num//3-p//3) + abs(p%3-num%3)

def closer(a, b, d) :
    if a != b : return 0 if a < b else 1
    else : return d
