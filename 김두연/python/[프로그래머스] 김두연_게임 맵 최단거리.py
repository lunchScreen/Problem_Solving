from collections import deque

dx = [1, 0, -1, 0]
dy = [0, 1, 0, -1]

def solution(maps):
    global answer, visited, n, m
    n = len(maps)
    m = len(maps[0])
    answer = 25
    visited = [[False] * m for _ in range(n)]
    bfs(maps, [0, 0, 1])
    return -1 if answer == 25 else answer

def bfs(maps, pos):
    global answer, visited
    dq = deque([pos])
    visited[pos[0]][pos[1]] = True

    while dq:
        x, y, d = dq.popleft()
        if x == n - 1 and y == m - 1:
            answer = d
            return

        for i in range(4):
            nx = x + dx[i]
            ny = y + dy[i]
            nd = d + 1
            if 0 <= nx < n and 0 <= ny < m:
                if maps[nx][ny] == 1 and not visited[nx][ny]:
                    dq.append([nx, ny, nd])
                    visited[nx][ny] = True
    return