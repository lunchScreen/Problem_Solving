import re

def solution(dartResult):
    options = re.sub(pattern="[0-9]", string=dartResult, repl=" ").split()
    points = list(map(int, re.sub(pattern="[^0-9]", string=dartResult, repl=" ").split()))
    for (i, (op, po)) in enumerate(zip(options, points)) :
        if op[0] == "S": points[i] = po
        elif op[0] == "D" : points[i] = po ** 2
        else : points[i] = po ** 3
        if len(op) > 1 : 
            if op[1] == "*" : 
                if i > 0 : points[i-1] *= 2
                points[i] *= 2
            else : 
                points[i] *= -1
    return sum(points)
