import sys
from collections import deque
input = sys.stdin.readline
r, c = map(int, input().strip().split())
om = []
if c == 1 : om = [[int(input().strip())] for _ in range(r)]
else : om = [list(input().strip()) for _ in range(r)]

def findBessie() :
    for x in range(r) :
        for y in range(c) :
            if om[x][y] == 'C' : return (x, y)

br, bc = findBessie()
def bfs(br, bc) :
    v = [[False] * c for _ in range(r)]
    d = [[r*c] * c for _ in range(r)]
    q = deque([(br, bc)])
    d[br][bc] = 0
    while q :
        x, y = q.popleft()
        if v[x][y] : continue
        elif om[x][y] == 'B' : return d[x][y]
        v[x][y] = True
        for a, b in [(-1, 0), (1, 0), (0, 1), (0, -1)] :
            if 0<=x+a<r and 0<=y+b<c and om[x+a][y+b] in ['.', 'B'] and not v[x+a][y+b]:
                d[x+a][y+b] = min(d[x+a][y+b], d[x][y]+1)
                q.append((x+a, y+b))
print(bfs(br, bc))
