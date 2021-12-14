def solution(p):
    return change(p)

def change(p):
    if not p:
        return ''
    else:
        u, v = split(p)
        if isCorrect(u):
            return u + change(v)
        else:
            tmp = '(' + change(v) + ')'
            return tmp + reverse(u[1:-1])

def reverse(p):
    answer = ''
    for c in p:
        answer += '(' if c == ')' else ')'
    return answer

def split(p):
    u, v = p, ""
    for i in range(2, len(p)):
        if isBalance(p[:i]):
            u = p[:i]
            v = p[i:]
            break
    return u, v

def isBalance(p):
    return p.count('(') == p.count(')')

def isCorrect(p):
    count = 0
    for c in p:
        if c == '(':
            count += 1
        else:
            count -= 1
        if count < 0:
            return False
    return count == 0