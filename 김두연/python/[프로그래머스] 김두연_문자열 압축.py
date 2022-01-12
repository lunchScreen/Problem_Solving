def solution(s):
    answer = len(s)
    for i in range(1, len(s) // 2 + 1):
        result = 0
        comp = ''
        c = 1
        for j in range(0, len(s), i):
            tmp = s[j: j + i]
            if comp == tmp:
                c += 1
            else:
                result += len(tmp)
                comp = tmp
                if c > 1:
                    result += len("{}".format(c))
                    c = 1

        if c > 1:
            result += len("{}".format(c))
        answer = min(answer, result)
    return answer