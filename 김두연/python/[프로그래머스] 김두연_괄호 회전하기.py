check = {')': '(', '}': '{', ']': '['}

def solution(s):
    answer = 0
    for i in range(len(s)):
        if isCorrect(s[i:] + s[:i]):
            answer += 1

    return answer


def isCorrect(s):
    l = []
    for c in s:
        if not l:
            l.append(c)
        else:
            if c in check:
                if check[c] == l[-1]:
                    l.pop()
                else:
                    l.append(c)
            else:
                l.append(c)

    return False if l else True