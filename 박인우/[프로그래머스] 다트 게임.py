def solution(dartResult):
    list = []
    point = 0
    for i in range(len(dartResult)):
        if ord('0') <= ord(dartResult[i]) <= ord('9'):
            if i > 0 and ord('0') <= ord(dartResult[i-1]) <= ord('9'):
                point = 10
            else:
                list.append(point)
                point = int(dartResult[i])
        elif dartResult[i] == "S":
            pass
        elif dartResult[i] == "D":
            point = point ** 2
        elif dartResult[i] == "T":
            point = point ** 3
        elif dartResult[i] == "#":
            point = -point
        else:
            list[-1] = list[-1]*2
            point = point*2
    list.append(point)
    return sum(list)
