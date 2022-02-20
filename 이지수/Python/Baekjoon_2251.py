from collections import deque
import sys
input = sys.stdin.readline

a, b, c = map(int, input().strip().split())
def bfs(a, b, c) :
    v = [[[False] * (c+1) for _ in range(b+1)] for _ in range(a+1)]
    q = deque([(0, 0, c)])
    while q :
        a1, b1, c1 = q.popleft()
        if v[a1][b1][c1]: continue
        v[a1][b1][c1]= True
        if a1 > 0 :
            if a1 >= b-b1 : q.append((a1-b+b1, b, c1))
            else : q.append((0, b1+a1, c1))
            if a1 >= c-c1 : q.append((a1-c+c1, b1, c))
            else : q.append((0, b1, c1+a1))
        if b1 > 0 :
            if b1 >= a-a1 : q.append((a, b1-a+a1, c1))
            else : q.append((a1+b1, 0, c1))
            if b1 >= c-c1 : q.append((a1, b1-c+c1, c))
            else : q.append((a1, 0, c1+b1))
        if c-a1-b1 > 0 :
            if c1 >= a-a1 : q.append((a, b1, c1-a+a1))
            else : q.append((a1+c1, b1, 0))
            if c1 >= b-b1 : q.append((a1, b, c1-b+b1))
            else : q.append((a1, b1+c1, 0))

    result = set()
    for b1 in range(b+1) :
        for c1 in range(c+1) :
            if v[0][b1][c1] : result.add(c1)
    return sorted(list(result))
[print(r, end=' ') for r in bfs(a,b,c)]
