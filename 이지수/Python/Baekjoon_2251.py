from collections import deque
import sys
input = sys.stdin.readline

a, b, c = map(int, input().strip().split())
def bfs(a, b, c) :
    v = [[False] * (b+1) for _ in range(a+1)]
    q = deque([(0, 0)])
    while q :
        a1, b1 = q.popleft()
        if v[a1][b1]: continue
        v[a1][b1]= True
        if a1 > 0 :
            if a1 >= b-b1 : q.append((a1-b+b1, b))
            else : q.append((0, b1+a1))
            if a1 >= a1+b1 : q.append((b1, b1))
            else : q.append((0, b1))
        if b1 > 0 :
            if b1 >= a-a1 : q.append((a, b1-a+a1))
            else : q.append((a1+b1, 0))
            if b1 >= a1+b1 : q.append((a1, a1))
            else : q.append((a1, 0))
        if c-a1-b1 > 0 :
            if c-b1 >= a : q.append((a, b1))
            else : q.append((c-b1, b1))
            if c-a1 >= b : q.append((a1, b))
            else : q.append((a1, c-a1))

    result = set()
    for b1 in range(b+1) :
        if v[0][b1] : result.add(c-b1)
    return sorted(list(result))
[print(r, end=' ') for r in bfs(a,b,c)]
