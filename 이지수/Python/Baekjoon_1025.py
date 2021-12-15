# 1025
import sys

input = sys.stdin.readline
n, m = map(int, input().split())

def getMap(n) :
    inputs = []
    for _ in range(n):
        ip = []
        [ip.append(int(num)) for num in input().rstrip()]
        inputs.append(ip)
    return inputs

def getBiggest(maps, rd, cd) :
    results = [-1]
    for i in range(n) :
        for j in range(m) :
            results.append(getResult(maps, i, j, rd, cd))
    return max(results)

def getResult(maps, tx, ty, rd, cd) :
    results = []
    types = [(-1, -1), (-1, 1), (1, -1), (1, 1)]
    if cd == 0 and rd == 0 :
        return maps[tx][ty] if maps[tx][ty] ** 0.5 % 1 == 0 else -1
    for t in types :
        result = []
        rs = 0
        if rd == 0 :
            i = tx
            for j in range(ty, m if t[1] == 1 else -1, cd * t[1]) :
                rs *= 10
                rs += maps[i][j]
                result.append(rs)
        elif cd == 0 :
            j = ty
            for i in range(tx, n if t[0] == 1 else -1, rd * t[0]) :
                rs *= 10
                rs += maps[i][j]
                result.append(rs)
        else :
            i, j = tx, ty
            while 0 <= i < n and 0 <= j < m :
                rs *= 10
                rs += maps[i][j]
                i += rd * t[0]; j += cd * t[1]
                result.append(rs)
        for rs in result :
            results.append(rs if rs ** 0.5 % 1 == 0 else -1)    
    return max(results)

def solution(n, m) :
    maps = getMap(n)
    biggest = -1
    for i in range(n + 1) :
        for j in range(m + 1) :
            result = getBiggest(maps, i, j) 
            biggest = result if biggest < result else biggest
    return biggest

print(solution(n, m))
