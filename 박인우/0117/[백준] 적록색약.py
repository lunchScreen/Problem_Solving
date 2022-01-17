import sys
from collections import deque
sys.setrecursionlimit(10 ** 5)
input = sys.stdin.readline

n = int(input())
colors = []
for _ in range(n):
    new = list(input())[:-1]
    colors.append(new)
visit = [[True] * n for _ in range(n)]

def bfs(x, y):
    global colors
    que = deque()
    que.append((x, y))
    dy = [0, 0, 1, -1]
    dx = [1, -1, 0, 0]
    visit[y][x] = False
    while que:
        x, y = que.popleft()
        for i in range(4):
            nx = x + dx[i]
            ny = y + dy[i]
            if 0 <= nx < n and 0 <= ny < n and colors[ny][nx] == colors[y][x] and visit[ny][nx]:
                que.append((nx,ny))
                visit[ny][nx] = False
    
result = 0
for i in range(n):
    for j in range(n):
        if visit[i][j]:
            bfs(j,i)
            result += 1

visit = [[True] * n for _ in range(n)]

for i in range(n):
    for j in range(n):
        if colors[i][j] == "G":
            colors[i][j] = "R"
            
result2 = 0
for i in range(n):
    for j in range(n):
        if visit[i][j]:
            bfs(j,i)
            result2 += 1

print(result, result2)
