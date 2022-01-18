import sys
from collections import deque
sys.setrecursionlimit(10 ** 5)
input = sys.stdin.readline

t = int(input())

for _ in range(t):
    l = int(input())
    sx, sy = list(map(int, input().split()))
    ex, ey = list(map(int, input().split()))
    
    graph = [[0]*l for _ in range(l)]
    que = deque()
    que.append((sx,sy))
    
    dy = [1,2,2,1,-1,-2,-2,-1]
    dx = [2,1,-1,-2,-2,-1,1,2]
    
    graph[sy][sx] = 1
    
    while que:
        x, y = que.popleft()
        if x == ex and y == ey:
            break
        for i in range(8):
            nx = x + dx[i]
            ny = y + dy[i]
            if 0 <= nx < l and 0 <= ny < l and graph[ny][nx] == 0:
                que.append((nx,ny))
                graph[ny][nx] = graph[y][x] + 1
    
    print(graph[ey][ex]-1)
    
