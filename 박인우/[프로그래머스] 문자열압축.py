def solution(s):
    minimum = len(s)
    for st in range(1,len(s)//2+1):
        i = 0
        now = len(s)
        flag = 1
        while i < len(s):
            if s[i:i+st] == s[i+st:i+st+st]:
                now -= st
                if flag:
                    now += 1
                flag = 0
            else:
                flag = 1
            i += st
        minimum = min(minimum,now) 
        print(st, minimum)
    return minimum
