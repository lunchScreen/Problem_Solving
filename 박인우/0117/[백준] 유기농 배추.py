import sys
from collections import deque
sys.setrecursionlimit(10 ** 5)
input = sys.stdin.readline
t = int(input())

def bfs(x, y):
    global cabbage
    que = deque()
    que.append((x, y))
    dy = [0, 0, 1, -1]
    dx = [1, -1, 0, 0]
    while que:
        x, y = que.popleft()
        cabbage[y][x] = 0
        for t in range(4):
            nx = x + dx[t]
            ny = y + dy[t]
            if 0 <= nx < m and 0 <= ny < n and cabbage[ny][nx] == 1:
                que.append((nx, ny))
                cabbage[ny][nx] = 0

for _ in range(t):
    result = 0
    m, n, k = list(map(int, input().split()))
    cabbage = [[0 for _ in range(m)] for _ in range(n)]
    for _ in range(k):
        x, y = list(map(int, input().split()))
        cabbage[y][x] = 1
    for i in range(n):
        for j in range(m):
            if cabbage[i][j] == 1:
                bfs(j, i)
                result += 1
    print(result)
