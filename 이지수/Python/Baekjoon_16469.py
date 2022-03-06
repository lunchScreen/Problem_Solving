import sys
from collections import deque
input = sys.stdin.readline

r, c = map(int, input().strip().split())
miro = [[int(l) for l in input().strip()] for _ in range(r)]

def bfs(x, y) :
    visited = [[False] * c for _ in range(r)]
    dists = [[float('inf')] * c for _ in range(r)]
    dists[x][y] = 0
    q = deque([(x, y)])
    while q :
        cx, cy = q.popleft()
        if visited[cx][cy] : continue
        visited[cx][cy] = True
        dist = dists[cx][cy] + 1
        for nx, ny in [(cx+1, cy), (cx-1, cy), (cx, cy+1), (cx, cy-1)] :
            if not (0 <= nx < r and 0 <= ny < c) : continue
            elif miro[nx][ny] or visited[nx][ny] : continue
            dists[nx][ny] = dist
            q.append((nx, ny))
    return dists

dists = []
for _ in range(3) :
    x, y = map(int, input().strip().split())
    dists.append(bfs(x-1, y-1))
minValue = float('inf')
minCount = 0
for x in range(r) :
    for y in range(c) :
        value = max([dists[0][x][y], dists[1][x][y], dists[2][x][y]])
        if value < minValue :
            minValue = value
            minCount = 1
        elif value == minValue : minCount += 1
if minValue < float('inf') :
    print(minValue)
    print(minCount)
else : print(-1)
