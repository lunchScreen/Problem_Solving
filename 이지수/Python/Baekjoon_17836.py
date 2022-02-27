from collections import deque
import sys
input = sys.stdin.readline

N, M, T = map(int, input().strip().split())
castle = [list(map(int, input().strip().split())) for _ in range(N)]

def bfs() :
    q = deque([(0, 0)])
    visited = [[False] * M for _ in range(N)]
    dist = [[N*M] * M for _ in range(N)]
    dist[0][0] = 0
    sword = (False, N, M, N*M)
    result = (False, N*M)
    while q :
        x1, y1 = q.popleft()
        if visited[x1][y1] : continue
        elif castle[x1][y1] == 2 and not sword[0] : sword = (True, x1, y1, dist[x1][y1])
        elif x1 == N-1 and y1 == M-1 : result = (True, dist[x1][y1])
        elif dist[x1][y1] > T : return (result, sword)
        visited[x1][y1] = True
        for a, b in [(1, 0), (-1, 0), (0, 1), (0, -1)] :
            if 0 <= x1+a < N and 0 <= y1+b < M and castle[x1+a][y1+b] != 1 and not visited[x1+a][y1+b] :
                dist[x1+a][y1+b] = min(dist[x1+a][y1+b], dist[x1][y1]+1)
                q.append((x1+a, y1+b))
    return (result, sword)

result, sword = bfs()
isAvail, dist = result
if sword[0] :
    _, x, y, swordDist  = sword
    time = min(dist, abs(N-1-x)+abs(M-1-y)+swordDist)
    if time <= T : print(time)
    else : print("Fail")
elif not isAvail : print("Fail")
else :
    if dist <= T : print(dist)
    else : print("Fail")
